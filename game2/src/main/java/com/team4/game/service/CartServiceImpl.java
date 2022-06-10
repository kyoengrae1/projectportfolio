package com.team4.game.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.game.entity.Cart;
import com.team4.game.entity.MyGame;
import com.team4.game.entity.User;
import com.team4.game.repository.CartRepository;
import com.team4.game.repository.MyGameRepository;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private MyGameRepository myGameRepository;
	
	@Override
	public List<Cart> findByUserId(Long user_id) {
		return cartRepository.findByUserId(user_id);
	}

//	@Override
//	public List<Cart> findByUser(User user) {
//		return cartRepository.findByUser(user);
//	}

	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		cartRepository.deleteById(id);
	}

	@Override
	public List<MyGame> findMyGameByUserId(Long user_id) {
		// TODO Auto-generated method stub
		return myGameRepository.findByUserId(user_id);
	}
	
	

}
