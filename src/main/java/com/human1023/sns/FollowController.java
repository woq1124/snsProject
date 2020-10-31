package com.human1023.sns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human1023.service.FollowService;
import com.human1023.vo.Follow;
import com.human1023.vo.Member;

@Controller
public class FollowController {
	
	@Autowired
	FollowService fService;
	
	@RequestMapping(value = "follow")
	public String follow(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("login");
		HashMap<String, ArrayList<Follow>> map = fService.followPage(member.getNo());
		model.addAllAttributes(map);
		return "follow";
	}
	
	@ResponseBody
	@RequestMapping(value = "searchuser")
	public ArrayList<Follow> searchUser(@RequestBody Map<String, Object> param, HttpSession session) {
		Member member = (Member) session.getAttribute("login");
		ArrayList<Follow> searchList =fService.searchList(member.getNo(), (String) param.get("keyword"));
		return searchList;
	}
	
	@ResponseBody
	@RequestMapping(value = "following")
	public String following(@RequestParam("memberNo") int yourNo, HttpSession session) {
		Member member = (Member) session.getAttribute("login");
		fService.following(member.getNo(), yourNo);
		return "test";
	}
	
	@ResponseBody
	@RequestMapping(value = "unfollowing")
	public String unFollowing(@RequestParam("memberNo") int yourNo, HttpSession session) {
		Member member = (Member) session.getAttribute("login");
		fService.unFollowing(member.getNo(), yourNo);
		return "test";
	}
}
