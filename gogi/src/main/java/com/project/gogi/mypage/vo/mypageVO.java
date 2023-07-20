package com.project.gogi.mypage.vo;

import org.springframework.stereotype.Component;

@Component
public class mypageVO {
	private String myp_id;
	private String myp_pw;
	private String myp_name;
	private String myp_birth_y;
	private String myp_birth_m;
	private String myp_birth_d;
	private String myp_tel1;
	private String myp_tel2;
	private String myp_tel3;
	private String myp_reg_date;
	private String myp_email;
	private String myp_del_yn;
	
	public mypageVO() {}

	public String getMyp_id() {
		return myp_id;
	}

	public void setMyp_id(String myp_id) {
		this.myp_id = myp_id;
	}

	public String getMyp_pw() {
		return myp_pw;
	}

	public void setMyp_pw(String myp_pw) {
		this.myp_pw = myp_pw;
	}

	public String getMyp_name() {
		return myp_name;
	}

	public void setMyp_name(String myp_name) {
		this.myp_name = myp_name;
	}

	public String getMyp_birth_y() {
		return myp_birth_y;
	}

	public void setMyp_birth_y(String myp_birth_y) {
		this.myp_birth_y = myp_birth_y;
	}

	public String getMyp_birth_m() {
		return myp_birth_m;
	}

	public void setMyp_birth_m(String myp_birth_m) {
		this.myp_birth_m = myp_birth_m;
	}

	public String getMyp_birth_d() {
		return myp_birth_d;
	}

	public void setMyp_birth_d(String myp_birth_d) {
		this.myp_birth_d = myp_birth_d;
	}

	public String getMyp_tel1() {
		return myp_tel1;
	}

	public void setMyp_tel1(String myp_tel1) {
		this.myp_tel1 = myp_tel1;
	}

	public String getMyp_tel2() {
		return myp_tel2;
	}

	public void setMyp_tel2(String myp_tel2) {
		this.myp_tel2 = myp_tel2;
	}

	public String getMyp_tel3() {
		return myp_tel3;
	}

	public void setMyp_tel3(String myp_tel3) {
		this.myp_tel3 = myp_tel3;
	}

	public String getMyp_reg_date() {
		return myp_reg_date;
	}

	public void setMyp_reg_date(String myp_reg_date) {
		this.myp_reg_date = myp_reg_date;
	}

	public String getMyp_del_yn() {
		return myp_del_yn;
	}

	public void setMyp_del_yn(String myp_del_yn) {
		this.myp_del_yn = myp_del_yn;
	}

	public String getMyp_email() {
		return myp_email;
	}

	public void setMyp_email(String myp_email) {
		this.myp_email = myp_email;
	}

	public mypageVO(String myp_id, String myp_pw, String myp_name, String myp_birth_y, String myp_birth_m,
			String myp_birth_d, String myp_tel1, String myp_tel2, String myp_tel3, String myp_reg_date,
			String myp_email, String myp_del_yn) {
		
		this.myp_id = myp_id;
		this.myp_pw = myp_pw;
		this.myp_name = myp_name;
		this.myp_birth_y = myp_birth_y;
		this.myp_birth_m = myp_birth_m;
		this.myp_birth_d = myp_birth_d;
		this.myp_tel1 = myp_tel1;
		this.myp_tel2 = myp_tel2;
		this.myp_tel3 = myp_tel3;
		this.myp_reg_date = myp_reg_date;
		this.myp_email = myp_email;
		this.myp_del_yn = myp_del_yn;
	}
	
}
