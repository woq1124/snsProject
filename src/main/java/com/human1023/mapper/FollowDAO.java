package com.human1023.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.human1023.vo.Follow;

public interface FollowDAO {
	
	public ArrayList<Follow> selectBothFollow(int myNo);
	public ArrayList<Follow> selectFollowing(int myNo);
	public ArrayList<Follow> selectFollowed(int myNo);
	public ArrayList<Follow> selectSearchKeyword(HashMap<String, Object> param);
	public void insertOne(@Param("myNo") int myNo, @Param("yourNo") int yourNo);
	public void deleteOne(@Param("myNo") int myNo, @Param("yourNo") int yourNo);
	
}
