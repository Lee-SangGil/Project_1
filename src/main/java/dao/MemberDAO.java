package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MemberVO login(String id, String pwd) {
		
		
		MemberVO vo = new MemberVO();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		
		try {
			
			vo = sqlSession.selectOne("m.login", map);
			System.out.println("id_1 = " + vo.getId());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return vo;
	}
	
	public int idCheck(String id) {
		
		int resInt = 0;
		
		MemberVO vo = new MemberVO();
		
		try {
			vo = sqlSession.selectOne("m.idCheck", id);
			if(vo.getId() != null) {
				resInt = 1;
			}
		} catch (Exception e) {
			
		}

		return resInt;	
	}
	
	
	public int newmember(MemberVO vo) {
		
		int res = sqlSession.insert("m.newmember", vo);
		return res;	
	}
	
	//id찾기
	public MemberVO find_id(String name, String pnum) {
		
		MemberVO vo = new MemberVO();
		
		System.out.println("name_2 = " + name);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("pnum", pnum);
		
		try {
			vo = sqlSession.selectOne("m.find_Id", map);
			System.out.println("name_3 = " + vo.getName());
		} catch (Exception e) {
			
		}
		
		return vo;
	}
	
	public MemberVO find_pwd(String id, String name, String pnum) {
		
		MemberVO vo = new MemberVO();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("pnum", pnum);
		
		try {
			
			vo = sqlSession.selectOne("m.find_pwd", map);
		} catch (Exception e) {
			
		}
		
		return vo;
	}
	
	
	
}
