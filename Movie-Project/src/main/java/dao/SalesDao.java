package dao;

import java.util.List;

import dto.SalesDto1;

public interface SalesDao {
	
	//영화별 수익 목록 가져오기
	public List<SalesDto1> getSalesMovieList();
	
	//금일 매출 가져오기
	public int getToday(String movie_title);
	
	//전일 매출 가져오기
	public int getYesday(String movie_title);
	
	//주간 매출 가져오기
	public int getWeek(String movie_title);
	
	//월간 매출 가져오기
	public int getMonth(String movie_title);
	
	//전체 매출 가져오기
	public int getTotal(String movie_title);

	//금일 좌석 수 가져오기
	public List<Integer> getTodaySeat(String movie_title);
	
	//전체 좌석 수 가져오기
	public List<Integer> getTotalSeat(String movie_title);
	
	//관람객 리스트 가져오기
	public int getViewCount(String movie_title);
	
	//남성 관객 수 가져오기
	public int getManCount(String movie_title);
	
	//전체 연령 리스트 가져오기
	public float getAvgAge(String movie_title);
}
