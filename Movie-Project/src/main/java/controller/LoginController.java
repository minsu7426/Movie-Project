package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.UserDto;
import service.UserService;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/signup")
	public String signUp(UserDto userDto) {
		return "/login/signup";
	}
	
	@PostMapping("/signup")
	public String insertSignup(UserDto userDto, HttpServletRequest request) {
		userService.setInsertUser(userDto, request);
		return "/login/login";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("/login")
	public String postLogin(String user_Id, String user_Pw, HttpSession session) {
		UserDto userDto = userService.getSelectByIdPw(user_Id, user_Pw);
		String[] userChk = new String[2];
		if(userDto.getUser_Id().equals("admin")) {
			userChk[0] = userDto.getUser_Id();
			session.setAttribute("user", userChk);
			return "admin/admin_main";
		}
		userChk[0] = userDto.getUser_Id();
		session.setAttribute("user", userChk);
		return "/home";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
}
