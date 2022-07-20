package service;

import java.util.List;

import dto.MovieDto;

public interface MovieService {

	//current_screen 조회
	public List<MovieDto> getCurrent_screen();
	
	//shown_screen 조회
	public List<MovieDto> getShown_screen();
	
	//전체 영화 조회
	public List<MovieDto> getTotal_Screen();
	
	//영화 상세페이지
	public MovieDto getMovie_Detail(String movie_code);
	
	//영화 업로드
	public void setAdd(MovieDto moviedto);
}
