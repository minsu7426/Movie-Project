package adminController;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		List<MovieDto> list = movieService.getTotal_Screen();
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
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
	public String addAction(MovieDto movieDto, HttpServletRequest request) throws IOException {
		System.out.println("영화 제목=" + movieDto.getMovie_title());
		FileUpload.upload(request);
		movieService.setAdd(movieDto);
		

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
