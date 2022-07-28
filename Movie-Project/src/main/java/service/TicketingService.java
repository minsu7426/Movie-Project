package service;

import java.util.List;

import dto.ReserveCompleteDto;
import dto.ScreenDto;
import dto.TicketDto;

public interface TicketingService {
	//해당 영화 상영관 가져오기
	public List<ScreenDto> getSelectByMovie(String scr_code, String date);
	
	
	//해당 영화 날짜 가져오기
	public List<String> getDateByMovie(String scr_code);
	
	//상영관 개수 가져오기
	public List<String> getScreenByMovieDate(String scr_code, String date);
	
	// 해당 상영관 들고오기
	public ScreenDto getScreenByCode(String scr_code);
	
	// 티켓 등록
	public void setTicket(TicketDto ticketDto, String code);
	
	// 티켓성공페이지
	public ReserveCompleteDto getReserveComplete(String code, String seat, String id);
}
