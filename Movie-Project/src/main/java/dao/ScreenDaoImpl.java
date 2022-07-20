package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import dto.ScreenDto;

@Repository
public class ScreenDaoImpl implements ScreenDao{

	@Override
	public List<ScreenDto> getScreenList() {
		return null;
	}
	
	@Override
	public int getScreenCount() {
		return 0;
	}
}
