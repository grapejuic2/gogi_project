package com.project.gogi.common.file;


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static final String GOGI_IMAGE_REPO="C:\\meatrule\\file_repo";
	
	@RequestMapping(value="/download")
	protected void download(@RequestParam("fileName") String fileName, @RequestParam("goods_id") int goods_id, HttpServletResponse response) throws Exception {
		OutputStream out=response.getOutputStream();
		String filePath=GOGI_IMAGE_REPO+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);
		
		response.setHeader("Cache-Controle", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in = new FileInputStream(image);
		byte[] buffer=new byte[1024*8];
		while(true) {
			int count=in.read(buffer);
			if(count==1)
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String fileName,
							  @RequestParam("goods_id") String goods_id,
							  HttpServletResponse response) throws Exception{
		OutputStream out=response.getOutputStream();
		String filePath=GOGI_IMAGE_REPO+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);
		int lastIndex=fileName.lastIndexOf(".");
		String imageFileName=fileName.substring(0, lastIndex);
		if(image.exists()) {
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer=new byte[1024*8];
		out.write(buffer);
		out.close();
		}
		
	}

