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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human1023.service.PostService;
import com.human1023.vo.Member;
import com.human1023.vo.Post;
import com.human1023.vo.PostReply;

@Controller
public class PostController {
	
	@Autowired
	PostService postService;
	
	@RequestMapping(value = "mysns")
	public String mySns(HttpSession session, Model model) {
		Member login = (Member) session.getAttribute("login");
		ArrayList<Post> initailList = postService.myList(login.getNo(), 0);
		model.addAttribute("initialList", initailList);
		model.addAttribute("nowMember", login);
		return "mysns";
	}
	@RequestMapping(value = "othersns")
	public String otherSns(HttpSession session, Model model, @RequestParam("memberno") int memberNo) {
		Member login = (Member) session.getAttribute("login");
		if(memberNo == login.getNo()) {
			return "redirect:/mysns";
		}
		ArrayList<Post> initailList = postService.myList(memberNo, 0);
		model.addAttribute("initialList", initailList);
		model.addAttribute("nowMember", postService.otherMember(memberNo));
		return "mysns";
	}
	
	@RequestMapping(value = "newpost", method=RequestMethod.POST)
	public String newPost(Post post) {
		postService.newPost(post);
		return "redirect:/mysns";
	}
	
	@ResponseBody
	@RequestMapping(value="myMoreList")
	public ArrayList<Post> moreList(@RequestBody String page, HttpSession session){
		Member login = (Member) session.getAttribute("login");
		ArrayList<Post> moreList = postService.myList(login.getNo(), Integer.valueOf(page));
		return moreList;
	}
	
	@ResponseBody
	@RequestMapping(value="detailpost")
	public HashMap<String, Object> detailPost(@RequestParam("postNo") int postNo, HttpSession session){
		Member login = (Member) session.getAttribute("login");
		HashMap<String, Object> result = postService.detailPost(postNo, login.getNo());
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "postlike")
	public int postLike(@RequestParam("postNo") int postNo, HttpSession session) {
		Member login = (Member) session.getAttribute("login");
		int likeCnt = postService.likeWork(postNo, login.getNo());
		return likeCnt;
	}
	
	@ResponseBody
	@RequestMapping(value="newreply")
	public ArrayList<PostReply> newReply(@RequestBody Map<String, Object> param, HttpSession session){
		Member login = (Member) session.getAttribute("login");
		param.put("memberNo", login.getNo());
		ArrayList<PostReply> replyList =postService.newPostReply(param);
		return replyList;
	}
	
	@ResponseBody
	@RequestMapping(value="deletereply")
	public ArrayList<PostReply> deleteReply(@RequestParam("postNo") int postNo, @RequestParam("replyNo") int replyNo){
		ArrayList<PostReply> result = postService.deleteReply(postNo, replyNo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "getpost")
	public Post getPost(@RequestParam("postNo") int postNo) {
		Post post = postService.getPost(postNo);
		return post;
	}
	
	@ResponseBody
	@RequestMapping(value = "modpost")
	public Post modPost(Post post) {
		postService.modPost(post);
		return post;
	}
	
	@ResponseBody
	@RequestMapping(value = "delpost")
	public String delPost(@RequestParam("postNo") int postNo) {
		postService.delPost(postNo);
		return "0";
	}
	
	
}