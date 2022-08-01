package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/benefit")
public class BenefitController {
	
	@RequestMapping
	public String benefit() {
		
		return "/benefit/benefit_info";
	}
	
}
