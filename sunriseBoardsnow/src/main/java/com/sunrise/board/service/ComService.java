package com.sunrise.board.service;

import java.util.List;

import com.sunrise.board.vo.ComVO;

public interface ComService {
	
	// phone값 받기
	public List<ComVO> getPhone(String code_type) throws Exception;

	// 메뉴값 받기
	public List<ComVO> getMenu(String code_type) throws Exception;
}
