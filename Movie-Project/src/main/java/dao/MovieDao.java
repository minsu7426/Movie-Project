package dao;

import java.util.List;

import dto.MovieDto;

public interface MovieDao {
	
	//상영중 영화 조회
	public List<MovieDto> getCurrentList();
	
	//상영예정 영화 조회
	public List<MovieDto> getShown_screenList();
	
	//전체 영화 조회
	public List<MovieDto> getTotal_Screen();
	
	//영화 상세페이지
	public MovieDto getMovie_Detail(String movie_code);
	
	//영화 업로드
	public void setAdd(MovieDto moviedto);
	
	
}
