package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println("리스트"+list.get(0).getNotice_title());
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
		return "notice/notice";
	}
	
	@RequestMapping("detail")
	public String detail(@RequestParam("notice_code") int notice_code,@ModelAttribute("cri") Criteria cri, Model model) {
		NoticeDto dto = noticeService.getRead(notice_code);
		
		model.addAttribute("dto",dto);
		return "notice/notice_detail";
	}
	
}
