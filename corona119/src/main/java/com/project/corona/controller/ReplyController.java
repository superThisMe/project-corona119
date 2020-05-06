package com.project.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.project.corona.service.ReplyService;
import com.project.corona.vo.ReplyVO;



@Controller
@RequestMapping(path= {"/reply"})
public class ReplyController {
	
	@Autowired
	@Qualifier("replyService")
	private ReplyService replyService;
	
	@PostMapping("/saveReply")
	@ResponseBody
	public String saveReply(ReplyVO reply, String action) {
		System.out.println(reply);
		if (action.equals("reply")) {
			
			replyService.saveReply(reply);
			
		}
		return "success";
	}
	
	@GetMapping(path= {"/listReply/{boardNo}"})
	public String listReply(@PathVariable int boardNo, Model model) {
		
		List<ReplyVO> replies = replyService.listReply(boardNo);
		
		model.addAttribute("replies", replies);
				
		return "/freeboard/reply";
		
	}
	
	@DeleteMapping(path= {"/delReply/{rNo}"})
	@ResponseBody
	public String delReply(@PathVariable int rNo) {
		
		replyService.deleteReply(rNo);
		
		return "success";
	}
	
	@PutMapping(path= {"/updateReply"})
	@ResponseBody
	public String updateReply(@RequestBody ReplyVO reply) {
		
		replyService.updateReply(reply);
		
		return "success";
	}
	
	
		
	
}