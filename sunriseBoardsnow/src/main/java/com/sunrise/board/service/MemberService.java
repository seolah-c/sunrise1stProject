package com.sunrise.board.service;

import com.sunrise.board.vo.MemberVO;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;
	
	public int pwChk(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
}
