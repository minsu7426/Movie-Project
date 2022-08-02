package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Criteria;
import dto.NoticeDto;
import dto.PageDto;
import service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Criteria cri, Model model) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(noticeService.getListCount(cri));

		List<NoticeDto> list = noticeService.getList(cri);		
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "notice/notice";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("notice_code") int notice_code, @ModelAttribute("cri") Criteria cri, Model model) {
		NoticeDto dto = noticeService.getRead(notice_code);
		
		model.addAttribute("dto",dto);
		return "notice/notice_detail";
	}
	
}
