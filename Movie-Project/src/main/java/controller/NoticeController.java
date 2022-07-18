package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.NoticeDaoImpl;
import dto.NoticeDto;
import service.NoticeService;

@Controller
@RequestMapping("/notice/")
public class NoticeController {

	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list")
	public String list(Model model) {
		List<NoticeDto> list = noticeService.getList();
		model.addAttribute("list", list);
		return "notice/notice";
	}
}
