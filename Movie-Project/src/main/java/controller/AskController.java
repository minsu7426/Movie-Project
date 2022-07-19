package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.AskDto;

@Controller
@RequestMapping("/ask")
public class AskController {
	
	@RequestMapping("/one-on-one")
	public String one_on_one() {
		return "/one_on_one/one_on_one";
	}
	
	@PostMapping("/one-on-one")
	public String askInsert(AskDto askDto) {
		
		return "/one_on_one/one_on_one_detail";
	}
	
	@RequestMapping("/one-on-one-detail")
	public String oneDetail() {
		return "/one_on_one/one_on_one_detail";
	}
	
	
}
