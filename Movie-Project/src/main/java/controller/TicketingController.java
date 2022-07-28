package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.MovieDto;
import dto.ReserveCompleteDto;
import dto.ScheduleDto;
import dto.ScreenDto;
import dto.TicketDto;
import service.MovieService;
import service.ScheduleService;
import service.TicketingService;

@Controller
@RequestMapping("/ticketing")
public class TicketingController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private TicketingService ticketingService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping("/reserve")
	public String ticketReserve(Model model) {
		List<MovieDto> movieList = movieService.getCurrent_screen();
		model.addAttribute("movieList", movieList);
		return "ticketing/ticketing1";
	}
	
	@PostMapping("/secondreserve")
	public String ticketReserve(HttpServletRequest request, Model model) {
		String movie_code = request.getParameter("movie_code");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String date = formatter.format(new Date());
		List<String> screenCnt = ticketingService.getScreenByMovieDate(movie_code, date);
		List<String> dateList = ticketingService.getDateByMovie(movie_code);
		List<ScreenDto> screenList = ticketingService.getSelectByMovie(movie_code, date);
		model.addAttribute("screencnt", screenCnt); // 상영관 개수
		model.addAttribute("movie_code", movie_code); // 영화번호
		model.addAttribute("screenList", screenList); // 상영관 리스트
		model.addAttribute("dateList", dateList); // 날짜
		return "ticketing/ticketing2";
	}
	
	@RequestMapping("/secondreserve")
	public String ticketingDate(@RequestParam Map<String, String> param, Model model) {
		List<String> screenCnt = ticketingService.getScreenByMovieDate(param.get("moviecode"), param.get("date"));
		List<String> dateList = ticketingService.getDateByMovie(param.get("moviecode"));
		List<ScreenDto> screenList = ticketingService.getSelectByMovie(param.get("moviecode"), param.get("date"));
		model.addAttribute("screencnt", screenCnt); // 상영관 개수
		model.addAttribute("movie_code", param.get("moviecode")); // 영화번호
		model.addAttribute("screenList", screenList); // 상영관 리스트
		model.addAttribute("dateList", dateList); // 날짜
		return "ticketing/ticketing2";
	}
	
	@RequestMapping("/thirdreserve")
	public String ticketingSeat(HttpServletRequest request, Model model) {
		String movie_code = request.getParameter("movie_code");
		String scr_code = request.getParameter("scr_code");
		ScreenDto screen = ticketingService.getScreenByCode(scr_code);
		MovieDto movie = movieService.getMovie_Detail(movie_code);
		model.addAttribute("screen", screen);
		model.addAttribute("movie", movie);
		return "ticketing/ticketing3";
	}
	
	@PostMapping("/fourthreserve")
	public String ticketingpay(HttpServletRequest request, HttpSession session, Model model) {
		
		int price = Integer.parseInt(request.getParameter("price"));
		String code = request.getParameter("scr_code");
		String[] id = (String[])session.getAttribute("user");
		String adult = request.getParameter("adult");
		String teen = request.getParameter("teen");
		String people;
		
		if(teen == null) {
			people = "성인 " + adult + "명 ";
		} else {
			people = "성인 " + adult + "명 " + "청소년 " + teen + "명";			
		}
		
		String[] seat = request.getParameterValues("seat");
		String s = String.join(",", seat);
		TicketDto ticket = new TicketDto();
		ticket.setTic_id(id[0]);
		ticket.setTic_seat(s);
		ticket.setTic_payment(price);
		ticketingService.setTicket(ticket, code);
		
		ReserveCompleteDto rcDto = ticketingService.getReserveComplete(code, s, id[0]);
		model.addAttribute("rcDto", rcDto);
		model.addAttribute("people", people);
		return "ticketing/ticketing4";
	}
	
	@RequestMapping("ticketlist")
	public String ticketList() {
		return "ticketing/ticket_detail";
	}
	
	@RequestMapping("movieschedule")
	public String movieSchedule(@RequestParam Map<String, String> param, Model model) {
		List<ScheduleDto> scheduleDate = scheduleService.getScheduleDate(); // 상영 가능한 날짜
		List<ScheduleDto> scheduleMovie = scheduleService.getScheduleMovie(param.get("date"));
		List<ScheduleDto> scheduleScreen = scheduleService.getScheduleScreen(param.get("date"));
		List<ScheduleDto> scheduleSeat = scheduleService.getScheduleSeat(param.get("date"));
		model.addAttribute("scheduleDate", scheduleDate);
		model.addAttribute("scheduleMovie", scheduleMovie);
		model.addAttribute("scheduleScreen", scheduleScreen);
		model.addAttribute("scheduleSeat", scheduleSeat);
		return "ticketing/movie_schedule";
	}
	
}
