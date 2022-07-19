package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.Criteria;
import dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<NoticeDto> getList(Criteria cri) {
		String sql = "select * from notice order by notice_code desc limit ?, ?";
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
		}, cri.getPageStart(), cri.getPerPageNum());
		return list;
	}
	
	
	@Override
	public List<NoticeDto> getSearchList(Criteria cri) {
		String title;
		String text = "%" + cri.getText() + "%";
		if(cri.getSearch_item().equals("title")) {
			title = "notice_title";
		} else {
			title = "notice_content";
		}
		String sql = "select * from notice where ? like ? order by notice_code desc limit ?, ?";
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
		}, title, text, cri.getPageStart(), cri.getPerPageNum());
		return list;
	}


	public int count() {
		int count = jdbcTemplate.queryForObject("select count(*) from coupon", Integer.class);
		return count;
	}

	@Override
	public void setHit(int notice_code) {
		String sql = "update notice set notice_hit = notice_hit+1 where notice_code = "+notice_code;
		jdbcTemplate.update(sql);
	}

	@Override
	public int getListCount() {
		String sql = "select count(*) from notice";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
	@Override
	public int getSearchListCount(Criteria cri) {
		String title;
		String text = "%" + cri.getText() + "%";
		if(cri.getSearch_item().equals("title")) {
			title = "notice_title";
		} else {
			title = "notice_content";
		}
		String sql = "select count(*) from notice where "+title+" like "+text;
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}


	@Override
	public NoticeDto getRead(int notice_code) {
		String sql = "select * from notice where notice_code = ?";
		List<NoticeDto> noticeDto = jdbcTemplate.query(sql, new RowMapper<NoticeDto>() {

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
		}, notice_code);
		return noticeDto.get(0);
	}
	
	

}
