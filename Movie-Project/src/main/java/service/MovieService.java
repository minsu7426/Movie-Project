package service;

import java.util.List;

import dto.MovieDto;

public interface MovieService {

	//current_screen 조회
	public List<MovieDto> current_screen();
	
	//shown_screen 조회
	public List<MovieDto> shown_screen();
}
