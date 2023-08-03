package com.project.gogi.social;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CustomMessageService {

	@Autowired
	MessageService messageService;

	public boolean sendMyMessage() {
		KakaoDTO myMsg = new KakaoDTO();
		myMsg.setBtnTitle("자세히보기");
		myMsg.setMobileUrl("");
		myMsg.setObjType("text");
		myMsg.setWebUrl("");
		myMsg.setText("메시지 테스트입니다.");

		String accessToken = AuthService.authToken;

		return messageService.sendMessage(accessToken, myMsg);
	}
}