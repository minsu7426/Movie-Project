package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie/*")
public class MovieController {
	
	
	@RequestMapping("current_screen")
	public void current_screen() {
		
	}
	
	@RequestMapping("shown_screen")
	public void shown_screen() {
		
	}
}
