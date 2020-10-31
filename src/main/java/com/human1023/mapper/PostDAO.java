package com.human1023.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.human1023.vo.Post;

public interface PostDAO {
	
	public void insertOne(Post post);
	public ArrayList<Post> selectMyList(HashMap<String, Object> paramMap);
	public Post selectOne(int postNo);
	public void updateOne(Post post);
	public void deleteOne(int postNo);
	
}
