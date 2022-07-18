package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.MovieDto;
import service.MovieService;

@Controller
@RequestMapping("/movie/")
public class MovieController {

	@Autowired
	private MovieService movieService;

	@RequestMapping("current_screen")
	public void current_screen(Model model) {
		List<MovieDto> currentList = movieService.current_screen();
		List<MovieDto> shownList = movieService.shown_screen();
		model.addAttribute("currentList", currentList);
		model.addAttribute("shownList", shownList);
	}

	@RequestMapping("shown_screen")
	public void shown_screen(Model model) {
		List<MovieDto> shownList = movieService.shown_screen();
		List<MovieDto> currentList = movieService.current_screen();
		model.addAttribute("shownList", shownList);
		model.addAttribute("currentList", currentList);
	}
}
