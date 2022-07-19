package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.NoticeDaoImpl;
import dto.Criteria;
import dto.NoticeDto;
import dto.PageDto;
import service.NoticeService;

@Controller
@RequestMapping("/notice/")
public class NoticeController {

	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list")
	public String list(Criteria cri, Model model) {
		List<NoticeDto> list = noticeService.getList(cri);
		
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(noticeService.getListCount());
		
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
		return "notice/notice";
	}
	
	@RequestMapping("detail")
	public void detail(@RequestParam("notice_code") int notice_code, Model model) {
		
		NoticeDto dto = noticeService.getRead(notice_code);
		model.addAttribute("dto",dto);
	}
}
