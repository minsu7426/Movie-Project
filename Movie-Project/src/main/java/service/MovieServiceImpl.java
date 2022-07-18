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
	public List<MovieDto> current_screen() {
		List<MovieDto> list = movieDao.getCurrentList();
		return list;
	}

	@Override
	public List<MovieDto> shown_screen() {
		List<MovieDto> list = movieDao.getShown_screenList();
		return list;
	}

}
