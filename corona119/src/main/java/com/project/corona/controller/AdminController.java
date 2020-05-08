package com.project.corona.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.corona.service.AdminService;
import com.project.corona.service.NoticeService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.VolunteerVO;

@Controller
@RequestMapping(path= {"/admin"})
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	private AdminService adminService;
	
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;
	
	@GetMapping(path = {"/", ""})
	public String adminPage(Model model, HttpSession session) {
		MemberVO auth = (MemberVO) session.getAttribute("loginuser");
		if (auth == null || auth.getMemberType().contains("USER")) {
			return "redirect:/admin/login";
		} else {
			List<MemberVO> member = adminService.findAllMember();
			
			List<BoardVO> notice = noticeService.findAllNotice();
			
			List<BoardVO> board = adminService.findAllBoard();
			List<VolunteerVO> volunteer = adminService.findAllVolunteer();

			model.addAttribute("loginuser", auth);
			model.addAttribute("member", member);
			model.addAttribute("notice", notice);
			model.addAttribute("board", board);
			model.addAttribute("volunteer", volunteer);
			
			return "/admin/admin";	
		}
	}
	
	@GetMapping(path = {"/login"})
	public String adminLoginPage(HttpSession session) {
		MemberVO auth = (MemberVO) session.getAttribute("loginuser");
		if (auth != null && auth.getMemberType().contains("ADMIN")) {
			return "redirect:/admin";
		} else {
			return "/admin/login";
		}
	}
	
	@PutMapping(path = {"/memberDelete"})
	@ResponseBody
	public String banMember(@RequestBody Object memberNo) {
		try {
			adminService.banMemberByMemberNo(memberNo);
			return "success";
		} catch (Exception e) {
			return "failure";
		}
	}
	
	@PutMapping(path = {"/boardDelete"})
	@ResponseBody
	public String deleteBoard(@RequestBody Object boardNo) {
		try {
			adminService.deleteBoardByBoardNo(boardNo);
			return "success";
		} catch (Exception e) {
			return "failure";
		}
	}

	@PutMapping(path = {"/volConfirm"})
	@ResponseBody
	public String confirmVol(@RequestBody Object volNo) {
		try {
			adminService.confirmVolByBoardNo(volNo);
			return "success";
		} catch (Exception e) {
			return "failure";
		}
	}

}
