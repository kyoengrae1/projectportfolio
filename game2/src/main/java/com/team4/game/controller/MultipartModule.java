package com.team4.game.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.team4.game.entity.BoardAttach;
import com.team4.game.entity.GameAttach;

@Component
public class MultipartModule {
	//날짜 생성
	String today=new SimpleDateFormat("yyMMdd").format(new Date());

	//게임
	public List<GameAttach> fileUpload(HttpServletRequest request, List<MultipartFile> files) throws IllegalStateException, IOException{
		if(files!=null) {
			System.out.println("files : "+files);
		}
		//실제경로
		ServletContext application = request.getServletContext();
		String realpath = application.getRealPath("/resource/upload/game");
		//폴더 경로
		String saveFolder=realpath+File.separator+today;
		//폴더생성
		File folder = new File(saveFolder);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		//업로드할 파일을 담을 배열 생성
		List<GameAttach> fileList = new ArrayList<GameAttach>();
		
		for(MultipartFile multipartFile : files) {
			//업로드할 파일이 없으면 반복문 벗어나기, 필요없을텐데?
			if (multipartFile.isEmpty()) {
				continue;
			}
			//원래 파일 이름
			String originFile=multipartFile.getOriginalFilename();
			//중복 방지를 위한 UUID
			UUID uuid = UUID.randomUUID();
			//세이브할 파일 이름
			String saveFileName=uuid.toString()+"_"+originFile;
			//파일 타입
			String fileType=multipartFile.getContentType();
			fileType=fileType.substring(0, fileType.indexOf("/"));
			GameAttach gameAttach = new GameAttach();
			gameAttach.setUuid(uuid);
			gameAttach.setOriginfile(originFile);
			gameAttach.setFiletype(fileType);
			gameAttach.setSavefile(saveFileName);
			gameAttach.setSavefolder(today);
			//오류는 스프링한테 넘기기
			multipartFile.transferTo(new File(saveFolder,saveFileName));
			fileList.add(gameAttach);
		}
		return fileList;
	}
	
	//게시판
	public List<BoardAttach> fileUploadBoard(HttpServletRequest request, List<MultipartFile> files) throws IllegalStateException, IOException{
		if(files!=null) {
			System.out.println("files : "+files);
		}
		//실제경로
		ServletContext application = request.getServletContext();
		String realpath = application.getRealPath("/resource/upload/board");
		//폴더 경로
		String saveFolder=realpath+File.separator+today;
		//폴더생성
		File folder = new File(saveFolder);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		//업로드할 파일을 담을 배열 생성
		List<BoardAttach> fileList = new ArrayList<BoardAttach>();
		
		for(MultipartFile multipartFile : files) {
			//업로드할 파일이 없으면 반복문 벗어나기, 필요없을텐데?
			if (multipartFile.isEmpty()) {
				continue;
			}
			//원래 파일 이름
			String originFile=multipartFile.getOriginalFilename();
			//중복 방지를 위한 UUID
			UUID uuid = UUID.randomUUID();
			//세이브할 파일 이름
			String saveFileName=uuid.toString()+"_"+originFile;
			//파일 타입
			String fileType=multipartFile.getContentType();
			fileType=fileType.substring(0, fileType.indexOf("/"));
			BoardAttach boardAttach = new BoardAttach();
			boardAttach.setOriginfile(originFile);
			boardAttach.setFiletype(fileType);
			boardAttach.setSavefile(saveFileName);
			boardAttach.setSavefolder(today);
			//오류는 스프링한테 넘기기
			multipartFile.transferTo(new File(saveFolder,saveFileName));
			fileList.add(boardAttach);
		}
		return fileList;
	}
}
