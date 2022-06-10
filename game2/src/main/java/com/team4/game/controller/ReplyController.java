package com.team4.game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team4.game.config.auth.PrincipalDetails;
import com.team4.game.entity.Board;
import com.team4.game.entity.BoardReply;
import com.team4.game.entity.Game;
import com.team4.game.entity.GameReply;
import com.team4.game.entity.User;
import com.team4.game.service.BoardService;
import com.team4.game.service.GameService;
import com.team4.game.service.UserService;

@RestController
public class ReplyController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	@Autowired
	private GameService gameService;
	

	@PostMapping("/replies/new/{bno}")
	public ResponseEntity<String> replyInsert(@PathVariable Long bno,
			@RequestBody BoardReply reply,  @AuthenticationPrincipal PrincipalDetails principal){
		Board b=new Board();
		b.setId(bno);
		reply.setBoard(b);
		reply.setUser(principal.getUser());
		boardService.insetReply(reply);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@GetMapping("/replies/getList/{bno}")
	public List<BoardReply> list(@PathVariable Long bno){
		System.out.println(bno);
		List<BoardReply> rList=boardService.replyList(bno);
		return rList;
	}
	@DeleteMapping("/replies/{id}")
	public Long delete(@PathVariable Long id) {
		boardService.replyDelete(id);
		return id;
	}
	
	
	@PostMapping("/gamereplies/new/{gno}")
	public ResponseEntity<String> gamereplyInsert(@PathVariable Long gno,
			@RequestBody GameReply reply, @AuthenticationPrincipal PrincipalDetails principal){
		Game g=new Game();
		g.setId(gno);
		reply.setGame(g);
		reply.setUser(principal.getUser());
		gameService.insetReply(reply);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@GetMapping("/gamereplies/getList/{gno}")
	public List<GameReply> gamelist(@PathVariable Long gno){
		List<GameReply> rList=gameService.replyList(gno);
		return rList;
	}
	@DeleteMapping("/gamereplies/{id}")
	public Long gamedelete(@PathVariable Long id) {
		gameService.replyDelete(id);
		return id;
	}
	
	@GetMapping("/gamereplies/avg/{gno}")
	public Double replyAvg(@PathVariable Long gno) {
		return gameService.replyAvg(gno);
	}
	
	
	

}
