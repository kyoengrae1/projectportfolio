package com.team4.game.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team4.game.config.auth.PrincipalDetails;
import com.team4.game.constant.Category;
import com.team4.game.entity.Cart;
import com.team4.game.entity.Game;
import com.team4.game.entity.GameAttach;
import com.team4.game.entity.User;
import com.team4.game.repository.CartRepository;
import com.team4.game.repository.MyGameRepository;
import com.team4.game.service.GameService;

@Controller
@RequestMapping("/game/*")
public class GameController {
	
	@Autowired
	private GameService gameService;
	
	@Autowired
	private MultipartModule multipartModule;
	
	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private MyGameRepository myGameRepository;
	
	@GetMapping("/glist1")
	public void glist1() {
		
	}
	
	@GetMapping("/glist")
	public String gameList(@RequestParam(name="field",defaultValue="") String field,
			@RequestParam(name="keyword",defaultValue="")String keyword,
			@RequestParam(name="category", defaultValue = "")String category,
			@PageableDefault(size = 9, sort="regdate", direction = Sort.Direction.DESC ) Pageable pageable, Model model) {
		Page<Game> searchList = gameService.findList(category,field,keyword,pageable);
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
		
		List<String> c = new ArrayList<String>();
		for(Category cat : Category.values()) {
			c.add(cat.toString());
		}
		model.addAttribute("cats", c);
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
        model.addAttribute("category", category);
        model.addAttribute("pageable", pageable);
        model.addAttribute("lists", searchList);
		
		return "/game/glist";
	}
	
	@GetMapping("/register")
	public void register(Model model) {
		
		List<String> c = new ArrayList<String>();
		for(Category cat : Category.values()) {
			c.add(cat.toString());
		}
		model.addAttribute("cats", c);
		
	}
	
	@PostMapping("/insert")
	public String insert(Game game, HttpServletRequest request,
			@RequestParam("files") List<MultipartFile> files) throws IllegalStateException, IOException {
		List<GameAttach> attachList = multipartModule.fileUpload(request, files);
		gameService.insertGameAndFile(game, attachList);
		return "redirect:/game/glist";
	}
	@GetMapping("/detail")
	public String detail(Model model, Long id) {
		model.addAttribute("game", gameService.findById(id));
		return "/game/detail";
	}
	
	@GetMapping("/delete")
	public String delete(Long id) {
		gameService.deleteById(id);
		return "redirect:/game/glist";
	}
	
	@GetMapping("/update")
	public String updataForm(Model model, Long id) {
		model.addAttribute("game", gameService.findById(id));
		return "/game/update";
	}
	
	@PostMapping("/update")
	public String updata(Game game) {
		gameService.update(game);
		return "redirect:/game/glist";
	}

	@Secured("ROLE_USER")
	@PostMapping("/cartAdd")
	@ResponseBody
	public String cartAdd(Long id, 
			@AuthenticationPrincipal PrincipalDetails principal) {
		Cart cart = new Cart();
		User user=principal.getUser();
		Game game=gameService.findById(id);
		if(user==null || game==null)
			return "fail";
		if(cartRepository.findByUserIdAndGameId(user.getId(),game.getId())!=null)
			return "IsCart";
		if(myGameRepository.findByUserIdAndGameId(user.getId(),game.getId())!=null)
			return "IsGame";
		cart.setGame(game);
		cart.setUser(user);
		gameService.addCart(cart);
			return "success";
	}
}
