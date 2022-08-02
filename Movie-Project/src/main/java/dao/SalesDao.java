package dao;

import java.util.List;
import java.util.Map;

import dto.SalesTotalDto;

public interface SalesDao {
	
	//영화 타이틀
	public String getTitleMovie();
	
	//금일 매출
	public int getToday(String movie_title);
	
	//전일 매출
	public int getYesday(String movie_title);
	
	//주간 매출
	public int getWeek(String movie_title);
	
	//월간 매출
	public int getMonth(String movie_title);
	
	//전체 매출
	public int getTotal(String movie_title);

	//금일 좌석 수
	public List<Integer> getTodaySeat(String movie_title);
	
	//전체 좌석 수
	public List<Integer> getTotalSeat(String movie_title);
	
	//관람객 리스트
	public int getViewCount(String movie_title);
	
	//남성 관객 수
	public int getManCount(String movie_title);
	
	//전체 연령 리스트
	public float getAvgAge(String movie_title);
	
// 전체 수익	
	
	//영화 목록
	public List<SalesTotalDto> getMovieTitle();
	
	//금일 매출
	public List<Map<String, Integer>> getTodayList();
	
	//전체 매출
	public List<Map<String, Integer>> getTotalList();
	
	//누적 관람객
	public List<Map<String, Integer>> getViewCount();
	
	//성별 관람객
	public List<Map<String, Integer>> getJuminCount(int jumin);
	
	//전체 좌석 수
	public List<Map<String, Integer>> getTotalSeatList();
	
}
