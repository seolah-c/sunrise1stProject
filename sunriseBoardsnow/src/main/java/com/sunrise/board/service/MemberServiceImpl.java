package com.sunrise.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sunrise.board.dao.MemberDAO;
import com.sunrise.board.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	//Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받고
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		//받은 vo를 DAO로 보내준다
		dao.memberUpdate(vo);
	}
	
	// 패스워드 체크
	@Override
	public int pwChk(MemberVO vo) throws Exception {
		int result = dao.pwChk(vo);
		return result;
	}
	
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
}
