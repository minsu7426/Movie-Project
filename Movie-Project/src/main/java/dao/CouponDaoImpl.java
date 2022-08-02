package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.CouponDto;
import dto.Criteria;

@Repository
public class CouponDaoImpl implements CouponDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void setInsertCoupon(CouponDto couponDto) {
		String sql;
		if (couponDto.getCoupon_id() == null || couponDto.getCoupon_id().equals("")) {
			sql = "insert into coupon(coupon_code, coupon_form, coupon_give, coupon_end, coupon_price) value (?,?,?,?,?)";
			jdbcTemplate.update(sql, couponDto.getCoupon_code(), couponDto.getCoupon_form(), couponDto.getCoupon_give(),
					couponDto.getCoupon_end(), couponDto.getCoupon_price());
		} else {
			sql = "insert into coupon(coupon_code, coupon_form, coupon_give, coupon_end, coupon_id, coupon_price) value (?,?,?,?,?,?)";
			jdbcTemplate.update(sql, couponDto.getCoupon_code(), couponDto.getCoupon_form(), couponDto.getCoupon_give(),
					couponDto.getCoupon_end(), couponDto.getCoupon_id(), couponDto.getCoupon_price());
		}
	}

	@Override
	public List<CouponDto> getAllCoupon(String search_item, String text, Criteria cri) {
		String sql;
		if (search_item == null && text == null) {
			sql = "select * from coupon order by coupon_flag = true desc, coupon_end desc limit ?, ?";
		} else if (search_item.equals("") && text.equals("")) {
			sql = "select * from coupon order by coupon_flag = true desc, coupon_end desc limit ?, ?";
		} else {
			sql = "select * from coupon where " + search_item + " like '%" + text
					+ "%' order by coupon_flag = true desc, coupon_end desc limit ?, ?";
		}
		List<CouponDto> results = jdbcTemplate.query(sql, new RowMapper<CouponDto>() {

			@Override
			public CouponDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				CouponDto coupon = new CouponDto();
				coupon.setCoupon_code(rs.getString("coupon_code"));
				coupon.setCoupon_form(rs.getString("coupon_form"));
				coupon.setCoupon_give(rs.getString("coupon_give"));
				coupon.setCoupon_end(rs.getString("coupon_end"));
				coupon.setCoupon_id(rs.getString("coupon_id"));
				coupon.setCoupon_flag(rs.getBoolean("coupon_flag"));
				coupon.setCoupon_price(rs.getInt("coupon_price"));
				return coupon;
			}
		}, cri.getPageStart(), cri.getPerPageNum());
		return results;
	}

	@Override
	public void setDeleteCoupon(String code) {
		String sql = "delete from coupon where coupon_code = ?";
		jdbcTemplate.update(sql, code);
	}

	@Override
	public List<CouponDto> getCouponById(String id) {
		String sql = "select * from coupon where coupon_id = ? and coupon_flag = true";
		List<CouponDto> results = jdbcTemplate.query(sql, new RowMapper<CouponDto>() {

			@Override
			public CouponDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				CouponDto coupon = new CouponDto();
				coupon.setCoupon_code(rs.getString("coupon_code"));
				coupon.setCoupon_form(rs.getString("coupon_form"));
				coupon.setCoupon_give(rs.getString("coupon_give"));
				coupon.setCoupon_end(rs.getString("coupon_end"));
				coupon.setCoupon_id(rs.getString("coupon_id"));
				coupon.setCoupon_flag(rs.getBoolean("coupon_flag"));
				coupon.setCoupon_price(rs.getInt("coupon_price"));
				return coupon;
			}
		}, id);
		return results;
	}

	@Override
	public void setCouponSubmit(String id, String code) {
		String sql = "update coupon set coupon_id = ? where coupon_code = ?";
		jdbcTemplate.update(sql, id, code);
	}

	@Override
	public void setCouponComplete() {
		String sql = "update coupon set coupon_flag = false where coupon_end < (now() -interval 1 day)";
		jdbcTemplate.update(sql);
	}

	@Override
	public int getAllCouponCount(String search_item, String text) {
		String sql = "select count(*) from coupon";
		if (search_item == null && text == null) {
			sql = "select count(*) from coupon";
		} else if (search_item.equals("") && text.equals("")) {
			sql = "select count(*) from coupon";
		} else {
			sql = "select count(*) from coupon where " + search_item + " like '%" + text + "%'";
		}

		Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}

	@Override
	public void setCouponSuccess(String code) {
		String sql = "update coupon set coupon_flag = false where coupon_code = ?";
		jdbcTemplate.update(sql, code);
	}
}
