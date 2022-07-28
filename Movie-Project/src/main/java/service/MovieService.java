package service;

import java.util.List;

import dto.Criteria;
import dto.MovieDto;
import dto.SlideDto;

public interface MovieService {

	//current_screen 조회
	public List<MovieDto> getCurrent_screen();
	
	//shown_screen 조회
	public List<MovieDto> getShown_screen();
	
	//전체 영화 조회
	public List<MovieDto> getTotal_Screen(Criteria cri);
	
	//영화 상세페이지
	public MovieDto getMovie_Detail(String movie_code);
	
	//영화 업로드
	public void setAdd(MovieDto moviedto);
	
	//영화 업데이트
	public void setUpdate(MovieDto moviedto);
	
	//총 영화 개수
	public Integer getAllCount(String search_item, String text);
	
	// 관람한 영화 리스트
	public List<MovieDto> getShowedMovie(String id);
	
	// 메인 페이지 영화 슬라이드
	public List<SlideDto> getSlideMovie();
}
