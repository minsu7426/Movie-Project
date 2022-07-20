package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.UserDto;
import service.UserService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/membermanage")
	public String membermanage(Model model) {
		List<UserDto> userList = userService.getSelectAll();
		model.addAttribute("userList", userList);
		return "/admin/member_manage";
	}
	
	@RequestMapping("/memberdetail")
	public String memberDetail(@RequestParam("memberId") String id, Model model) {
		UserDto userDto = userService.getSelectById(id);
		model.addAttribute("member", userDto);
		return "/admin/member_detail";
	}
	
	@RequestMapping("/deletemember")
	public String memberDelete(@RequestParam("memberId") String id) {
		userService.setDeleteUser(id);
		return "redirect:/adminmember/membermanage";
	}
	
	@RequestMapping("/updatemember")
	public String memberUpdate(UserDto userDto) {
		userService.setClassUpdate(userDto);
		return "redirect:/adminmember/membermanage";
	}
}
