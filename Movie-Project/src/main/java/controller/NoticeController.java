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
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);

		List<NoticeDto> list = noticeService.getList(cri);
		pageDto.setTotalCount(noticeService.getListCount(cri));
		
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
		return "notice/notice";
	}
	
	@RequestMapping("detail")
	public String detail(@RequestParam("notice_code") int notice_code, @ModelAttribute("cri") Criteria cri, Model model) {
		System.out.println("검색:"+cri.getSearch_item());
		System.out.println("텍스트:"+cri.getText());
		NoticeDto dto = noticeService.getRead(notice_code);
		
		model.addAttribute("dto",dto);
		return "notice/notice_detail";
	}
	
}
