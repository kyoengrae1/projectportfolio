package com.team4.game.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team4.game.config.auth.PrincipalDetails;
import com.team4.game.entity.Board;
import com.team4.game.entity.BoardAttach;
import com.team4.game.entity.User;
import com.team4.game.service.BoardService;
import com.team4.game.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	@Autowired
	private MultipartModule multipartModule;
	
	@GetMapping("register")
	public void insert() {
		
	}
	
	//@PostMapping("insert1")
	public String insert1(Board board) {
		User user=userService.findByUsername(board.getWriter());
		boardService.insert(board,user);
		return "redirect:/board/list";
	}
	@PostMapping("insert")
	public String insert(Board board, HttpServletRequest request,
			@RequestParam("files") List<MultipartFile> files, @AuthenticationPrincipal PrincipalDetails principal) throws IllegalStateException, IOException {
		List<BoardAttach> attachList = multipartModule.fileUploadBoard(request, files);
		boardService.insertBoardAndFile(board, principal.getUser(), attachList);
		return "redirect:/board/list";
	}
	
	//전체보기(페이징)
	@GetMapping("list")
	public String listPage(@RequestParam(name="field",defaultValue="") String field,
			@RequestParam(name="keyword",defaultValue="")String keyword,
			@PageableDefault(size = 10, sort="id", direction = Sort.Direction.DESC) Pageable pageable, Model model) {
		Page<Board> searchList = boardService.findList(field,keyword,pageable);
		long pageSize=searchList.getSize();
		long blockSize=3l;
		long rowNm=searchList.getTotalElements();
		long totPage=(long)Math.ceil((double)rowNm/pageSize);
		long currPage=searchList.getPageable().getPageNumber();
		long startPage=((currPage)/blockSize)*blockSize;
		long endPage=startPage+blockSize;
		if(endPage>totPage) 
			endPage=totPage;
		if(totPage==0)
			endPage=1;
		boolean prev=startPage>0?true:false;
		boolean next=endPage<totPage?true:false;
        
        model.addAttribute("startPage", startPage);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("endPage", endPage-1);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("cp", currPage);
		model.addAttribute("count", rowNm);
		model.addAttribute("totPage", totPage);
        
        model.addAttribute("field", field);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageable", pageable);
        model.addAttribute("lists", searchList);
		
		return "board/list";
	}
	
	@GetMapping("detail")
	public String detail(Long id, Model model) {
		model.addAttribute("board", boardService.findById(id));
		return "/board/detail";
	}
	
	@GetMapping("update/{id}")
	public String update(@PathVariable("id") Long id, Model model) {
		model.addAttribute("board", boardService.findById(id));
		return "/board/update";
	}
	
	@PostMapping("update")
	public String update(Board board) {
		boardService.update(board);
		return "redirect:/board/list";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Long id) {
		boardService.delete(id);
		return "redirect:/board/list";
	}

}
