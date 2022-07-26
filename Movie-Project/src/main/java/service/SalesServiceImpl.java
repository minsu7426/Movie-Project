package service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SalesDao;
import dto.SalesMovieDto;
import dto.SalesTotalDto;

@Service
public class SalesServiceImpl implements SalesService {

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
		for (int i = 0; i < todaySeatList.size(); i++) {
			todaySeat += ((-(todaySeatList.get(i) - 30) * 100) / 30.0);
		}
		todaySeat /= todaySeatList.size();
		salesDto.setSales_viewing_today(todaySeat);

		List<Integer> totalSeatList = salesDao.getTotalSeat(movie_title);
		float totalSeat = 0;
		for (int i = 0; i < totalSeatList.size(); i++) {
			totalSeat += ((-(totalSeatList.get(i) - 30) * 100) / 30.0);
		}
		totalSeat /= totalSeatList.size();
		salesDto.setSales_viewing_total(totalSeat);

		int viewCount = salesDao.getViewCount(movie_title);
		int manCount = salesDao.getManCount(movie_title);
		salesDto.setSales_man((float) manCount / viewCount);
		salesDto.setSales_woman(-((float) manCount - 100));

		salesDto.setSales_avg(salesDao.getAvgAge(movie_title));

		System.out.println("금일 " + movie_title + "매출 = " + salesDto.getSales_today());
		System.out.println("어제 " + movie_title + "매출 = " + salesDto.getSales_yesday());
		System.out.println("주간 " + movie_title + "매출 = " + salesDto.getSales_week());
		System.out.println("월간 " + movie_title + "매출 = " + salesDto.getSales_month());
		System.out.println("전체 " + movie_title + "매출 = " + salesDto.getSales_total());
		System.out.println("금일 좌석 예매율 " + movie_title + "=" + salesDto.getSales_viewing_today());
		System.out.println("전체 좌석 예매율 " + movie_title + "=" + salesDto.getSales_viewing_total());
		System.out.println("남성 비율 " + movie_title + "=" + salesDto.getSales_man());
		System.out.println("여성 비율 " + movie_title + "=" + salesDto.getSales_woman());
		System.out.println("평균 연령" + movie_title + "=" + salesDto.getSales_avg());

		return salesDto;
	}

	@Override
	public List<SalesTotalDto> getSalesMovieList() {
		List<SalesTotalDto> list = salesDao.getMovieTitle();

		List<Map<String, Integer>> today = salesDao.getTodayList();
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < today.size(); j++) {
				if (today.get(j).containsKey(list.get(i).getSales_title())) {
					list.get(i).setSales_today(today.get(j).get(list.get(i).getSales_title()));
				}
			}
		}

		List<Map<String, Integer>> total = salesDao.getTotalList();
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < total.size(); j++) {
				if (total.get(j).containsKey(list.get(i).getSales_title())) {
					list.get(i).setSales_total(total.get(j).get(list.get(i).getSales_title()));
				}
			}
		}

		List<Map<String, Integer>> viewCount = salesDao.getViewCount();
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < viewCount.size(); j++) {
				if (viewCount.get(j).containsKey(list.get(i).getSales_title())) {
					list.get(i).setSales_viewCount(viewCount.get(j).get(list.get(i).getSales_title()));
				}
			}
		}

		List<Map<String, Integer>> manCount = salesDao.getJuminCount(1);
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < manCount.size(); j++) {
				if (manCount.get(j).containsKey(list.get(i).getSales_title())) {
					float man = manCount.get(j).get(list.get(i).getSales_title());
					float manResult = ((man) * 100) / list.get(i).getSales_viewCount();
					list.get(i).setSales_man(manResult);
				}
			}
		}

		List<Map<String, Integer>> womanCount = salesDao.getJuminCount(2);
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < womanCount.size(); j++) {
				if (womanCount.get(j).containsKey(list.get(i).getSales_title())) {
					float woman = womanCount.get(j).get(list.get(i).getSales_title());
					float womanResult = ((woman) * 100) / list.get(i).getSales_viewCount();
					list.get(i).setSales_woman(womanResult);
				}
			}
		}

		List<Map<String, Integer>> totalSeat = salesDao.getTotalSeatList();
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < totalSeat.size(); j++) {
				if (totalSeat.get(j).containsKey(list.get(i).getSales_title())) {
					float seatSum = (totalSeat.get(j).get(list.get(i).getSales_title())) * 30;
					float seat = list.get(i).getSales_viewCount();
					float result = (((seat / seatSum) * 100));
					System.out.println(list.get(i).getSales_title() + "전체예매율=" + result);
					list.get(i).setSales_viewing(result);
				}
			}
		}

		for (int i = 0; i < list.size(); i++) {
			list.get(i).setRank(i+1);
			for (int j = 1; j < list.size(); j++) {
				if (list.get(i).getSales_viewing() < list.get(j).getSales_viewing()) {
					list.get(i).setRank(i+1);
				}

			}

		}
		System.out.println("today= " + list.get(0).getSales_today());
		System.out.println("total0= " + list.get(0).getSales_total());
		System.out.println("total1= " + list.get(1).getSales_total());
		System.out.println("total2= " + list.get(2).getSales_total());

//			for(int j = 0; j < today.size(); j++) {
//				if(list.get(i).getSales_title().equals(today.get(j).get(list.get(i).getSales_title()))==true) {
//					System.out.println("실행여부 확인");
//					list.get(i).setSales_today(Integer.parseInt(String.valueOf(today.get(j).get(list.get(i).getSales_title()))));
//				}

//			}
//		Map<String, Object> total = salesDao.getTotalList();
//		System.out.println(total.entrySet());

		/*
		 * List<SalesTotalDto> total = salesDao.getTotalList(); for (int i = 0; i <
		 * total.size(); i++) { SalesTotalDto dto = total.get(i); if
		 * (dto.getSales_title().equals(list.get(i).getSales_title())) {
		 * list.get(i).setSales_total(dto.getSales_total()); } }
		 */

		return list;
//		List<SalesDto> list = salesDao.getSalesMovieList();
//		SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd");
//		Calendar date = Calendar.getInstance();
//		date.add(Calendar.DATE, 0);
//		
//		System.out.println("getTime="+f1.format(date.getTime()));
	}
}
