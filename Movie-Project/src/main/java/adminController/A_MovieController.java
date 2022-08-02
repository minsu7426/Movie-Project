package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Criteria;
import dto.MovieDto;
import dto.PageDto;
import service.MovieService;
import util.FileUpload;

@Controller
@RequestMapping("/admin/movie")
public class A_MovieController {

	@Autowired
	private MovieService movieService;

	@RequestMapping
	public String movie_list(Criteria cri, Model model) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(movieService.getAllCount(cri.getSearch_item(), cri.getText()));
		
		List<MovieDto> movieList = movieService.getTotal_Screen(cri);
		model.addAttribute("list", movieList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "/admin/movie/movie_manage";
	}

	@RequestMapping(value = "movie_update", method = RequestMethod.GET)
	public void movie_detail(Model model, @RequestParam String movie_code) {
		MovieDto dto = movieService.getMovie_Detail(movie_code);
		model.addAttribute("dto", dto);
	}

	@PostMapping("movie_update")
	public String movieUpdate(MovieDto movieDto) {
		movieService.setUpdate(movieDto);
		return "redirect:/admin/movie";
	}
	
	@RequestMapping(value = "movie_add", method = RequestMethod.GET)
	public void movie_add() {
	}

	@PostMapping("movie_add")
	public String addAction(HttpServletRequest request) throws IOException {
		MovieDto movie = FileUpload.upload(request);
		movieService.setAdd(movie);
		return "redirect:/admin/movie";
	}
	
	@RequestMapping(value = "movie_delete", method = RequestMethod.GET)
	public String deleteAction(@RequestParam String code) {
		movieService.setDelete(code);
		return "redirect:/admin/movie";
	}
	
}
