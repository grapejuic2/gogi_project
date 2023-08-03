package com.project.gogi.social;

import lombok.Data;

@Data
public class KakaoDTO {

	private String k_number;
	private String k_name;
	private String k_email;
	
	//카카오 메세지 전송
	private String objType;
	private String text;
	private String webUrl;
	private String mobileUrl;
	private String btnTitle;
	
	public String getK_number() {
		return k_number;
	}
	public void setK_number(String k_number) {
		this.k_number = k_number;
	}
	public String getK_name() {
		return k_name;
	}
	public void setK_name(String k_name) {
		this.k_name = k_name;
	}
	public String getK_email() {
		return k_email;
	}
	public void setK_email(String k_email) {
		this.k_email = k_email;
	}
	public String getObjType() {
		return objType;
	}
	public void setObjType(String objType) {
		this.objType = objType;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getWebUrl() {
		return webUrl;
	}
	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}
	public String getMobileUrl() {
		return mobileUrl;
	}
	public void setMobileUrl(String mobileUrl) {
		this.mobileUrl = mobileUrl;
	}
	public String getBtnTitle() {
		return btnTitle;
	}
	public void setBtnTitle(String btnTitle) {
		this.btnTitle = btnTitle;
	}
	
}
