package com.kh.researchbank.Auth.Register.vo;

public class KakaoVO {
	String member_id;
	String member_pw;
	String member_nickname;
	int member_point;
	int role_id;
	
	/*
	 * public void resultMap (String member_id, String member_pw, String
	 * member_nickname, int member_point, int role_id){ this.member_id=member_id;
	 * this.member_pw=member_pw; this.member_nickname=member_nickname;
	 * this.member_point=member_point; this.role_id=role_id; }
	 */

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
}