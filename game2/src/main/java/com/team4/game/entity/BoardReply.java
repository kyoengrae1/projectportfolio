package com.team4.game.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

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
public class BoardReply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="board_reply_id")
	private Long id;
	private String writer;
	
	private String content;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern ="yyyy-MM-dd")
	private Date regdate;
	
	@ManyToOne
	@JoinColumn(name="bno")
	private Board board;
	
	@ManyToOne
	@JoinColumn(name="uno")
	private User user;

}
