package adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/noticeadmin")
	public String noticeAdmin(Criteria cri, Model model) {
		List<NoticeDto> list;
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		
		if(cri.getSearch_item() != null && cri.getText() != null) {
			list = noticeService.getSearchList(cri);
			pageDto.setTotalCount(noticeService.getSearchListCount(cri));
			System.out.println("카운트="+noticeService.getSearchListCount(cri));
		} else {
			list = noticeService.getList(cri);
			pageDto.setTotalCount(noticeService.getListCount());
		}
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);

		return "/admin/notice/notice_admin";
	}
	
	@RequestMapping("/noticeadd")
	public String noticeAdd() {
		return "/admin/notice/notice_add";
	}
	
	@PostMapping("/noticeadd")
	public String noticePost(NoticeDto noticeDto) {
		noticeService.setInsert(noticeDto);
		return "redirect:/admin/notice/noticeadmin";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam("notice_code") int notice_code,@ModelAttribute("cri") Criteria cri, Model model) {
		NoticeDto dto = noticeService.getRead(notice_code);
		model.addAttribute("notice",dto);
		return "/admin/notice/notice_update";
	}
	
	@RequestMapping("/noticedelete")
	public String delete(@RequestParam("noticecode") int notice_code) {
		noticeService.setDelete(notice_code);
		return "redirect:/admin/notice/noticeadmin";
	}
	
	@PostMapping("/noticeupdate")
	public String update(NoticeDto noticeDto) {
		noticeService.setUpdate(noticeDto);
		return "redirect:/admin/notice/detail?notice_code=" + noticeDto.getNotice_code();
	}
}