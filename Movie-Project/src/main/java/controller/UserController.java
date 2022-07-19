package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.UserDto;
import service.UserService;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("mypage")
	public void mypage(HttpSession session, Model model) {
		String[] user = (String[])session.getAttribute("user");
		String user_id = user[0];
		UserDto dto = userService.getSelectById(user_id);
		model.addAttribute("userDto", dto);
	}
	
	@RequestMapping("update")
	public String update(UserDto userDto, HttpServletRequest request) {
		userService.setUpdateUser(userDto, request);
		return "/home";
	}
	
	@RequestMapping("viewing_detail")
	public void viewing_detail() {
		
	}
}
