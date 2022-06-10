package com.team4.game.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team4.game.entity.User;



public interface UserRepository extends JpaRepository<User, Long> {
	
	public User findByUsername(String username);
}
