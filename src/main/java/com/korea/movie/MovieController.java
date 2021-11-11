package com.korea.movie;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MovieDAO;
import dao.ReplyDAO;
import util.MyCommon;
import vo.MovieVO;
import vo.ReplyVO;


@Controller
public class MovieController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext application;
	
	MovieDAO movie_dao;
	ReplyDAO reply_dao;
	
	
	
	public void setMovie_dao(MovieDAO movie_dao) {
		this.movie_dao = movie_dao;
	}
	
	public void setReply_dao(ReplyDAO reply_dao) {
		this.reply_dao = reply_dao;
	}
	
	//영화정보 출력, 댓글목록 출력
	@RequestMapping("/detail.do")
	public String detail(Model model) {
		
		List<MovieVO> detail = movie_dao.selectList();	
		List<ReplyVO> reply = reply_dao.selectList();
		
		model.addAttribute("detail",detail);
		model.addAttribute("reply", reply);
		
		return MyCommon.Visit.VIEW_PATH + "detail/detail.jsp";
		
	}
	
	@RequestMapping("/insert.do")
	public String insert(ReplyVO vo) {
		
		reply_dao.insert(vo);
		return "redirect:detail.do"; 
	}
	
	
	
}
