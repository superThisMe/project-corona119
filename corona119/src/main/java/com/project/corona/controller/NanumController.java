package com.project.corona.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.corona.service.NanumService;
import com.project.corona.service.NoticeService;
import com.project.corona.service.VolunteerService;
import com.project.corona.vo.BoardVO;
import com.project.corona.vo.FileVO;
import com.project.corona.vo.ImageVO;
import com.project.corona.vo.MemberVO;
import com.project.corona.vo.ReplyVO;

@Controller
@RequestMapping(path = { "/nanum" })
public class NanumController {
	
	@Autowired
	@Qualifier("nanumService")
	private NanumService nanumService;
	
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;
	
	@Autowired
	@Qualifier("volunteerService")
	private VolunteerService volunteerService;
	
	@GetMapping(path = {"", "/"})
	public String nanumList(Model model) {
		
		List<BoardVO> nanum = nanumService.findAllNanum();

		model.addAttribute("nanum", nanum);
		
		return "/nanum/nanum";
	}
	
	@GetMapping(path = "/write")
	public String nanumWrite(Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginuser");
		if(member == null) {
			return "redirect:/nanum";
		}
		
		return "/nanum/write";
	}
	
	@PostMapping(path = "/write")
	public String nanumWriteP(BoardVO board, ImageVO image, FileVO file, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginuser");
		if(member == null) {
			return "redirect:/nanum";
		}
		
		board.setCatNo(2);
		board.setMemberNo(member.getMemberNo());
		board.setMember(member);
		
		volunteerService.writeBoard(board);
		
		if(image.getImagePath() != null) {
			image.setBoardNo(board.getBoardNo());		
			String[] imagePath = image.getImagePath().split(",");
			String[] imagesPath = image.getImagesPath().split(",");
			String[] imageReal = image.getImageReal().split(",");
			String[] imageSize = image.getImageSize().split(",");
			List<ImageVO> imageList = new ArrayList<>();
			for(int i = 0; i < imagePath.length; i++) {
				image.setImagePath(imagePath[i]);
				image.setImagesPath(imagesPath[i]);
				image.setImageReal(imageReal[i]);
				image.setImageSize(imageSize[i]);
				imageList.add(image);
				nanumService.uploadImage(image);
			}
		}
		
		if(file.getFilePath() != null) {
			file.setBoardNo(board.getBoardNo());
			String[] filePath = file.getFilePath().split(",");
			String[] fileReal = file.getFileReal().split(",");
			String[] fileSize = file.getFileSize().split(",");
			List<FileVO> fileList = new ArrayList<>();
			for(int i = 0; i < filePath.length; i++) {
				file.setFilePath(filePath[i]);
				file.setFileReal(fileReal[i]);
				file.setFileSize(fileSize[i]);
				fileList.add(file);
				volunteerService.uploadFile(file);
			}
		}
		
		return "redirect:/nanum";
	}
	
	@GetMapping(path = {"/detail/{boardNo}"})
	public String detailNanum(@PathVariable("boardNo") int boardNo, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		BoardVO nanumDetail = nanumService.findNanumByBoardNo(boardNo);
		if (nanumDetail == null) {
			return "redirect:/nanum";
		}
		MemberVO member = (MemberVO) session.getAttribute("loginuser");
		if (member != null) {
			HashMap<String, Object> hashmap = new HashMap<>();
			hashmap.put("memberNo", member.getMemberNo());
			hashmap.put("boardNo", boardNo);
			String reply = nanumService.findReplyByBoardNoMemberNo(hashmap);
			model.addAttribute("reply", reply);
		}
		
		String boardRead = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("readBoard")) {
				boardRead = cookie.getValue();
			}
		}

		if(!boardRead.contains(String.format("[%d]", boardNo))){
			noticeService.changeCount(boardNo);
			nanumDetail.setBoardCount(nanumDetail.getBoardCount() + 1);
		
			Cookie newCookie = new Cookie("readBoard", String.format("%s[%d]", boardRead, boardNo));
			response.addCookie(newCookie);
		}
		
	 	model.addAttribute("nanumDetail", nanumDetail);
	 	
		return "/nanum/detail";
	}

	@GetMapping(path = {"/reply/{boardNo}"})
	public String replyNanum(@PathVariable("boardNo") int boardNo, Model model) {

		List<ReplyVO> nanumReply = nanumService.findAllReply(boardNo);

	 	model.addAttribute("nanumReply", nanumReply);
	 	
	 	return "/nanum/reply/reply";
	}

	@PostMapping(path = {"/reply/write/{boardNo}"})
	@ResponseBody
	public String replyWrite(@PathVariable("boardNo") int boardNo, ReplyVO reply, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginuser");
		if(member == null) {
			return "redirect:/nanum/detail/{boardNo}";
		}
		reply.setBoardNo(boardNo);
		reply.setMemberNo(member.getMemberNo());
		nanumService.writeReplyByBoardNo(reply);

		return "success";
	}
	
	@PostMapping(path = {"/lotto/{boardNo}"}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String lotto(@PathVariable("boardNo") int boardNo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginuser");
		if(member == null ) {
			return "redirect:/nanum/detail/{boardNo}";
		}
		
		List<String> memberNo = nanumService.findReplyMemByBoardNo(boardNo);
		if(memberNo == null || memberNo.size() == 0) {
			return "failure";
		}
		double random = Math.random();
		int ran = (int)(random * memberNo.size());
		String get = memberNo.get(ran);
		String mem = nanumService.findMemberByMemberNo(get);
		nanumService.exireBoardRegDate(boardNo);
		HashMap<String, String> hashmap = new HashMap<>();
		hashmap.put("memberNickname", mem);
		hashmap.put("boardNo", String.valueOf(boardNo));
		nanumService.updateResult(hashmap);
		
		return mem;
	}

}
