package adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class A_HomeController {
	
	@RequestMapping("/home")
	public String home() {
		return "/admin/admin_main";
	}
}
