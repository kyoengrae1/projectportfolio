package com.team4.game.service;

import java.util.List;

import com.team4.game.entity.Cart;
import com.team4.game.entity.MyGame;
import com.team4.game.entity.User;

public interface CartService {

	List<Cart> findByUserId(Long user_id);

	//List<Cart> findByUser(User user);

	void deleteById(Long id);

	List<MyGame> findMyGameByUserId(Long user_id);

}
