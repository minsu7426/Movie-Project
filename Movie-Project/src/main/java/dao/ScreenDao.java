package dao;

import java.time.LocalDate;
import java.util.List;

import dto.Criteria;
import dto.MovieDto;
import dto.ScreenDto;

public interface ScreenDao {

	//상영관 flag 정리
	public void setFlag();
	
	//상영관 목록 가져오기
	public List<ScreenDto> getScreenList(Criteria cri);
	
	//상영관 개수 가져오기
	public int getScreenCount(Criteria cri);
	
	//상영관 추가
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
	
	//영화 목록 개수
	public int getListCount(Criteria cri);
}
