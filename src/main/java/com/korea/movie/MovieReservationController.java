package com.korea.movie;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MovieReservationDAO;
import vo.MemberVO;
import vo.MovieListVO;
import vo.ReservationVO;

@Controller
public class MovieReservationController {

	public static final String VIEW_PATH = "/WEB-INF/views/board/";
	MovieReservationDAO movie_dao;

	public void setMovie_dao(MovieReservationDAO movie_dao) {
		this.movie_dao = movie_dao;
	}

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	// 페이지별 게시물 조회
	@RequestMapping(value = { "list.do" })
	public String list(Model model) {

		return VIEW_PATH + "board_list.jsp";

	}

	@RequestMapping(value = { "givemovielist.do" })
	@ResponseBody
	public String movielist(Model model, MovieListVO vo) {
		
		System.out.println(vo.getMoviename());
		MovieListVO movielist = movie_dao.selectoneList(vo.getMoviename(), vo.getMovietheater(), vo.getMoviedate());
		
		System.out.println("a:" + movielist.getMovietimelist());
		String[] str = movielist.getMovietimelist().split("\\*");
		
		ArrayList<String> time = new ArrayList<String>();
		for (int i = 0; i < str.length; i++) {

			time.add(str[i]);

		}

		model.addAttribute("time", time);
		model.addAttribute("listvo", vo);
		HttpSession session = request.getSession();

		// id, 이름 세션에 저장
		session.setAttribute("time", time);
		session.setAttribute("listvo", vo);
		
		String res = "no", resultStr = "";
		
		if (movielist.getMovietimelist() != null) {
			// 정상적으로 업데이트가 된 경우
			res = "yes";
			resultStr = String.format("[{'res':'%s'}]", res);
		}

		return resultStr;
	}

	@RequestMapping(value = { "seat.do" })
	public String seat(Model model, MovieListVO vo) {
		model.addAttribute("listvo2", vo);
		System.out.println("1:" + vo.getMoviename());
		System.out.println("2:" + vo.getMovietimelist());
		System.out.println("3:" + vo.getMoviedate());
		System.out.println("4:" + vo.getMovietheater());

		HttpSession session = request.getSession();
		session.setAttribute("moviename", vo.getMoviename());
		session.setAttribute("movietime", vo.getMovietimelist());
		session.setAttribute("moviedate", vo.getMoviedate());
		session.setAttribute("movietheater", vo.getMovietheater());
		System.out.println(session.getAttribute("moviename"));
		System.out.println(session.getAttribute("movietime"));
		System.out.println(session.getAttribute("moviedate"));

		return VIEW_PATH + "seat.jsp";
	}

	@RequestMapping(value = { "pay.do" })
	public String pay(Model model, ReservationVO vo) {
		
		MemberVO vo2= (MemberVO) session.getAttribute("vo");
		vo.setId(vo2.getId());
		System.out.println(vo2.getId());
		movie_dao.insert( vo );
		return VIEW_PATH + "pay.jsp";

	}

}