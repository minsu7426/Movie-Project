package dao;

import java.util.List;

import dto.ScreenDto;

public interface ScreenDao {

	//상영관 목록 가져오기
	public List<ScreenDto> getScreenList();
	
	//상영관 개수 가져오기
	public int getScreenCount();
}
