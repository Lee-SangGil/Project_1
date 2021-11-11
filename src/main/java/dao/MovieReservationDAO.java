package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.MemberVO;

import vo.MovieListVO;
import vo.ReservationVO;


public class MovieReservationDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 게시물 조회
	public List<MovieListVO> selectList() {
		List<MovieListVO> list = sqlSession.selectList("mr.movie_list");
		return list;
	}

	public MovieListVO selectoneList(String moviename, String movietheater, String moviedate) {
		MovieListVO vo = new MovieListVO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("moviename", moviename);
		map.put("movietheater", movietheater);
		map.put("moviedate", moviedate);
		System.out.println(map.get("moviedate"));
		
		try {

			vo = sqlSession.selectOne("mr.movieone_list", map);
			System.out.println(vo.getMovietimelist());
		} catch (Exception e) {

		}
		return vo;
	}

	public int insert(ReservationVO vo) {
		
		int res = sqlSession.insert("mr.reservation_insert", vo );
		return res;
	}

	public List<ReservationVO> reservationList(MemberVO vo) {
		
		System.out.println("id = " + vo.getId());
		List<ReservationVO> list = sqlSession.selectList("mr.mypage_list", vo.getId());
		
		System.out.println(list.get(0));
		
		return list;
	}
	

}