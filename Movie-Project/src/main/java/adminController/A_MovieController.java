package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import dto.Criteria;
import dto.MovieDto;
import dto.PageDto;
import service.MovieService;
import util.FileUpload;

@Controller
@RequestMapping("/admin/movie/")
public class A_MovieController {

	@Autowired
	private MovieService movieService;

	@RequestMapping("movie_manage")
	public void movie_list(Criteria cri, Model model) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(movieService.getAllCount(cri.getSearch_item(), cri.getText()));
		
		List<MovieDto> movieList = movieService.getTotal_Screen(cri);
		model.addAttribute("list", movieList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
	}

	@RequestMapping("movie_update")
	public void movie_detail(Model model, @RequestParam String movie_code) {
		MovieDto dto = movieService.getMovie_Detail(movie_code);
		model.addAttribute("dto", dto);
	}

	@RequestMapping("movie_add")
	public void movie_add() {
	}

	@PostMapping("movie_add")
	public String addAction(HttpServletRequest request) throws IOException {
		MovieDto movie = FileUpload.upload(request);
		System.out.println("영화 제목=" + movie.getMovie_title());
		movieService.setAdd(movie);
		return "redirect:/admin/movie/movie_manage";
	}
	
	@PostMapping("movie_update")
	public String movieUpdate(MovieDto movieDto) {
		movieService.setUpdate(movieDto);
		return "redirect:/admin/movie/movie_manage";
	}
	
//	public String form(@RequestParam MultipartFile file) throws IOException {
//		String uploadDir = "c:/upload/";
//		if (!file.isEmpty()) {
//			String filename = file.getOriginalFilename();
//
//			String fullPath = uploadDir + filename;
//			file.transferTo(new File(fullPath));
//		}
//		return "redirect:/admin/movie/movie_list";
//	}
}
