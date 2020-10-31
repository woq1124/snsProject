package com.human1023.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;

import javax.xml.bind.DatatypeConverter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human1023.mapper.MemberDAO;
import com.human1023.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	SqlSession sqlSession;
	MemberDAO mDAO;

	@Override
	public int joinMember(Member member) {
		mDAO = sqlSession.getMapper(MemberDAO.class);
		int k = mDAO.insertOne(member);
		return k;
	}

	@Override
	public boolean idDupChk(String id) {
		mDAO = sqlSession.getMapper(MemberDAO.class);
		if(mDAO.selectOneById(id)==null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Member login(String id, String pwd) {
		mDAO = sqlSession.getMapper(MemberDAO.class);
		Member member = mDAO.selectOneByIdPwd(id, pwd);
		return member;
	}

	@Override
	public String modMember(HashMap<String, Object> param) {
		String fileName = null;
		mDAO = sqlSession.getMapper(MemberDAO.class);
		String stringImg = (String) param.get("profilepic");
		if(stringImg==null) {
			param.put("profilepic", "default.png");
		} else {
			String[] img = stringImg.split(",");
			int slashIdx = img[0].indexOf("/");
			int semicolonIdx = img[0].indexOf(";");
			String extension = img[0].substring(slashIdx+1, semicolonIdx);
			String base64 = img[1];
			byte[] data = DatatypeConverter.parseBase64Binary(base64);
			fileName = base64.substring(58, 68)+base64.substring(78, 88) + "." + extension;
//			File file = new File("D:/WorkSpace/Spring/Day-201023_Snsproject/src/main/webapp/resources/images/profile/"+fileName);
			File workspacePathFile = new File("D:/WorkSpace/Spring/Day-201023_Snsproject/src/main/webapp/resources/upload/profile/"+fileName);
			File serverPathFile = new File("D:/WorkSpace/Spring/Common/apache-tomcat-8.5.58/wtpwebapps/Day-201023_Snsproject/resources/upload/profile/"+fileName);
			
			try {
				FileOutputStream fos = new FileOutputStream(serverPathFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(data);
				bos.flush();
				bos.close();
				fos = new FileOutputStream(workspacePathFile);
				bos = new BufferedOutputStream(fos);
				bos.write(data);
				bos.flush();
				bos.close();
				param.put("profilepic", fileName);
			} catch (Exception e) {
				System.out.println("file output fail");
				param.put("profilepic", "default.png");
			}
		}
		int k = mDAO.updateNameByNo(param);
		if(k==1) {
			return fileName;
		} else {
			return null;
		}
	}
	
	@Override
	public boolean chkPwd(int no, String pwd) {
		mDAO = sqlSession.getMapper(MemberDAO.class);
		String k = mDAO.selectPwdByNo(no, pwd);
		if(k==null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void modPwd(int no, String pwd) {
		mDAO = sqlSession.getMapper(MemberDAO.class);
		mDAO.updatePwdByNo(no, pwd);
	}


	
}
