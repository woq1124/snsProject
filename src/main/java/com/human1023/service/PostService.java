package com.human1023.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.human1023.vo.Post;
import com.human1023.vo.PostReply;

public interface PostService {

	public void newPost(Post post);
	public ArrayList<Post> myList(int no, int page);
	public Post getPost(int postNo);
	public void modPost(Post post);
	public void delPost(int postNo);
	public int likeWork(int postNo, int memberNo);
	public ArrayList<PostReply> newPostReply(Map<String, Object> param);
	public HashMap<String, Object> detailPost(int postNo, int memberNo);
	public ArrayList<PostReply> deleteReply(int postNo, int replyNo);
	
}
