package service;

import java.util.List;

import org.springframework.stereotype.Service;

import dto.ScreenDto;

public interface ScreenService {

	//상영관 목록 가져오기
	public List<ScreenDto> getScreenList();
	
	//상영관 개수 가져오기
	public int getScreenCount();
}
