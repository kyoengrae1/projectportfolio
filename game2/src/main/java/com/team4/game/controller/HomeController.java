package com.team4.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.game.constant.Role;
import com.team4.game.entity.User;
import com.team4.game.service.UserService;



@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping(value={"","index"})
	public String index() {
		return "index";
	}
	
	@GetMapping("join")
	public String joinForm() {
		return "user/join";
	}
	
	@PostMapping("join")
	@ResponseBody
	public String register(@RequestBody User user) {
		user.setRole(Role.ROLE_USER);
		if(user.getUsername().equals("admin")) {
			user.setRole(Role.ROLE_ADMIN);
		}
		if(userService.findByUsername(user.getUsername())!=null) {
			return "fail";
		}
		
		String rowPassword=user.getPassword();
		String encPassword=bCryptPasswordEncoder.encode(rowPassword);
		user.setPassword(encPassword);
		userService.register(user);
		return "success";
	}
	
	@GetMapping("login")
	public String loginForm() {
		return "user/login";
	}
	
	@PostMapping("idCheck")
	@ResponseBody
	public String idCheck(String username) {
		if(userService.findByUsername(username)!=null) {
			return "false";
		}
		return "true";
	}

}
