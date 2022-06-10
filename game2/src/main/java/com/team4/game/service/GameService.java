package com.team4.game.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.team4.game.constant.Category;
import com.team4.game.entity.BoardReply;
import com.team4.game.entity.Cart;
import com.team4.game.entity.Game;
import com.team4.game.entity.GameAttach;
import com.team4.game.entity.GameReply;
import com.team4.game.entity.User;

public interface GameService {

	Page<Game> findAll(Pageable pageable);
	public Page<Game> findList(String category ,String field, String keyword, Pageable pageable);
	
	List<Game> findAll();
	long count();
	void insert(Game game);
	Game findById(Long id);
	Cart addCart(Cart cart);
	void insertGameAndFile(Game game, List<GameAttach> attachList);
	void deleteById(Long id);
	void insetReply(GameReply reply);
	List<GameReply> replyList(Long gno);
	void replyDelete(Long id);
	Double replyAvg(Long gno);
	void update(Game game);
	void addSellCount(Long id);

}
