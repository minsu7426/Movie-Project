package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MovieDao;
import dto.Criteria;
import dto.MovieDto;
import dto.SlideDto;

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
	public List<MovieDto> getTotal_Screen(Criteria cri) {
		List<MovieDto> list = movieDao.getTotal_Screen(cri);
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

	@Override
	public void setUpdate(MovieDto moviedto) {
		movieDao.setUpdate(moviedto);
	}
	
	@Override
	public Integer getAllCount(String search_item, String text) {
		return movieDao.getAllCount(search_item, text);
	}
	
	@Override
	public List<MovieDto> getShowedMovie(String id) {
		return movieDao.getShowedMovie(id);
	}
	
	@Override
	public List<SlideDto> getSlideMovie() {
		return movieDao.getSlideMovie();
	}
	
	@Override
	public void setDelete(String code) {
		movieDao.setDelete(code);
	}
}
