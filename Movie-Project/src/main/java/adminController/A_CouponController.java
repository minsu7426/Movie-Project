package adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.CouponDto;
import dto.Criteria;
import dto.PageDto;
import service.CouponService;
import service.UserService;

@Controller
@RequestMapping("/admin/coupon")
public class A_CouponController {
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/couponadmin")
	public String couponAdmin(Model model, Criteria cri) {
		PageDto pageDto = new PageDto();
		pageDto.setCri(cri);
		pageDto.setTotalCount(couponService.getAllCouponCount(cri.getSearch_item(), cri.getText()));
		System.out.println(cri.getSearch_item());
		System.out.println(cri.getText());
		List<CouponDto> couponList = couponService.getAllCoupon(cri.getSearch_item(), cri.getText(), cri);
		model.addAttribute("couponList", couponList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("search_item", cri.getSearch_item());
		model.addAttribute("text", cri.getText());
		return "/admin/coupon/coupon_admin";
	}
	
	@PostMapping("/couponpostadd")
	public String couponPostAdd(CouponDto couponDto) {
		couponService.setInsertCoupon(couponDto);
		return "/admin/coupon/coupon_add";
	}
	
	@RequestMapping("/couponadd")
	public String couponAdd(Model model) {
		List<String> idList = userService.getSelectId();
		model.addAttribute("idList", idList);
		return "/admin/coupon/coupon_add";
	}
	
	@RequestMapping("/coupondelete")
	public String couponDelete(@RequestParam("couponcode")String code) {
		couponService.setDeleteCoupon(code);
		return "redirect:/admin/coupon/couponadmin";
	}
}
