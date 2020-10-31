package com.human1023.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface PostLikeDAO {
	
	public void callLikeWork(HashMap<String, Integer> param);
	public int selectCntByNo(int postNo);
	public Integer selectOneByNo(@Param("postNo") int postNo, @Param("memberNo") int memberNo);
	
	
}
