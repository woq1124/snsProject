package com.human1023.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.human1023.vo.Follow;

public interface FollowService {
	
	public HashMap<String, ArrayList<Follow>> followPage(int no);
	public ArrayList<Follow> searchList(int no, String keyword);
	public void following(int myNo, int yourNo);
	public void unFollowing(int myNo, int yourNo);
}

