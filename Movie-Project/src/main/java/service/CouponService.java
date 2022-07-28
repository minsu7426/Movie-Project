package service;

import java.util.List;

import dto.CouponDto;
import dto.Criteria;

public interface CouponService {

	// 쿠폰생성
	public void setInsertCoupon(CouponDto couponDto);
	
	// 모든 쿠폰 가져오기
	public List<CouponDto> getAllCoupon(String search_item, String text, Criteria cri);
	
	// 쿠폰 삭제
	public void setDeleteCoupon(String code);
	
	// 해당 id 쿠폰 가져오기
	public List<CouponDto> getCouponById(String id);
	
	// 회원이 쿠폰 등록
	public void setCouponSubmit(String id, String code);
	
	// 쿠폰 개수 가져오기
	public int getAllCouponCount(String search_item, String text);
	
	// 쿠폰 사용
	public void setCouponSuccess(String code);
}
