package com.sunrise.board.dao;

import java.util.List;

import com.sunrise.board.vo.ComVO;

public interface ComDAO {
	
	// phone DB값 조회
	public List<ComVO> getPhone(String code_type) throws Exception;
	
	// 메뉴 DB값 조회
	public List<ComVO> getMenu(String code_type) throws Exception;
}
