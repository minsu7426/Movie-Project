package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ScheduleDao;
import dto.ScheduleDto;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Override
	public List<ScheduleDto> getScheduleDate() {
		return scheduleDao.getScheduleDate();
	}
	
	@Override
	public List<ScheduleDto> getScheduleMovie(String date) {
		return scheduleDao.getScheduleMovie(date);
	}
	
	@Override
	public List<ScheduleDto> getScheduleScreen(String date) {
		return scheduleDao.getScheduleScreen(date);
	}
	@Override
	public List<ScheduleDto> getScheduleSeat(String date) {
		return scheduleDao.getScheduleSeat(date);
	}
}
