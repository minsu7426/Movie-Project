package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.UserDto;
import service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/signup")
	public String signUp() {
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
	public String postLogin(String user_Id, String user_Pw, HttpSession session, Model model) {
		UserDto userDto = userService.getSelectByIdPw(user_Id, user_Pw);
		String error = "1";
		if(userDto == null) {
			model.addAttribute("error", error);
			return "/login/login";
		}
		
		String[] userChk = new String[2];
		if(userDto.getUser_id().equals("admin")) {
			userChk[0] = userDto.getUser_id();
			session.setAttribute("user", userChk);
			return "redirect:/admin/home";
		}
		userChk[0] = userDto.getUser_id();
		session.setAttribute("user", userChk);
		return "/home";
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	 // 아이디 체크
    @RequestMapping("/idCheck")
    public String idCheck(){
        return "/login/idCheck";
    }
    
    @RequestMapping("/idCheckdo")
    public String idCheckDo(@RequestParam("userId") String id, Model model) {
    	Integer count = userService.getIdCount(id);
    	model.addAttribute("cnt", count);
    	model.addAttribute("id", id);
    	return "/login/idCheck";
    }
    
    //아이디검색
    @RequestMapping("/searchid")
    public String searchId() {
    	return "/login/searchId";
    }
    
    @PostMapping("/searchid")
    public String postId(UserDto userDto, HttpServletRequest request, Model model) {
    	String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
    	List<String> id = userService.getSearchId(userDto.getUser_name(), jumin);
    	String error = "1";
    	if(id.isEmpty()) {
    		model.addAttribute("error", error);
    		return "/login/searchId";
    	} else {
    		model.addAttribute("id", id.get(0));
    		return "/login/searchId";
    	}
    }
    
    //비밀번호 검색
    @RequestMapping("/searchpw")
    public String searchPw() {
    	return "/login/searchPw";
    }
    
    @PostMapping("/searchpw")
    public String searchPost(UserDto userDto, Model model) {
    	List<String> pw = userService.getSearchPw(userDto.getUser_id(), userDto.getUser_name());
    	String error = "1";
    	if(pw.isEmpty()) {
    		model.addAttribute("error", error);
    		return "/login/searchPw";
    	} else {
    		model.addAttribute("pw", pw.get(0));
    		return "/login/searchPw";
    	}
    }
    
}

