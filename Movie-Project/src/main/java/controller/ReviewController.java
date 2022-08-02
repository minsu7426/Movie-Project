package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.ReviewDto;
import service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("/reviewsubmit")
	public String reviewSubmit(ReviewDto reviewDto) {
		reviewService.setInsertReview(reviewDto);
		return "redirect:/movie/moviedetail?moviecode=" + reviewDto.getReview_movie();
	}
	
	@RequestMapping(value = "/reviewdelete", method = RequestMethod.GET)
	public String reviewDelete(@RequestParam Map<String, String> param) {
		String review_code = param.get("reviewcode");
		String movie_code = param.get("moviecode");
		reviewService.setDeleteReview(review_code);
		return "redirect:/movie/moviedetail?moviecode=" + movie_code;
	}
}
