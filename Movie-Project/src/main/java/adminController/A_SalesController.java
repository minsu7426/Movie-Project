package adminController;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.SalesMovieDto;
import dto.SalesTotalDto;
import service.SalesService;

@Controller
@RequestMapping("/admin/sales/")
public class A_SalesController {

	@Autowired
	private SalesService salesService;
	
	@RequestMapping("sales_movie")
	public void sales_movie(@RequestParam String movie_title, String search_title, Model model) {
		if(search_title != null && search_title != "") {
			movie_title = search_title;
		}
		SalesMovieDto dto = salesService.getSalesMovie(movie_title);
		
		model.addAttribute("dto",dto);
		model.addAttribute("movie_title",movie_title);
	}
	
	@RequestMapping("sales_total")
	public void sales_total(Model model) {
		List<SalesTotalDto> list = salesService.getSalesMovieList();
		
		model.addAttribute("list", list);
	}
}
