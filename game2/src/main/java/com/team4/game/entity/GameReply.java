package com.team4.game.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GameReply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="game_reply_id")
	private Long id;
	private String writer;
	private String content;
	//샘플에서는 나누기 때문에 더블
	private Double grade;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date regdate;
	
	@ManyToOne
	@JoinColumn(name="uno")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="gno")
	private Game game;
	
	
}
