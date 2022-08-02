package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
@RequestMapping("/ask")
public class AskController {
	
	@Autowired
	private AskService askService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String one_on_one(HttpSession session) {
		String[] id = (String[])session.getAttribute("user");
		if(id == null) {
			return "redirect:/login";
		}
		return "/one_on_one/one_on_one";
	}
	
	@PostMapping("/one-on-one")
	public String askInsert(AskDto askDto, HttpSession session) {
		String[] id = (String[])session.getAttribute("user");
		askDto.setAsk_id(id[0]);
		askService.setInsertAsk(askDto);
		return "/one_on_one/one_on_one";
	}
	
	@RequestMapping(method = {RequestMethod.GET}, value = "/one-on-one-detail")
	public String oneDetail(@RequestParam("askid")String id, Model model, Criteria cri) {
		List<AskDto> askList = askService.getListById(id, cri);
		PageDto pageDto = new PageDto();
		
		pageDto.setCri(cri);
		pageDto.setTotalCount(askService.getSearchListCountById(id));
		
		if(askList == null) {
			return "/one_on_one/one_on_one_detail";
		} else{
			model.addAttribute("askList", askList);
			model.addAttribute("pageDto", pageDto);
			return "/one_on_one/one_on_one_detail";
		}
	}
	
	@RequestMapping(value = "/oneonone-user", method = {RequestMethod.GET})
	public String oneUser(@RequestParam("askcode")String ask_code, Model model) {
		AskDto askDto = askService.getAskByCode(ask_code);
		askService.setUpdateHit(ask_code);
		model.addAttribute("askDto", askDto);
		return "/one_on_one/one_on_one_user_detail";
	}
}
