package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.UserDto;
import service.UserService;

@Controller
@RequestMapping("/login")
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
	public String login(String user_id, String user_pw) {
		return "/login/login";
	}
	
	@PostMapping("/login")
	public String postLogin(String user_Id, String user_Pw, HttpSession session) {
		UserDto userDto = userService.getSelectByIdPw(user_Id, user_Pw);
		if(userDto.getUser_id().equals("admin")) {
			session.setAttribute("user", userDto);
			return "admin/admin_main";
		}
		session.setAttribute("user", userDto);
		return "/home";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	 // 아이디 체크
    @RequestMapping("/idCheck")
    public String idCheck(){

        return "login/idCheck";
    }
}
