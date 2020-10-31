package com.human1023.sns;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human1023.service.MemberService;
import com.human1023.vo.Member;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value = "idDupChk")
	public String idDupChk(@RequestBody String paramData) {
		String id = paramData.trim();
		String result = null;
		if(memberService.idDupChk(id)) {
			result = "0";
		} else {
			result = "1";
		}
		return result;
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Member member, Model model) {
		memberService.joinMember(member);
		return "redirect:/";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession session, @RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		Member member = memberService.login(id, pwd);
		if(member != null) {
			session.setAttribute("login", member);
			return "redirect:/mysns";
		} else {
			return "redirect:/";
		}
	}
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "myaccount")
	public String myAccount(Model model) {
		return "myaccount";
	}
	
	@ResponseBody
	@RequestMapping(value = "modmember")
	public String modMember(@RequestBody HashMap<String, Object> param, HttpSession session) {
		Member member = (Member) session.getAttribute("login");
		param.put("no", member.getNo());
		String profilepic = memberService.modMember(param);
		if(profilepic!=null) {
			member.setProfilepic(profilepic);
			member.setName((String) param.get("name"));
			session.setAttribute("login", member);
			return "1";
		} else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "pwdchk", method=RequestMethod.POST)
	public String pwdChk(@RequestParam("pwd") String pwd, HttpSession session) {
		Member member = (Member) session.getAttribute("login");
		int no = member.getNo();
		boolean result = memberService.chkPwd(no, pwd);
		if(result) {
			return "1";
		} else {
			return "0";
		}
	}
	
	@RequestMapping(value = "modpwd", method=RequestMethod.POST)
	public String modPwd(@RequestParam("newpwd") String newPwd, HttpSession session) {
		Member member = (Member) session.getAttribute("login");
		int no = member.getNo();
		memberService.modPwd(no, newPwd);
		System.out.println(no);
		return "redirect:/myaccount";
	}
}
