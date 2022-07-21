package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.CouponDto;
import service.CouponService;

@Controller
@RequestMapping("/coupon")
public class CouponController {
	
	@Autowired
	private CouponService couponService;
	
	@RequestMapping("/couponlist")
	public String couponList(HttpSession session, Model model) {
		String[] id = (String[])session.getAttribute("user");
		if(id == null) {
			return "/login/login";
		}
		List<CouponDto> couponList = couponService.getCouponById(id[0]);
		model.addAttribute("couponList", couponList);
		return "/coupon/coupon_manage";
	}
	
	@RequestMapping("/couponsubmit")
	public String couponSubmit(){
		return "/coupon/couponSubmit";
	}
	
	@PostMapping("/couponpostsub")
	public String couponPostSub(CouponDto couponDto) {
		couponService.setCouponSubmit(couponDto.getCoupon_id(), couponDto.getCoupon_code());
		return "redirect:/coupon/couponlist";
	}
}
