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
		String code = sb.toString();
		
		couponDto.setCoupon_code(code);
		couponDao.setInsertCoupon(couponDto);
	}
	
	@Override
	public List<CouponDto> getAllCoupon(String search_item, String text) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String end_date = formatter.format(new Date());
		
		List<CouponDto> list = couponDao.getAllCoupon(search_item, text);
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getCoupon_end().equals(end_date)) {
				couponDao.setDeleteEndDate(end_date);
				list = couponDao.getAllCoupon(search_item, text);
			}
		}
		return list;
	}
	
	@Override
	public void setDeleteCoupon(String code) {
		couponDao.setDeleteCoupon(code);
	}
	
	@Override
	public List<CouponDto> getCouponById(String id) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String end_date = formatter.format(new Date());
		
		if(id == null) {
			id = "";
		}
		List<CouponDto> list = couponDao.getCouponById(id);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getCoupon_end().equals(end_date)) {
				couponDao.setDeleteEndDate(end_date);
				list = couponDao.getCouponById(id);
			}
		}
		return list;
	}
	
	@Override
	public void setCouponSubmit(String id, String code) {
		couponDao.setCouponSubmit(id, code);
	}
}
