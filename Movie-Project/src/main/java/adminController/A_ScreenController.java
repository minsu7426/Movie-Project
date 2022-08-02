package adminController;

import java.util.List;

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
import dto.ScreenDto;
import service.ScreenService;

@Controller
@RequestMapping("/admin/screen")
public class A_ScreenController {

	@Autowired
	private ScreenService screenService;

	@RequestMapping
	public String screen_manage(Criteria cri, Model model) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		
		List<MovieDto> title = screenService.getMovieList();
		List<ScreenDto> list = screenService.getScreenList(cri);
		
		pageDto.setTotalCount(screenService.getListCount(cri));
		model.addAttribute("title",title);
		model.addAttribute("list",list);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "/admin/screen/screen_manage";
	}

	@RequestMapping(value = "screen_add", method = RequestMethod.GET)
	public void screen_add(Model model) {
		List<MovieDto> list = screenService.getMovieList();
		model.addAttribute("list", list);
	}
	
	@PostMapping("screen_postAdd")
	public String screen_postAdd(ScreenDto dto ,@RequestParam List<String> timeChecked) {
		screenService.setScreenAdd(dto, timeChecked);
		
		return "redirect:/admin/screen";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String screen_update(@RequestParam String scr_code, Model model) {
		String title = screenService.getMovieTitle(scr_code);
		ScreenDto dto = screenService.getUpdate(scr_code);
		model.addAttribute("title", title);
		model.addAttribute("dto", dto);
		return "/admin/screen/screen_update";
	}
	
	@PostMapping("update")
	public String screen_updateAction(ScreenDto dto) {
		screenService.setUpdate(dto);
		
		return "redirect:/admin/screen";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String screen_delete(@RequestParam String scr_code) {
		screenService.setDelete(scr_code);
		
		return "redirect:/admin/screen";
	}
}
