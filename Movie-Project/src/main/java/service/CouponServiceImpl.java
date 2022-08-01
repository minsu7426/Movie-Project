package service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CouponDao;
import dto.CouponDto;
import dto.Criteria;

@Service
public class CouponServiceImpl implements CouponService {
	
	@Autowired
	private CouponDao couponDao;
	
	@Override
	public void setInsertCoupon(CouponDto couponDto) {

		Random rnd = new Random();
		List<String> list = new ArrayList<>();		
		list.add(String.valueOf(rnd.nextInt(10)));
		list.add(String.valueOf(rnd.nextInt(10)));
		list.add(String.valueOf(rnd.nextInt(10)));
		list.add(String.valueOf(rnd.nextInt(10)));
		char c='a';
		c=((char)((int)(Math.random()*26)+97));
		list.add(String.valueOf(c));
		c=((char)((int)(Math.random()*26)+97));
		list.add(String.valueOf(c));
		c=((char)((int)(Math.random()*26)+97));
		list.add(String.valueOf(c));
		c=((char)((int)(Math.random()*26)+97));
		list.add(String.valueOf(c));
		
		Collections.shuffle(list);
		StringBuffer sb = new StringBuffer();
		for(String s : list) {
			sb.append(s);
		}
		String code = sb.toString().toUpperCase();
		
		couponDto.setCoupon_code(code);
		couponDao.setInsertCoupon(couponDto);
	}
	
	@Override
	public List<CouponDto> getAllCoupon(String search_item, String text, Criteria cri) {
		List<CouponDto> list = couponDao.getAllCoupon(search_item, text, cri);
		couponDao.setCouponComplete();
		
		return list;
	}
	
	@Override
	public void setDeleteCoupon(String code) {
		couponDao.setDeleteCoupon(code);
	}
	
	@Override
	public List<CouponDto> getCouponById(String id) {
		if(id == null) {
			id = "";
		}
		List<CouponDto> list = couponDao.getCouponById(id);
		couponDao.setCouponComplete();
		
		return list;
	}
	
	@Override
	public void setCouponSubmit(String id, String code) {
		couponDao.setCouponSubmit(id, code.toUpperCase());
	}
	
	@Override
	public int getAllCouponCount(String search_item, String text) {
		return couponDao.getAllCouponCount(search_item, text);
	}
	
	@Override
	public void setCouponSuccess(String code) {
		couponDao.setCouponSuccess(code);
	}
}