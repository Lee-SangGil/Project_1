package com.korea.movie;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MovieReservationDAO;
import util.MyCommon;
import vo.MemberVO;
import vo.ReservationVO;

@Controller
public class MainController {
	MovieReservationDAO movie_dao;

	public void setMovie_dao(MovieReservationDAO movie_dao) {
		this.movie_dao = movie_dao;
	}
	
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	//메인화면 호출
	@RequestMapping("/main.do")
	public String main() {
		return MyCommon.Visit.VIEW_PATH + "main/main.jsp";
	}
	
	//마이페이지
	@RequestMapping("/mypage.do")
	public String mypage(Model model) {
		
		MemberVO vo=(MemberVO) session.getAttribute("vo");
		System.out.println(vo.getId());
		
		List<ReservationVO> reservationlist = movie_dao.reservationList(vo);
		System.out.println(reservationlist.get(0));
		
		model.addAttribute("reservationlist",reservationlist);
		session.setAttribute("reservationlist",reservationlist);
		
		return MyCommon.Visit.VIEW_PATH + "main/mypage.jsp";
		
	}
	
	
	@RequestMapping("/logout.do")
	public String logout() {
		
		session.removeAttribute("id");
		session.invalidate();  //세션의 모든 속성을 삭제

		
		return "redirect:login_form.do";
	}
	
	
	
}
