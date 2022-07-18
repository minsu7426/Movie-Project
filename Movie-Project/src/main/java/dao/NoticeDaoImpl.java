package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<NoticeDto> list() {
		
		return null;
	}
	
	public int count() {
		int count = jdbcTemplate.queryForObject("select count(*) from coupon", Integer.class);
		return count;
	}

}