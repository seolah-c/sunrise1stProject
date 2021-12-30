package com.sunrise.board.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sunrise.board.dao.ComDAO;
import com.sunrise.board.vo.ComVO;

@Service
public class ComServiceImpl implements ComService{

	@Inject
	private ComDAO dao;

	@Override
	public List<ComVO> getPhone(String code_type) throws Exception {
		return dao.getPhone(code_type);
	}
	
	@Override
	public List<ComVO> getMenu(String code_type) throws Exception {
		return dao.getMenu(code_type);
	}
}
