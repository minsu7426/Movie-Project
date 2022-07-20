package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ScreenDao;
import dto.ScreenDto;

@Service
public class ScreenServiceImpl implements ScreenService{

	@Autowired
	private ScreenDao screenDao;
	
	@Override
	public List<ScreenDto> getScreenList() {
		return null;
	}
	
	@Override
	public int getScreenCount() {
		return 0;
	}
}
