package service;

import java.util.List;

import dto.ScheduleDto;

public interface ScheduleService {
	
	// 상영가능한 날짜가져오기
	public List<ScheduleDto> getScheduleDate();
	
	// 해당 날짜 영화 가져오기
	public List<ScheduleDto> getScheduleMovie(String date);
	
	// 해당 영화 상영관 가져오기
	public List<ScheduleDto> getScheduleScreen(String date);
	
	// 해당 영화 좌석수 가져오기
	public List<ScheduleDto> getScheduleSeat(String date);
}
