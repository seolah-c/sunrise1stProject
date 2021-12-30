package com.sunrise.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sunrise.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list() throws Exception {
	
		return sqlSession.selectList("boardMapper.list");

	}
	
	// 게시물 조회
	@Override
	public BoardVO read(int board_num) throws Exception {
			
		return sqlSession.selectOne("boardMapper.read", board_num);
	}
	
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		
		sqlSession.update("boardMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int board_num) throws Exception {
		
		sqlSession.delete("boardMapper.delete", board_num);
	}

	
}
