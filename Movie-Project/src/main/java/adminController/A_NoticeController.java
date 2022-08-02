package adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Criteria;
import dto.NoticeDto;
import dto.PageDto;
import service.NoticeService;

@Controller
@RequestMapping("/admin/notice")
public class A_NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping
	public String noticeAdmin(Criteria cri, Model model) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(noticeService.getListCount(cri));
		
		List<NoticeDto> list = noticeService.getList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "/admin/notice/notice_admin";
	}
	
	@RequestMapping(value = "/noticeadd", method = RequestMethod.GET)
	public String noticeAdd() {
		return "/admin/notice/notice_add";
	}
	
	@PostMapping("/noticeadd")
	public String noticePost(NoticeDto noticeDto) {
		noticeService.setInsert(noticeDto);
		return "redirect:/admin/notice";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("notice_code") int notice_code,@ModelAttribute("cri") Criteria cri, Model model) {
		NoticeDto dto = noticeService.getRead(notice_code);
		model.addAttribute("notice",dto);
		return "/admin/notice/notice_update";
	}
	
	@RequestMapping(value = "/noticedelete", method = RequestMethod.GET)
	public String delete(@RequestParam("noticecode") int notice_code) {
		noticeService.setDelete(notice_code);
		return "redirect:/admin/notice";
	}
	
	@PostMapping("/noticeupdate")
	public String update(NoticeDto noticeDto) {
		noticeService.setUpdate(noticeDto);
		return "redirect:/admin/notice/detail?notice_code=" + noticeDto.getNotice_code();
	}
}
