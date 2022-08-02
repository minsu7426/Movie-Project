package adminController;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.AskDto;
import dto.Criteria;
import dto.PageDto;
import service.AskService;

@Controller
@RequestMapping("/admin/ask")
public class A_AskController {
	
	@Autowired
	private AskService askService;
	
	@RequestMapping
	public String askManage(Model model, Criteria cri) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(askService.getAllCount(cri.getSearch_item(), cri.getText()));
		
		List<AskDto> askList = askService.getAllList(cri.getSearch_item(), cri.getText(), cri);
		model.addAttribute("askList", askList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "/admin/ask/one_on_one_manage";
	}
	
	@RequestMapping(value = "/askdetail", method = RequestMethod.GET)
	public String askDetail(@RequestParam("askcode")String ask_code, Model model) {
		askService.setUpdateHit(ask_code);
		AskDto askDto = askService.getAskByCode(ask_code);
		model.addAttribute("askDto", askDto);
		return "/admin/ask/one_on_one_admin_detail";
	}
	
	@PostMapping("/askanswer")
	public String askAnswer(AskDto askDto) {
		askService.setAnswer(askDto);
		return "redirect:/admin/ask/askdetail?askcode="+ askDto.getAsk_code();
	}
}
