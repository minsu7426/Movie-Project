package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.SlideDto;
import service.MovieService;

@Controller
public class HomeController {
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/home")
	public String home(Model model) {
		List<SlideDto> list = movieService.getSlideMovie();
		model.addAttribute("list", list);
		return "home";
	}
}
