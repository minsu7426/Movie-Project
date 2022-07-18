package dao;

import java.util.List;

import dto.MovieDto;

public interface MovieDao {
	
	//상영중 영화 조회
	public List<MovieDto> getCurrentList();
	
	//상영예정 영화 조회
	public List<MovieDto> getShown_screenList();
}
