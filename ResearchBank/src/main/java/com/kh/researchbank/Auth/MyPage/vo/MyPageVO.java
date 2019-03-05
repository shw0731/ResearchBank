package com.kh.researchbank.Auth.MyPage.vo;

public class MyPageVO {
	
	private String member_id;
	private String member_pw;
	private String member_nickname;
	private int member_point=0;
	private int member_gender;
	private String member_address;
	private int member_marry;
	private String member_area;
	private String member_job;
	private int role_id=0;
	
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
	public int getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(int member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public int getMember_marry() {
		return member_marry;
	}
	public void setMember_marry(int member_marry) {
		this.member_marry = member_marry;
	}
	public String getMember_area() {
		return member_area;
	}
	public void setMember_area(String member_area) {
		this.member_area = member_area;
	}
	public String getMember_job() {
		return member_job;
	}
	public void setMember_job(String member_job) {
		this.member_job = member_job;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
}