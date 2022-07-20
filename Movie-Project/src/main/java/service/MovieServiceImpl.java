package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MovieDao;
import dto.MovieDto;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDao movieDao;

	@Override
	public List<MovieDto> getCurrent_screen() {
		List<MovieDto> list = movieDao.getCurrentList();
		return list;
	}

	@Override
	public List<MovieDto> getShown_screen() {
		List<MovieDto> list = movieDao.getShown_screenList();
		return list;
	}
	
	@Override
	public List<MovieDto> getTotal_Screen() {
		List<MovieDto> list = movieDao.getTotal_Screen();
		return list;
	}
	
	@Override
	public MovieDto getMovie_Detail(String movie_code) {
		MovieDto dto = movieDao.getMovie_Detail(movie_code);
		return dto;
	}
	
	@Override
	public void setAdd(MovieDto moviedto) {
		movieDao.setAdd(moviedto);
	}
}
