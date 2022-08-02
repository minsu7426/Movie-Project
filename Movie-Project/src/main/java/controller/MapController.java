package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.Map;

@Controller
@RequestMapping("/map")
public class MapController {

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void map(Model model, Map map) {
		String juso = "경상남도 창원시 마산회원구 양덕북12길 113 경민인터빌 407호";
		double[] point = map.submit(juso);
		
		model.addAttribute("juso", juso);
		model.addAttribute("x", point[0]);
		model.addAttribute("y", point[1]);
	}
}
