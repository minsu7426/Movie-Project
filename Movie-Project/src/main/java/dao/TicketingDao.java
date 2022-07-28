package dao;

import java.util.List;

import dto.Criteria;
import dto.ReserveCompleteDto;
import dto.ScreenDto;
import dto.TicketDto;
import dto.TicketingDto;

public interface TicketingDao {
	
	// 해당 영화 상영관 가져오기
	public List<ScreenDto> getSelectByMovie(String scr_code, String date);
	
	// 해당 영화 날짜 가져오기
	public List<String> getDateByMovie(String scr_code);
	
	// 상영관 개수 가져오기
	public List<String> getScreenByMovieDate(String scr_code, String date);
	
	// 해당 상영관 들고오기
	public ScreenDto getScreenByCode(String scr_code);
	
	// 티켓 등록
	public void setTicket(TicketDto ticketDto, String code);
	
	// 티켓 업데이트(좌석 판매 완료)
	public void setScreenUpdate(String scr_code, String seat);
	
	// 티켓성공페이지
	public ReserveCompleteDto getReserveComplete(String code, String seat, String id);
	
	//티켓 리스트 가져오기
	public List<TicketingDto> getTicketingList(Criteria cri, String id);
	
	//예매내역 리스트 카운트
	public int getTicketingListCount(Criteria cri, String id);
}
