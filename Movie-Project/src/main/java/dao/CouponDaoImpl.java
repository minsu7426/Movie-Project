package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.CouponDto;

@Repository
public class CouponDaoImpl implements CouponDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void setInsertCoupon(CouponDto couponDto) {
		String sql = "insert into coupon(coupon_code, coupon_form, coupon_give, coupon_end, coupon_id) value (?,?,?,?,?)";
		jdbcTemplate.update(sql, couponDto.getCoupon_code(), couponDto.getCoupon_form(), couponDto.getCoupon_give(),
				couponDto.getCoupon_end(), couponDto.getCoupon_id());
	}

	@Override
	public List<CouponDto> getAllCoupon(String search_item, String text) {
		String sql;
		if (search_item == null && text == null) {
			sql = "select * from coupon order by coupon_give desc";
		} else {
			sql = "select * from coupon where " + search_item + " like '%" + text + "%' order by coupon_give desc";
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
				return coupon;
			}
		});
		return results;
	}

	@Override
	public void setDeleteCoupon(String code) {
		String sql = "delete from coupon where coupon_code = ?";
		jdbcTemplate.update(sql, code);
	}

	@Override
	public List<CouponDto> getCouponById(String id) {
		String sql = "select * from coupon where coupon_id = ?";
		List<CouponDto> results = jdbcTemplate.query(sql, new RowMapper<CouponDto>() {

			@Override
			public CouponDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				CouponDto coupon = new CouponDto();
				coupon.setCoupon_code(rs.getString("coupon_code"));
				coupon.setCoupon_form(rs.getString("coupon_form"));
				coupon.setCoupon_give(rs.getString("coupon_give"));
				coupon.setCoupon_end(rs.getString("coupon_end"));
				coupon.setCoupon_id(rs.getString("coupon_id"));
				return coupon;
			}
		},id);
		return results;
	}
	
	@Override
	public void setDeleteEndDate(String end_date) {
		String sql = "delete from coupon where coupon_end = ?";
		jdbcTemplate.update(sql, end_date);
	}
	
@Override
	public void setCouponSubmit(String id, String code) {
		String sql = "update coupon set coupon_id = ? where coupon_code = ?";
		jdbcTemplate.update(sql, id, code);
	}
}
