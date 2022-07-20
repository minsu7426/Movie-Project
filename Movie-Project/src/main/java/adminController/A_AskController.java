package adminController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.AskDto;
import service.AskService;

@Controller
@RequestMapping("/admin/ask")
public class A_AskController {
	
	@Autowired
	private AskService askService;
	
	@RequestMapping("/askmanage")
	public String askManage(Model model, HttpServletRequest request) {
		List<AskDto> askList = askService.getAllList(request.getParameter("search_item"), request.getParameter("text"));
		model.addAttribute("askList", askList);
		return "/admin/ask/one_on_one_manage";
	}
	
	@RequestMapping("/askdetail")
	public String askDetail(@RequestParam("askcode")String ask_code, Model model) {
		askService.setUpdateHit(ask_code);
		AskDto askDto = askService.getAskByCode(ask_code);
		model.addAttribute("askDto", askDto);
		return "/admin/ask/one_on_one_admin_detail";
	}
	
	@RequestMapping("/askanswer")
	public String askAnswer(AskDto askDto) {
		askService.setAnswer(askDto);
		return "redirect:/admin/ask/askdetail?askcode="+ askDto.getAsk_code();
	}
}
