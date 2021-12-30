package com.sunrise.board.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sunrise.board.vo.ComVO;

@Repository
public class ComDAOImpl implements ComDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	// phone DB값 조회
	public List<ComVO> getPhone(String code_type) throws Exception{
		return sqlSession.selectList("memberMapper.getPhone", code_type);
	}
	
	@Override
	// 메뉴 DB값 조회
	public List<ComVO> getMenu(String code_type) throws Exception{
		return sqlSession.selectList("memberMapper.getMenu", code_type);
	}
	
}
