package service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SalesDao;
import dto.SalesMovieDto;
import dto.SalesTotalDto;

@Service
public class SalesServiceImpl implements SalesService{
	
	@Autowired
	private SalesDao salesDao;
	
	@Override
	public SalesMovieDto getSalesMovie(String movie_title) {
		SalesMovieDto salesDto = new SalesMovieDto();
		
		salesDto.setSales_today(salesDao.getToday(movie_title));
		salesDto.setSales_yesday(salesDao.getYesday(movie_title));
		salesDto.setSales_week(salesDao.getWeek(movie_title));
		salesDto.setSales_month(salesDao.getMonth(movie_title));
		salesDto.setSales_total(salesDao.getTotal(movie_title));
		
		List<Integer> todaySeatList = salesDao.getTodaySeat(movie_title);
		float todaySeat = 0;
		for(int i = 0; i < todaySeatList.size(); i++) {
			todaySeat += ((-(todaySeatList.get(i)-30) * 100) / 30.0);
		}
		todaySeat /= todaySeatList.size();
		salesDto.setSales_viewing_today(todaySeat);
		
		List<Integer> totalSeatList = salesDao.getTotalSeat(movie_title);
		float totalSeat = 0;
		for(int i = 0; i < totalSeatList.size(); i++) {
			totalSeat += ((-(totalSeatList.get(i)-30) * 100) / 30.0);
		}
		totalSeat /= totalSeatList.size();
		salesDto.setSales_viewing_total(totalSeat);
		
		int viewCount = salesDao.getViewCount(movie_title);
		int manCount = salesDao.getManCount(movie_title);
		salesDto.setSales_man((float)manCount/viewCount);
		salesDto.setSales_woman(-((float)manCount-100));
		
		salesDto.setSales_avg(salesDao.getAvgAge(movie_title));
		
		System.out.println("금일 "+movie_title+"매출 = "+salesDto.getSales_today());
		System.out.println("어제 "+movie_title+"매출 = "+salesDto.getSales_yesday());
		System.out.println("주간 "+movie_title+"매출 = "+salesDto.getSales_week());
		System.out.println("월간 "+movie_title+"매출 = "+salesDto.getSales_month());
		System.out.println("전체 "+movie_title+"매출 = "+salesDto.getSales_total());
		System.out.println("금일 좌석 예매율 "+movie_title+"="+salesDto.getSales_viewing_today());
		System.out.println("전체 좌석 예매율 "+movie_title+"="+salesDto.getSales_viewing_total());
		System.out.println("남성 비율 "+movie_title+"="+salesDto.getSales_man());
		System.out.println("여성 비율 "+movie_title+"="+salesDto.getSales_woman());
		System.out.println("평균 연령"+movie_title+"="+salesDto.getSales_avg());
		
		return salesDto;
	}
	
	@Override
	public List<SalesTotalDto> getSalesMovieList() {		
		List<SalesTotalDto> list = null;
		
				
		return list;
		
//		List<SalesDto> list = salesDao.getSalesMovieList();
//		SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd");
//		Calendar date = Calendar.getInstance();
//		date.add(Calendar.DATE, 0);
//		
//		System.out.println("getTime="+f1.format(date.getTime()));
	}
}
