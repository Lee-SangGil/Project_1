package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MovieVO;

public class MovieDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//영화정보출력
	public List<MovieVO> selectList(){
		
		List<MovieVO> list = sqlSession.selectList("movie.movie_list");
		return list;
	}

}
