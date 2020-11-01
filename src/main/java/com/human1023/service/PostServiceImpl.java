package com.human1023.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human1023.mapper.MemberDAO;
import com.human1023.mapper.PostDAO;
import com.human1023.mapper.PostLikeDAO;
import com.human1023.mapper.PostReplyDAO;
import com.human1023.vo.Member;
import com.human1023.vo.Post;
import com.human1023.vo.PostReply;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	SqlSession sqlSession;
	MemberDAO mDAO;
	PostDAO pDAO;
	PostLikeDAO plDAO;
	PostReplyDAO prDAO;

	@Override
	public void newPost(Post post) {
		pDAO = sqlSession.getMapper(PostDAO.class);
		pDAO.insertOne(post);
	}

	@Override
	public ArrayList<Post> myList(int no, int page) {
		pDAO = sqlSession.getMapper(PostDAO.class);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("myNo", no);
		paramMap.put("startNo", page*10+1);
		paramMap.put("endNo", page*10+10);
		ArrayList<Post> temp = pDAO.selectMyList(paramMap);
		return temp;
	}

	@Override
	public int likeWork(int postNo, int memberNo) {
		plDAO = sqlSession.getMapper(PostLikeDAO.class);
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("postNo", postNo);
		param.put("memberNo", memberNo);
		param.put("likeCnt", 0);
		plDAO.callLikeWork(param);
		return param.get("likeCnt");
	}

	@Override
	public ArrayList<PostReply> newPostReply(Map<String, Object> param) {
		prDAO = sqlSession.getMapper(PostReplyDAO.class);
		int k = prDAO.insertOne(param);
		if(k==0) {
			return null;
		} else {
			ArrayList<PostReply> replyList = prDAO.selectAllByPostNo((Integer) param.get("postNo"));
			return replyList;
		}
	}
	
	@Override
	public HashMap<String, Object> detailPost(int postNo, int memberNo) {
		plDAO = sqlSession.getMapper(PostLikeDAO.class);
		prDAO = sqlSession.getMapper(PostReplyDAO.class);
		
		Integer isLike = plDAO.selectOneByNo(postNo, memberNo);
		int likeCnt = plDAO.selectCntByNo(postNo);
		ArrayList<PostReply> replyList = prDAO.selectAllByPostNo(postNo);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("isLike", isLike);
		result.put("likeCnt", likeCnt);
		result.put("replyList", replyList);
		return result;
	}

	@Override
	public ArrayList<PostReply> deleteReply(int postNo, int replyNo) {
		prDAO = sqlSession.getMapper(PostReplyDAO.class);
		prDAO.deleteOne(replyNo);
		ArrayList<PostReply> replyList = prDAO.selectAllByPostNo(postNo); 
		return replyList;
	}

	@Override
	public Post getPost(int postNo) {
		Post post = pDAO.selectOne(postNo);
		return post;
	}

	@Override
	public void modPost(Post post) {
		pDAO.updateOne(post);
	}

	@Override
	public void delPost(int postNo) {
		pDAO.deleteOne(postNo);
	}

	@Override
	public Member otherMember(int memberNo) {
		mDAO = sqlSession.getMapper(MemberDAO.class);
		Member other = mDAO.selectOneByNo(memberNo);
		return other;
	}


}
