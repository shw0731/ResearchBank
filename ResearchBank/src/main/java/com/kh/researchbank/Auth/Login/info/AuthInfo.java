package com.kh.researchbank.Auth.Login.info;

public class AuthInfo {
    
    private String member_id;
    private String member_nickname;
    private int role_id;
    
    public AuthInfo(String member_id, String member_nickname, int role_id) {
        this.member_id = member_id;
        this.member_nickname = member_nickname;
        this.role_id = role_id;
    }

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
}