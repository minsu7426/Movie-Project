package adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Criteria;
import dto.PageDto;
import dto.TicketDto;
import service.TicketService;

@Controller
@RequestMapping("/admin/ticket")
public class A_TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping
	public String ticket_manage(Criteria cri, Model model) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		
		List<TicketDto> list = ticketService.getTicketList(cri);
		pageDto.setTotalCount(ticketService.getTicketCount(cri));
		
		model.addAttribute("list", list);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "/admin/ticket/ticket_manage";
	}
	
	@RequestMapping(value = "/ticket_delete", method = RequestMethod.GET)
	public String ticket_delete(@RequestParam int tic_num) {
		ticketService.setTicketDelete(tic_num);
		return "redirect:/admin/ticket";
	}
}
