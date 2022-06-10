package com.team4.game.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team4.game.entity.Cart;
import com.team4.game.entity.User;

public interface CartRepository extends JpaRepository<Cart, Long>{

	//@Query("select c from Cart c where user_id=?1")
	List<Cart> findByUserId(Long user_id);

	void deleteByUserId(Long id);
	void deleteByGameId(Long id);

	Cart findByUserIdAndGameId(Long id, Long id2);
}
