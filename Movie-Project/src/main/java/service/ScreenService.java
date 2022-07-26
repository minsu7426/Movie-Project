package service;

import java.util.List;

import org.springframework.stereotype.Service;

import dto.Criteria;
import dto.MovieDto;
import dto.ScreenDto;

public interface ScreenService {

	//상영관 목록 가져오기
	public List<ScreenDto> getScreenList(Criteria cri);
	
	//상영관 개수 가져오기
	public int getScreenCount(Criteria cri);
	
	//상영관 등록
	public void setScreenAdd(ScreenDto dto, List<String> timeChecked);
	
	//영화 목록 가져오기
	public List<MovieDto> getMovieList();
	
	//상영관 수정 페이지
	public ScreenDto getUpdate(String scr_code);
	
	//영화 이름 가자오기
	public String getMovieTitle(String scr_code);
	
	//영화 삭제
	public void setDelete(String scr_code);
	
	//영화 업데이트
	public void setUpdate(ScreenDto dto);
	
	public int getListCount(Criteria cri);
}
