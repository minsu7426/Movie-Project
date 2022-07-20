package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.AskDto;

@Repository
public class AskDaoImpl implements AskDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void setInsertAsk(AskDto askDto) {
		String sql = "insert into ask(ask_id, ask_title, ask_content, ask_hit, ask_date) value (?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql,
				askDto.getAsk_id(),
				askDto.getAsk_title(),
				askDto.getAsk_content(),
				askDto.getAsk_hit(),
				askDto.getAsk_date()
				);
		
	}

	@Override
	public List<AskDto> getAllList(String search_item, String text) {
		String sql;
		if(search_item == null && text == null) {
			sql = "select * from ask order by ask_date desc";
		} else {
			sql = "select * from ask where "+ search_item + " like '%" + text + "%' order by ask_code desc";
		}
		List<AskDto> results = jdbcTemplate.query(sql, 
				new RowMapper<AskDto>() {

					@Override
					public AskDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						AskDto ask = new AskDto();
						ask.setAsk_code(rs.getInt("ask_code"));
						ask.setAsk_title(rs.getString("ask_title"));
						ask.setAsk_content(rs.getString("ask_content"));
						ask.setAsk_date(rs.getString("ask_date").substring(0, 19));
						ask.setAsk_hit(rs.getInt("ask_hit"));
						ask.setAsk_id(rs.getString("ask_id"));
						ask.setAsk_re_content(rs.getString("ask_re_content"));
						ask.setAsk_re_date(rs.getString("ask_re_date"));
						return ask;
					}
			
		});
		return results;
	}
	
	@Override
	public List<AskDto> getListById(String id) {
		List<AskDto> results = jdbcTemplate.query("select * from ask where ask_id = ? order by ask_date desc", 
				new RowMapper<AskDto>() {

					@Override
					public AskDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						AskDto ask = new AskDto();
						ask.setAsk_code(rs.getInt("ask_code"));
						ask.setAsk_title(rs.getString("ask_title"));
						ask.setAsk_content(rs.getString("ask_content"));
						ask.setAsk_date(rs.getString("ask_date").substring(0, 19));
						ask.setAsk_hit(rs.getInt("ask_hit"));
						ask.setAsk_id(rs.getString("ask_id"));
						ask.setAsk_re_content(rs.getString("ask_re_content"));
						ask.setAsk_re_date(rs.getString("ask_re_date"));
						return ask;
					}
			
		},id);
		return results;
	}
	
	@Override
	public AskDto getAskByCode(String code) {
		List<AskDto> results = jdbcTemplate.query("select * from ask where ask_code = ?", 
				new RowMapper<AskDto>() {

					@Override
					public AskDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						AskDto ask = new AskDto();
						ask.setAsk_code(rs.getInt("ask_code"));
						ask.setAsk_title(rs.getString("ask_title"));
						ask.setAsk_content(rs.getString("ask_content"));
						ask.setAsk_date(rs.getString("ask_date").substring(0, 19));
						ask.setAsk_hit(rs.getInt("ask_hit"));
						ask.setAsk_id(rs.getString("ask_id"));
						ask.setAsk_re_content(rs.getString("ask_re_content"));
						ask.setAsk_re_date(rs.getString("ask_re_date"));
						return ask;
					}
			
		},code);
		return results.isEmpty() ? null : results.get(0);
	}
	
	@Override
	public void setUpdateHit(String code) {
		String sql = "update ask set ask_hit = ask_hit+1 where ask_code = ?";
		jdbcTemplate.update(sql, code);
	}
	
	@Override
	public void setAnswer(AskDto askDto) {
		String sql = "update ask set ask_re_content = ?, ask_re_date = ? where ask_code = ?";
		jdbcTemplate.update(sql, 
				askDto.getAsk_re_content(),
				askDto.getAsk_re_date(),
				askDto.getAsk_code()
				);
	}
	
}
