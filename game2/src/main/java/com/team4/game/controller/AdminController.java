package com.team4.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team4.game.entity.User;
import com.team4.game.service.UserService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/ulist")
	public String userList(Model model, @PageableDefault(size=10,sort="id", 
			direction=Sort.Direction.DESC) Pageable pageable) {
		Page<User> lists=userService.findAll(pageable);
		long pageSize=pageable.getPageSize();
		long rowNm=userService.count();
		long totPage=(long)Math.ceil((double)rowNm/pageSize);
		long currPage=pageable.getPageNumber();
		long startPage=((currPage)/pageSize)*pageSize;
		long endPage=startPage+pageSize;
		if(endPage>totPage) 
			endPage=totPage;
		if(totPage==0) endPage=1;
		boolean prev=startPage>0?true:false;
		boolean next=endPage<totPage?true:false;
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage-1);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("count", rowNm);
		model.addAttribute("lists", lists);
		model.addAttribute("totPage", totPage);
		model.addAttribute("cp", currPage);
		return "/admin/ulist";
	}
	
	@GetMapping("/detail")
	public String userDetail(Model model, String username) {
		model.addAttribute("user", userService.findByUsername(username));
		return "/admin/userDetail";
	}
	
	@GetMapping("/delete")
	public String userDelete(Long id) {
		userService.deleteById(id);
		return "redirect:/admin/ulist";
	}
}
