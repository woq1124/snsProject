package com.human1023.service;

import java.util.HashMap;

import com.human1023.vo.Member;

public interface MemberService {
	
	public int joinMember(Member member);
	public boolean idDupChk(String id);
	public Member login(String id, String pwd);
	public String modMember(HashMap<String, Object> param);
	public boolean chkPwd(int no, String pwd);
	public void modPwd(int no, String pwd);
}
