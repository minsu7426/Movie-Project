package dao;

import java.time.LocalDate;
import java.util.List;

import dto.MovieDto;
import dto.ScreenDto;

public interface ScreenDao {

	//상영관 목록 가져오기
	public List<ScreenDto> getScreenList();
	
	//상영관 개수 가져오기
	public int getScreenCount();
	
	public void setScreenAdd(ScreenDto dto, List<String> timeChecked, List<LocalDate> date);
	
	//영화 리스트 가져오기
	public List<MovieDto> getMovieList();
	
	//상영관 수정 페이지
	public ScreenDto getUpdate(String scr_code);
	
	//영화 제목 가져오기
	public String getMovieTitle(String scr_code);
	
	//영화 삭제
	public void setDelete(String scr_code);
	
	//영화 수정
	public void setUpdate(ScreenDto dto);
}
