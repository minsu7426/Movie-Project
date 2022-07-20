package dao;

import java.util.List;

import dto.CouponDto;

public interface CouponDao {
	
	// 쿠폰생성
	public void setInsertCoupon(CouponDto couponDto);
	
	// 모든 쿠폰 가져오기
	public List<CouponDto> getAllCoupon(String search_item, String text);
	
	// 쿠폰 삭제
	public void setDeleteCoupon(String code);
	
	// 해당 id 쿠폰 가져오기
	public List<CouponDto> getCouponById(String id);
	
	// 기한 만료된 쿠폰 삭제
	public void setDeleteEndDate(String end_date);
	
	// 회원이 쿠폰 등록
	public void setCouponSubmit(String id, String code);
}
