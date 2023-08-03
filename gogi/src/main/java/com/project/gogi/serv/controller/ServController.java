package com.project.gogi.serv.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.gogi.common.base.BaseController;
import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.serv.domain.CommentVO;
import com.project.gogi.serv.domain.Criteria3;
import com.project.gogi.serv.domain.PageMaker3;
import com.project.gogi.serv.domain.ServImageFileVO;
import com.project.gogi.serv.domain.ServVO;
import com.project.gogi.serv.service.ServService;

@Controller
@RequestMapping("/serv")
public class ServController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(ServController.class);

	@Autowired
	ServService servService;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private ServVO servVO;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CommentVO commentVO;

	// 파일 저장 위치

	private static final String GOGI_IMAGE_REPO_PATH1 = "C:\\meatrule\\file_repo\\servBoard";

	// 공지사항~
	// 게시물 목록 +페이징
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String getServList(Model model, Criteria3 cri, HttpServletRequest request, HttpServletResponse response,
			ServVO vo) throws Exception {

		logger.info("리스트 페이지 가져오기");

		List<ServVO> servList = new ArrayList<ServVO>();
		servList = servService.ServList(cri);
		// 서버에서 날짜를 원하는 형식("yyyy. M. d")으로 변환하여 Model에 추가
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy. M. d");
		for (ServVO serv : servList) {
			serv.setCust_serv_dateStr(dateFormat.format(serv.getCust_serv_date()));
		}
		model.addAttribute("servList", servList);

		// 게시판 페이징 가져오기.
		PageMaker3 pageMaker = new PageMaker3();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(servService.ServListCount());
		model.addAttribute("pageMaker3", pageMaker);

		// 8.1 추가 로그인 확인
		Boolean isLogOn = (Boolean) httpSession.getAttribute("isLogon");
		// 로그인 상태만 읽기 가능하게 하기
		if (isLogOn != null && isLogOn) {
			memberVO = (MemberVO) httpSession.getAttribute("memberInfo");
			System.out.println("세션:" + memberVO);
			String mem_id = memberVO.getMem_id();
			System.out.println("멤버아이디" + mem_id);
			System.out.println("로그인 여부: " + isLogOn);
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("isLogOn", isLogOn);
			System.out.println("확인중");
		}

		return "serv/servList";

	}

	// 게시물 작성 get
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String getServWrite(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		// 8.1 구태선 추가
		Boolean isLogOn = (Boolean) httpSession.getAttribute("isLogon"); // 로그인 여부

		if (isLogOn != null && isLogOn) { // 로그인 상태 아니여도 공지사항 읽기 가능
			memberVO = (MemberVO) httpSession.getAttribute("memberInfo");
			String mem_id = memberVO.getMem_id();
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("isLogOn", isLogOn);
			System.out.println("고객센터 글작성 아이디 확인" + mem_id);
		} // 추가 end

		return "serv/servWrite";
	}

	// 게시물 작성 post+다중이미지 게시
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String postServWrite(ServVO vo, MultipartHttpServletRequest multipartRequest, HttpServletResponse response,
			RedirectAttributes redirectAttrs) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName = null;

		// 매개변수 정보와 파일 정보를 저장할 Map 생성
		Map<String, Object> servMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();

		// 전송된 매개변수 값 key/value로 map에 저장
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			servMap.put(name, value);
			System.out.println("name: " + name + " / value: " + value);
		}

		// 다중 이미지 구현 중
		// 파일 업로드 후 반환된 파일 이름이 저장된 fileList에 다시 map에 저장

		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

		// 로그인 ID를 가져옵니다.
		String reg_id = memberVO.getMem_id();

		List<ServImageFileVO> imageFileList = upload1(multipartRequest);

		if (imageFileList != null && imageFileList.size() != 0) {
			for (ServImageFileVO servImageFileVO : imageFileList) {
				servImageFileVO.setReg_id(reg_id);
				System.out.println("여길 타고 있니?" + reg_id);
			}
			servMap.put("imageFileList", imageFileList);
			System.out.println(imageFileList.toString());
		}

		try {
			// 상품 정보와 이미지 정보를 각 테이블에 추가합니다.
			int cust_serv_no = servService.ServWrite(servMap);
			System.out.println("컨트롤러: " + cust_serv_no);
			// 업로드한 이미지를 상품번호 폴더에 저장합니다.
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ServImageFileVO servImageFileVO : imageFileList) {
					imageFileName = servImageFileVO.getImg_name();
					System.out.println("컨트롤러 이미지 파일네임: " + imageFileName);
					File srcFile = new File(GOGI_IMAGE_REPO_PATH1 + "\\" + imageFileName);
					File destDir = new File(GOGI_IMAGE_REPO_PATH1 + "\\" + cust_serv_no);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ServImageFileVO servImageFileVO : imageFileList) {
					imageFileName = servImageFileVO.getImg_name();
					File srcFile = new File(GOGI_IMAGE_REPO_PATH1 + "\\" + imageFileName);
					srcFile.delete();
				}
			}
		}

		// 요청 처리 후 servList.jsp로 리다이렉트합니다.
		redirectAttrs.addFlashAttribute("message", "글 작성이 완료되었습니다.");

		return "redirect:/serv/list.do";
	}

	// 게시물 조회 + 조회수 중복방지
	@RequestMapping(value = "/read.do", method = RequestMethod.GET)
	public String getServView(@RequestParam("cust_serv_no") int cust_serv_no, Model model, ServVO vo) throws Exception {

		// 구분 객체 생성, 세션 값 가져오기 (getAttribute : 세션에서 대이터 가져올때 사용), 저장
		// set : 객체 중복 x
		Set<Integer> serv_noViewHits = (Set<Integer>) httpSession.getAttribute("serv_noViewHits");

		// 초기 notice_noViewHits null일 때 처리 / 값 만들기...
		// hashSet 데이터 중복x , 순서 상관 없음 (하나라 괜츈)
		if (serv_noViewHits == null) {
			serv_noViewHits = new HashSet<>();
			httpSession.setAttribute("serv_noViewHits", serv_noViewHits);
		}

		// notice_noViewHits에 들어있지 않은 값일 때 처리하는 로직-최조 클릭 게시물 조회수 +1 증가 후
		// notice_noViewHits에 해당 notice_no 저장
		if (!serv_noViewHits.contains(cust_serv_no)) {
			servService.updateServViewCnt(cust_serv_no);
			serv_noViewHits.add(cust_serv_no);
		}

		// 게시물 조회
		Map<String, Object> servMap = servService.ServRead(cust_serv_no);
		model.addAttribute("servMap", servMap);

		return "serv/servRead";
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String getServDelete(@RequestParam("cust_serv_no") int cust_serv_no) throws Exception {

		servService.ServDelete(cust_serv_no);
		return "redirect:/serv/list.do";
	}

	// 게시물 수정 페이지 이동
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String getServModify(@RequestParam("cust_serv_no") int cust_serv_no, Model model) throws Exception {
		Map<String, Object> servMap = servService.ServRead(cust_serv_no);
		model.addAttribute("servMap", servMap);
		System.out.println("게시물수정:" + servMap.toString());
		return "serv/servModify";
	}

	// 게시물 수정 처리
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String postServModify(ServVO vo) throws Exception {
		servService.ServUpdate(vo);
		int cust_serv_no = vo.getCust_serv_no();
		return "serv/read.do?cust_serv_no=" + cust_serv_no;
	}

	@RequestMapping(value = "/addComment.do", method = RequestMethod.POST)
	@ResponseBody
	public String addComment(@ModelAttribute("CommentVO") CommentVO commentVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		try {
			if (memberVO != null) {
				commentVO.setMem_id(memberVO.getMem_id());
				servService.addComment(commentVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	@RequestMapping(value="/addReply.do", method=RequestMethod.POST)
	@ResponseBody
	 public String addReply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		 	CommentVO CommentVO = new CommentVO();
		 	HttpSession session = request.getSession();
		 	int cust_serv_no = (int)session.getAttribute("cust_serv_no");	
		 	String mem_id = null;
		 	
			MemberVO memberVO = (MemberVO) session.getAttribute("mem_id");
			mem_id = memberVO.getMem_id();
			
			String rc = request.getParameter("cmt_parent_num");
			
			CommentVO.setCust_serv_no(cust_serv_no);
		 	CommentVO.setCmt_parent_num(Integer.parseInt(rc));
		 	CommentVO.setCmt_content(request.getParameter("cmt_content"));
		 	CommentVO.setMem_id(mem_id);
		 	
			try {
				if (memberVO != null) {
					commentVO.setMem_id(memberVO.getMem_id());
					servService.addComment(commentVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "success";
		}

	@RequestMapping(value = "/commentList.do", produces = "application/json; charset=utf8", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity commentList(@ModelAttribute("CommentVO") CommentVO commentVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		List<CommentVO> commentList = servService.selectBoardCommentByCode(commentVO);

		if (commentList.size() > 0) {
			for (int i = 0; i < commentList.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("cust_serv_no", commentList.get(i).getCust_serv_no());
				hm.put("cmt_content", commentList.get(i).getCmt_content());
				hm.put("cmt_date", commentList.get(i).getCmt_date());
				hm.put("mem_id", commentList.get(i).getMem_id());

				hmlist.add(hm);
			}
		}
		JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}

}
