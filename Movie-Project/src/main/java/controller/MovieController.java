package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.MovieDto;
import dto.ReviewDto;
import service.MovieService;
import service.ReviewService;

@Controller
@RequestMapping("/movie/")
public class MovieController {

	@Autowired
	private MovieService movieService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("current_screen")
	public void current_screen(Model model) {
		List<MovieDto> currentList = movieService.getCurrent_screen();
		List<MovieDto> shownList = movieService.getShown_screen();
		model.addAttribute("currentList", currentList);
		model.addAttribute("shownList", shownList);
	}

	@RequestMapping("shown_screen")
	public void shown_screen(Model model) {
		List<MovieDto> shownList = movieService.getShown_screen();
		List<MovieDto> currentList = movieService.getCurrent_screen();
		model.addAttribute("shownList", shownList);
		model.addAttribute("currentList", currentList);
	}
	
	@RequestMapping("moviedetail")
	public String movieDetail(@RequestParam("moviecode")String movie_code, Model model) {
		MovieDto movieDto = movieService.getMovie_Detail(movie_code);
		List<ReviewDto> reviewList = reviewService.getListByMovie(movie_code);
		Double review_star = 0.0;
		
		for(int i = 0; i<reviewList.size(); i++) {
			review_star += reviewList.get(i).getReview_star();
		}
		review_star /= reviewList.size();
		
		if(review_star.equals(Double.NaN)) {
			review_star = 0.0;
		}
		System.out.println(review_star);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("movieDto", movieDto);
		model.addAttribute("review_star", review_star);
		return "/movie/movie_detail";
	}
}
