package com.human1023.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human1023.mapper.FollowDAO;
import com.human1023.vo.Follow;

@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired
	SqlSession sqlSession;
	FollowDAO fDAO;
	
	@Override
	public HashMap<String, ArrayList<Follow>> followPage(int no) {
		fDAO = sqlSession.getMapper(FollowDAO.class);
		HashMap<String, ArrayList<Follow>> map = new HashMap<String, ArrayList<Follow>>();
		map.put("bothFollow", fDAO.selectBothFollow(no));
		map.put("following", fDAO.selectFollowing(no));
		map.put("followed", fDAO.selectFollowed(no));
		return map;
	}

	@Override
	public ArrayList<Follow> searchList(int no, String keyword) {
		fDAO = sqlSession.getMapper(FollowDAO.class);
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("myNo", no);
		param.put("keyword", keyword);
		return fDAO.selectSearchKeyword(param);
	}

	@Override
	public void following(int myNo, int yourNo) {
		fDAO = sqlSession.getMapper(FollowDAO.class);
		fDAO.insertOne(myNo, yourNo);
	}

	@Override
	public void unFollowing(int myNo, int yourNo) {
		fDAO = sqlSession.getMapper(FollowDAO.class);
		fDAO.deleteOne(myNo, yourNo);
		
	}
	
}
