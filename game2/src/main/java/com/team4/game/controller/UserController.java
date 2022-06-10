package com.team4.game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team4.game.config.auth.PrincipalDetails;
import com.team4.game.entity.Cart;
import com.team4.game.entity.Game;
import com.team4.game.entity.MyGame;
import com.team4.game.entity.User;
import com.team4.game.repository.GameRepository;
import com.team4.game.repository.MyGameRepository;
import com.team4.game.service.CartService;
import com.team4.game.service.GameService;
import com.team4.game.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;
	@Autowired
	private MyGameRepository myGameRepository;
	@Autowired
	private GameService gameService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/detail")
	public void userDetail() {
	
	}
	
	@GetMapping("/update")
	public void updateForm() {
		
	}
	
	@PostMapping("/update")
	public String update(Model model, User user, @AuthenticationPrincipal PrincipalDetails principal) {
		System.out.println(user);
		if(!user.getPassword().equals("")) {
			String rowPassword=user.getPassword();
			String encPassword=bCryptPasswordEncoder.encode(rowPassword);
			user.setPassword(encPassword);
		}
		User user1 = userService.update(user);
		principal.setUser(user1);
		return "redirect:/user/detail";
	}
	
	@GetMapping("/delete")
	public String userDelete(@AuthenticationPrincipal PrincipalDetails principal) {
		userService.deleteById(principal.getUser().getId());
		return "redirect:/logout";
	}
	
	@GetMapping("/cartList")
	public String cartList(Model model, @AuthenticationPrincipal PrincipalDetails principal) {
		Long user_id = principal.getUser().getId();
		List<Cart> carts = cartService.findByUserId(user_id);
		Long sum=0l;
		for(Cart cart : carts) {
			sum+=cart.getGame().getPrice();
		}
		model.addAttribute("sum", sum);
		model.addAttribute("lists", carts);
		return "/user/cart";
	}
	
	@GetMapping("/paymentForm")
	public String paymentForm(Model model, @AuthenticationPrincipal PrincipalDetails principal) {
		Long user_id = principal.getUser().getId();
		List<Cart> carts = cartService.findByUserId(user_id);
		Long sum=0l;
		for(Cart cart : carts) {
			sum+=cart.getGame().getPrice();
		}
		model.addAttribute("sum", sum);
		model.addAttribute("lists", carts);
		return "/user/payment";
	}
	
	@GetMapping("/payment")
	public String payment(@AuthenticationPrincipal PrincipalDetails principal) {
		Long user_id = principal.getUser().getId();
		System.out.println(user_id);
		List<Cart> carts = cartService.findByUserId(user_id);
		for(Cart cart : carts) {
			MyGame mygame = new MyGame();
			Long id = cart.getId();
			User user=cart.getUser();
			Game game=cart.getGame();
			mygame.setUser(user);
			mygame.setGame(game);
			gameService.addSellCount(game.getId());
			myGameRepository.save(mygame);
			cartService.deleteById(id);
		}
		return "/user/payComplete";
	}
	
	@GetMapping("/cartDelete")
	public String cartDelete(Long id) {
		cartService.deleteById(id);
		return "redirect:/user/cartList";
	}
	
	@GetMapping("/mygame")
	public String mygame(Model model, @AuthenticationPrincipal PrincipalDetails principal) {
		Long user_id = principal.getUser().getId();
		List<MyGame> mygames = cartService.findMyGameByUserId(user_id);
		model.addAttribute("lists", mygames);
		return "/user/mygame";
	}
}
