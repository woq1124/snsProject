package com.human1023.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.human1023.vo.Member;

public interface MemberDAO {
	public int insertOne(Member member);
	public Member selectOneByNo(int no);
	public Member selectOneById(String id);
	public Member selectOneByIdPwd(@Param("id") String id, @Param("pwd") String pwd);
	public int updateNameByNo(HashMap<String, Object> param);
	public String selectPwdByNo(@Param("no") int no, @Param("pwd") String pwd);
	public int updatePwdByNo(@Param("no") int no, @Param("pwd") String pwd);
}