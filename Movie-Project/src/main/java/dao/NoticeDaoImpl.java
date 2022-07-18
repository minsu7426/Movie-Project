package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<NoticeDto> getList() {
		String sql = "select * from notice";
		List<NoticeDto> list = jdbcTemplate.query(sql, new RowMapper<NoticeDto>() {

			@Override
			public NoticeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
				NoticeDto noticeDto = new NoticeDto();
				noticeDto.setNotice_code(rs.getInt("notice_code"));
				noticeDto.setNotice_title(rs.getString("notice_title"));
				noticeDto.setNotice_content(rs.getString("notice_content"));
				noticeDto.setNotice_date(rs.getString("notice_date"));
				noticeDto.setNotice_hit(rs.getInt("notice_hit"));
				return noticeDto;
			}
		});
		return list;
	}
	
	public int count() {
		int count = jdbcTemplate.queryForObject("select count(*) from coupon", Integer.class);
		return count;
	}

	@Override
	public void setHit() {
		// TODO Auto-generated method stub
		
	}

}
