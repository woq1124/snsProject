package com.human1023.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.human1023.vo.PostReply;

public interface PostReplyDAO {
	
	public int insertOne(Map<String, Object> param);
	public ArrayList<PostReply> selectAllByPostNo(Integer postNo);
	public int deleteOne(Integer postNo);
}
