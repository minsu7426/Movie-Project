package dao;

import java.util.List;

import dto.Criteria;
import dto.MovieDto;

public interface MovieDao {
	
	//상영중 영화 조회
	public List<MovieDto> getCurrentList();
	
	//상영예정 영화 조회
	public List<MovieDto> getShown_screenList();
	
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
}
