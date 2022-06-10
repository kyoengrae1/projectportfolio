package com.team4.game.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.team4.game.entity.Board;
import com.team4.game.entity.User;

public interface UserService {
	
	public void register(User user);

	public User findByUsername(String username);

	public void deleteById(Long id);

	public Page<User> findAll(Pageable pageable);

	public long count();

	public User update(User user);


}
