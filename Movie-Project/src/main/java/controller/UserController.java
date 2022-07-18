package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@RequestMapping("mypage")
	public void mypage() {
		
	}
	
	@RequestMapping("update")
	public String update() {
		
		return "/home";
	}
	
	@RequestMapping("viewing_detail")
	public void viewing_detail() {
		
	}
}
