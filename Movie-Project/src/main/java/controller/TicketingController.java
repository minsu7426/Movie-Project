package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.MovieDto;
import service.MovieService;

@Controller
@RequestMapping("/ticketing")
public class TicketingController {
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/reserve")
	public String ticketReserve(Model model) {
		List<MovieDto> movieList = movieService.getCurrent_screen();
		model.addAttribute("movieList", movieList);
		return "ticketing/ticketing1";
	}
}
