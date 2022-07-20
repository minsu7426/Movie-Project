package adminController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.CouponDto;
import service.CouponService;

@Controller
@RequestMapping("/admin/coupon")
public class A_CouponController {
	
	@Autowired
	private CouponService couponService;
	
	@RequestMapping("/couponadmin")
	public String couponAdmin(Model model, HttpServletRequest request) {
		List<CouponDto> couponList = couponService.getAllCoupon(request.getParameter("search_item"), request.getParameter("text"));
		model.addAttribute("couponList", couponList);
		return "/admin/coupon/coupon_admin";
	}
	
	@PostMapping("/couponpostadd")
	public String couponPostAdd(CouponDto couponDto) {
		couponService.setInsertCoupon(couponDto);
		return "/admin/coupon/coupon_add";
	}
	
	@RequestMapping("/couponadd")
	public String couponAdd() {
		return "/admin/coupon/coupon_add";
	}
	
	@RequestMapping("/coupondelete")
	public String couponDelete(@RequestParam("couponcode")String code) {
		couponService.setDeleteCoupon(code);
		return "redirect:/admin/coupon/couponadmin";
	}
}
