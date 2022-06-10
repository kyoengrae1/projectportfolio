package com.team4.game.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.team4.game.constant.Category;
import com.team4.game.entity.BoardReply;
import com.team4.game.entity.Cart;
import com.team4.game.entity.Game;
import com.team4.game.entity.GameAttach;
import com.team4.game.entity.GameReply;
import com.team4.game.repository.CartRepository;
import com.team4.game.repository.GameAttachRepository;
import com.team4.game.repository.GameReplyRepository;
import com.team4.game.repository.GameRepository;
import com.team4.game.repository.MyGameRepository;

@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	private GameRepository gameRepository;
	@Autowired
	private GameReplyRepository gameReplyRepository;
	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private GameAttachRepository gameAttachRepository;
	@Autowired
	private MyGameRepository myGameRepository;

	@Override
	public Page<Game> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return gameRepository.findAll(pageable);
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return gameRepository.count();
	}

	@Override
	public List<Game> findAll() {
		// TODO Auto-generated method stub
		return gameRepository.findAll();
	}

	@Override
	public void insert(Game game) {
		// TODO Auto-generated method stub
		gameRepository.save(game);
	}

	@Override
	public Game findById(Long id) {
		// TODO Auto-generated method stub
		return gameRepository.findById(id).get();
	}

	@Override
	public Cart addCart(Cart cart) {
		// TODO Auto-generated method stub
		return cartRepository.save(cart);
	}
	//게임, 파일 동시에 등록
	@Transactional
	@Override
	public void insertGameAndFile(Game game, List<GameAttach> attachList) {
		// TODO Auto-generated method stub
		Game game2=gameRepository.save(game);
		System.out.println(game2);
		if(attachList.size()>0) {
			for(GameAttach gameAttach:attachList) {
				gameAttach.setGame(game2);
				gameAttachRepository.save(gameAttach);
			}
		}
	}
	@Transactional
	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		cartRepository.deleteByGameId(id);
		myGameRepository.deleteByGameId(id);
		gameRepository.deleteById(id);
		
	}

	@Override
	public Page<Game> findList(String category ,String field, String keyword, Pageable pageable) {
		// TODO Auto-generated method stub
		Category cate = null;
		if(category.equals("")) {
			cate = Category.All;
		}else {
			cate = Category.valueOf(category);
		}
		System.out.println(cate);
		Page<Game> gameList=null;
		
		
		if(cate.toString().equals("All")) {
			if(field.equals("") || field==null) {
				gameList = gameRepository.findAll(pageable);
			}else if(field.equals("gname")) {
				gameList= gameRepository.findByGnameContaining(keyword, pageable);
			}else if(field.equals("developer")) {
				gameList= gameRepository.findByDeveloperContaining(keyword, pageable);
			}else if(field.equals("gd")) {
				gameList= gameRepository.findByGnameContainingOrDeveloperContaining(keyword, keyword, pageable);
			}else if(field.equals("price")) {
				gameList= gameRepository.findByPriceLessThanEqualOrderByPriceDesc(Long.parseLong(keyword) ,pageable);
			}else {
				gameList= gameRepository.findAll(pageable);
			}
			return gameList;
		}
		if(field.equals("") || field==null) {
			gameList= gameRepository.findByCategory(cate ,pageable);
		}
		else if(field.equals("gname")) {
			gameList= gameRepository.findByCategoryAndGnameContaining(cate ,keyword, pageable);
		}else if(field.equals("developer")) {
			gameList= gameRepository.findByCategoryAndDeveloperContaining(cate ,keyword, pageable);
		}else if(field.equals("gd")) {
			gameList= gameRepository.findByCategoryAndGnameContainingOrCategoryAndDeveloperContaining(cate ,keyword,cate ,keyword, pageable);
		}else if(field.equals("price")) {
			gameList= gameRepository.findByCategoryAndPriceLessThanEqualOrderByPriceDesc(cate ,Long.parseLong(keyword) ,pageable);
		}else {
			gameList= gameRepository.findAll(pageable);
		}
		return gameList;
	}

	@Override
	public void insetReply(GameReply reply) {
		// TODO Auto-generated method stub
		gameReplyRepository.save(reply);
	}

	@Override
	public List<GameReply> replyList(Long gno) {
		// TODO Auto-generated method stub
		return gameReplyRepository.gameReplyList(gno);
	}

	@Override
	public void replyDelete(Long id) {
		// TODO Auto-generated method stub
		gameReplyRepository.deleteById(id);
		
	}

	@Override
	public Double replyAvg(Long gno) {
		// TODO Auto-generated method stub
		return ((double)Math.round(gameReplyRepository.findOneAvg(gno)*10))/10;
	}
	
	@Transactional
	@Override
	public void update(Game game) {
		// TODO Auto-generated method stub
		Game g = gameRepository.findById(game.getId()).get();
		g.setGname(game.getGname());
		g.setDeveloper(game.getDeveloper());
		g.setPrice(game.getPrice());
		g.setMainContent(game.getMainContent());
		g.setSubContent(game.getSubContent());
	}
	@Transactional
	@Override
	public void addSellCount(Long id) {
		// TODO Auto-generated method stub
		Game g = gameRepository.findById(id).get();
		g.setSellCount(g.getSellCount()+1);
	}
	
}
