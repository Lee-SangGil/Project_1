package dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;


import vo.ReplyVO;


public class ReplyDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//댓글목록 출력
	public List<ReplyVO> selectList(){
		
		List<ReplyVO> list = sqlSession.selectList("movie.reply_list");
		return list;
	}
	
	
	//댓글 작성
	public int insert(ReplyVO vo) {
		int res = sqlSession.insert("movie.reply_insert",vo);
		return res;
	}
	
	
}
