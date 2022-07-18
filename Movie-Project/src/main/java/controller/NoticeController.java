package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.NoticeDaoImpl;
import service.NoticeService;

@Controller
@RequestMapping("/notice/")
public class NoticeController {

	@Autowired
	private NoticeDaoImpl noticeDao;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list")
	public void list(Model model) {
		System.out.println("notice > list");
		
		
		Integer count = noticeDao.count();
		model.addAttribute("count",count);
	}
}
