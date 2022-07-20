package adminController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ScreenService;

@Controller
@RequestMapping("/admin/screen/")
public class A_ScreenController {

	@Autowired
	private ScreenService screenService;

	@RequestMapping("screen_manage")
	public void screen_manage() {

	}

	@RequestMapping("screen_add")
	public void screen_add() {
		
	}
}
