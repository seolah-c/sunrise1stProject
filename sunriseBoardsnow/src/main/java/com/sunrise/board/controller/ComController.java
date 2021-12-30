package com.sunrise.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunrise.board.service.ComService;
import com.sunrise.board.vo.ComVO;

@Controller
@RequestMapping(value = "/member")
public class ComController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComController.class);

	@Autowired
	ComService comservice;
	
	@RequestMapping(value = "/phone", method = RequestMethod.POST)
	@ResponseBody
	public Object getPtype(@RequestBody ComVO comVO, Model model) throws Exception {
		List<ComVO> pList = comservice.getPhone(comVO.getCode_type());
		//model.addAttribute("pList", pList);
		return pList;
	}
	
	@RequestMapping(value = "/menu", method = RequestMethod.POST)
	@ResponseBody
	public Object getBtype(@RequestBody ComVO comVO, Model model) throws Exception {
		List<ComVO> bList = comservice.getMenu(comVO.getCode_type());
		//model.addAttribute("pList", pList);
		return bList;
	}
}
