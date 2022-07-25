package service;


import java.util.List;

import dto.SalesDto1;
import dto.SalesMovieDto;
import dto.SalesTotalDto;

public interface SalesService {

	//영화 매출 가져오기
	public SalesMovieDto getSalesMovie(String movie_title);
	
	//영화 목록 가져오기
	public List<SalesTotalDto> getSalesMovieList();
}
