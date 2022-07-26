package service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ScreenDao;
import dto.Criteria;
import dto.MovieDto;
import dto.ScreenDto;

@Service
public class ScreenServiceImpl implements ScreenService{

	@Autowired
	private ScreenDao screenDao;
	
	@Override
	public List<ScreenDto> getScreenList(Criteria cri) {
		screenDao.setFlag();
		return screenDao.getScreenList(cri);
	}
	
	@Override
	public int getScreenCount(Criteria cri) {
		return screenDao.getScreenCount(cri);
	}
	
	@Override
	public List<MovieDto> getMovieList() {
		return screenDao.getMovieList();
	}
	
	@Override
	public void setScreenAdd(ScreenDto dto, List<String> timeChecked) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(dto.getDate_start(), formatter);
		LocalDate endDate = LocalDate.parse(dto.getDate_end(), formatter).plusDays(1);
		
		List<LocalDate> date = startDate.datesUntil(endDate).collect(Collectors.toList());
		screenDao.setScreenAdd(dto, timeChecked, date);
	}
	@Override
	public ScreenDto getUpdate(String scr_code) {
		return screenDao.getUpdate(scr_code);
	}
	
	@Override
	public String getMovieTitle(String scr_code) {
		return screenDao.getMovieTitle(scr_code);
	}
	
	@Override
	public void setDelete(String scr_code) {
		screenDao.setDelete(scr_code);
	}
	
	@Override
	public void setUpdate(ScreenDto dto) {
		screenDao.setUpdate(dto);
	}
	
	@Override
	public int getListCount(Criteria cri) {
		return screenDao.getListCount(cri);
	}
}
