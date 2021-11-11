package com.korea.movie;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import vo.MemberVO;

@Controller
public class MemberController {

	public static final String VIEW_PATH = "/WEB-INF/views/member/";
	
	MemberDAO member_dao;
	
	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	
	
	
	@RequestMapping(value={"/","login_form.do"})
	public String login_form(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("vo");

		return VIEW_PATH + "login_form.jsp";
	}
	
	@RequestMapping("login.do")
	@ResponseBody
	public String login(String id, String pwd, HttpServletRequest request, Model model) {
		
		MemberVO vo = member_dao.login(id, pwd);
		
		
		model.addAttribute("id", vo.getId());
		model.addAttribute("name", vo.getName());
		
		HttpSession session = request.getSession();
		
		// 로그인 시 세션에 저장
		session.setAttribute("vo", vo);	
		
		return vo.getId();
		
	}
	
	
	@RequestMapping("newmember_form.do")
	public String newmember_form(){
		
		return VIEW_PATH + "newmember_form.jsp";
	}
	
	// id중복체크
	@RequestMapping("idCheck.do")
	@ResponseBody //Ajax로 호출된 매핑이면 ResponseBody어노테이션 필수
	public String idCheck(String id) {
		
		System.out.println("id_1 = " + id);
		
		int resInt = member_dao.idCheck(id);
		
		String resultStr = "";
		String res = "yes";
		
		if( resInt == 1 ) {
			res = "no";
		}
		resultStr = String.format("[{'res':'%s'}]", res);
		
		System.out.println("res_2 = " + res);
		
		System.out.println(resultStr);
		
		return resultStr;
	}
	
	
	@RequestMapping("newmember.do")
	@ResponseBody
	public String newmember(String id, String pwd, String name, String pnum, String email) {
		
		System.out.println("==94== id = "+ id + " pwd = " + pwd);
		
		MemberVO vo = new MemberVO();
		
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setPnum(pnum);
		vo.setEmail(email);
		
		int resInt = member_dao.newmember(vo);
		
		System.out.println("== 106 resInt = " + resInt);
		
		String resultStr = "";
		String res = "no";
		
		if(resInt == 1) {
			res = "yes";
		}
		
		resultStr = String.format("[{'res':'%s'}]", res);
		
		System.out.println(resultStr);
		
		return resultStr;
		
	}
	
	
	@RequestMapping("find_id_form.do")
	public String find_id_form() {
		
		return VIEW_PATH + "find_id_form.jsp"; 
	}
	
	
	// id찾기
	@RequestMapping("find_id.do")
	@ResponseBody
	public String find_id(String name, String pnum) {
	
		System.out.println("name_1 = " + name);
		
		MemberVO vo = member_dao.find_id(name, pnum);
		
		String id = null;
		
		try {
			
			if(vo.getId() != null) {
				
				id = vo.getId();
			}
			
		} catch (Exception e) {
		}
		
		return id;
	}
	
	
	// pwd찾기
	@RequestMapping("find_pwd_form.do")
	public String find_pwd_form() {
		
		return VIEW_PATH + "find_pwd_form.jsp"; 
	}
	
	@RequestMapping("find_pwd.do")
	@ResponseBody
	public String find_pwd(String id, String name, String pnum) {
		
		MemberVO vo = member_dao.find_pwd(id, name, pnum);
		String pwd = null;
		try {
			if(vo.getPwd() != null) {
				
				pwd = vo.getPwd();
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return pwd;
	
	}
	
	
	
	
	
}
