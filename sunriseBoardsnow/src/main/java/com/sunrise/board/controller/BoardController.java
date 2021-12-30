package com.sunrise.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sunrise.board.service.BoardService;
import com.sunrise.board.service.ComService;
import com.sunrise.board.vo.BoardVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService service;
	
	@Autowired
	ComService comservice;

	// 게시판 글 작성 화면

	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public void write() throws Exception {
		logger.info("write");
	}

	// 게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception {
		logger.info("write");

		service.write(boardVO);

		return "redirect:/";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");
		
		model.addAttribute("list",service.list());
		
		return "board/list";
	}
	
	// 게시판 조회
	@RequestMapping(value = "/board/read", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBoard_num()));
		
		return "board/read";
	}
		
	// 게시판 수정뷰
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String update(BoardVO boardVO, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBoard_num()));
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		logger.info("update");
		
		service.update(boardVO);
		
		return "redirect:/board/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception{
		logger.info("delete");
		
		service.delete(boardVO.getBoard_num());
		
		return "redirect:/board/list";
	}
	
}
