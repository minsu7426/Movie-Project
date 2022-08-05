package service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
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
	public String getMovieTitle() {
		return salesDao.getTitleMovie();
	}

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
			todaySeat += todaySeatList.get(i);
		}
		
		if(todaySeat != 0) {
			todaySeat = (((todaySeatList.size()*30) - todaySeat) / (todaySeatList.size()*30)) * 100;
		}
		
		salesDto.setSales_viewing_today(todaySeat);

		List<Integer> totalSeatList = salesDao.getTotalSeat(movie_title);
		float totalSeat = 0;
		for (int i = 0; i < totalSeatList.size(); i++) {
			totalSeat += totalSeatList.get(i);
		}
		
		if(totalSeat != 0) {
			totalSeat = (((totalSeatList.size()*30) - totalSeat) / (totalSeatList.size()*30)) * 100;
		}
		
		salesDto.setSales_viewing_total(totalSeat);

		Integer viewCount = salesDao.getViewCount(movie_title);
		Integer manCount = salesDao.getManCount(movie_title);

		if(viewCount != 0) {
			salesDto.setSales_man(((float)manCount / viewCount)*100);
			salesDto.setSales_woman(100-(float)salesDto.getSales_man());
		} else {
			salesDto.setSales_man(0);
			salesDto.setSales_woman(0);
		}
		
		salesDto.setSales_avg(salesDao.getAvgAge(movie_title));

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
					float manResult = man / list.get(i).getSales_viewCount() * 100;
					list.get(i).setSales_man(manResult);
				}
			}
		}

		List<Map<String, Integer>> womanCount = salesDao.getJuminCount(2);
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < womanCount.size(); j++) {
				if (womanCount.get(j).containsKey(list.get(i).getSales_title())) {
					float woman = womanCount.get(j).get(list.get(i).getSales_title());
					float womanResult = woman / list.get(i).getSales_viewCount() * 100;
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
					float result = 0;
					if(seat != 0) {
						result = ((seat / seatSum) * 100);
					}
					list.get(i).setSales_viewing(result);
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setRank(1);
		}
		for (int i = 0; i < list.size() - 1; i++) {
			for (int j = 1; j < list.size(); j++) {
				if (list.get(i).getSales_viewing() > list.get(j).getSales_viewing()) {
					list.get(j).setRank(list.get(j).getRank()+1);
				} else if(list.get(i).getSales_viewing() < list.get(j).getSales_viewing()) {
					list.get(i).setRank(list.get(i).getRank()+1);
				}
			}
		}
		
		Comparator<SalesTotalDto> cp = new Comparator<SalesTotalDto>() {
			@Override
			public int compare(SalesTotalDto o1, SalesTotalDto o2) {
				if(o1.getRank() > o2.getRank()) return 1;
				if(o1.getRank() < o2.getRank()) return -1;
				return 0;
			}
		};
		Collections.sort(list, cp);
		
		return list;
	}
}
