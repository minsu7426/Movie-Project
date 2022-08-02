package adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Criteria;
import dto.PageDto;
import dto.UserDto;
import service.UserService;

@Controller
@RequestMapping("/admin/member")
public class A_UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping
	public String membermanage(Model model, Criteria cri) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(userService.getAllCount(cri.getSearch_item(), cri.getText()));
		
		List<UserDto> userList = userService.getSelectAll(cri.getSearch_item(), cri.getText(), cri);
		model.addAttribute("userList", userList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "/admin/member/member_manage";
	}
	
	@RequestMapping(value = "/memberdetail", method = RequestMethod.GET)
	public String memberDetail(@RequestParam("memberId") String id, Model model) {
		UserDto userDto = userService.getSelectById(id);
		model.addAttribute("member", userDto);
		return "/admin/member/member_detail";
	}
	
	@RequestMapping(value = "/deletemember", method = RequestMethod.GET)
	public String memberDelete(@RequestParam("memberId") String id) {
		userService.setDeleteUser(id);
		return "redirect:/admin/member";
	}
	
	@PostMapping("/updatemember")
	public String memberUpdate(UserDto userDto) {
		userService.setClassUpdate(userDto);
		return "redirect:/admin/member";
	}
}
