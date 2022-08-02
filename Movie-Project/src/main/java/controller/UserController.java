package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.MovieDto;
import dto.UserDto;
import service.MovieService;
import service.TicketService;
import service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypage(HttpSession session, Model model) {
		String[] user = (String[])session.getAttribute("user");
		String user_id = user[0];
		UserDto dto = userService.getSelectById(user_id);
		model.addAttribute("userDto", dto);
	}
	
	@PostMapping("/update")
	public String update(UserDto userDto, HttpServletRequest request) {
		userService.setUpdateUser(userDto, request);
		return "/home";
	}
	
	@RequestMapping(value = "viewing_detail", method = RequestMethod.GET)
	public String viewing_detail(HttpSession session, Model model) {
		String[] user = (String[])session.getAttribute("user");
		if(user == null) {
			return "login/login";
		}
		String user_id = user[0];
		List<MovieDto> movie = movieService.getShowedMovie(user_id);
		model.addAttribute("movielist", movie);
		return "/user/viewing_detail";
	}
}
