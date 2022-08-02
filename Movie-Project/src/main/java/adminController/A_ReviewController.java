package adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Criteria;
import dto.PageDto;
import dto.ReviewDataDto;
import service.ReviewService;

@Controller
@RequestMapping("/admin/review")
public class A_ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping
	public String reviewManage(Model model, Criteria cri) {
		
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(reviewService.getAllCount(cri.getSearch_item(), cri.getText()));
		
		List<ReviewDataDto> reviewList = reviewService.getAllList(cri.getSearch_item(), cri.getText(), cri);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "/admin/review/review_manage";
	}
	
	@RequestMapping(value = "/reviewdelete", method = RequestMethod.GET)
	public String reviewDelete(@RequestParam("reviewcode")String review_code) {
		reviewService.setDeleteReview(review_code);
		return "redirect:/admin/review";
	}
}
