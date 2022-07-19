package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
	public List<AskDto> getAllList() {
		List<AskDto> results = jdbcTemplate.query("select * from ask", 
				new RowMapper<AskDto>() {

					@Override
					public AskDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						AskDto ask = new AskDto();
						ask.setAsk_code(rs.getInt("ask_code"));
						ask.setAsk_title(rs.getString("ask_title"));
						ask.setAsk_content(rs.getString("ask_content"));
						ask.setAsk_date(rs.getString("ask_date"));
						ask.setAsk_hit(rs.getInt("ask_hit"));
						ask.setAsk_id(rs.getString("ask_id"));
						ask.setAsk_re_content(rs.getString("ask_re_content"));
						ask.setAsk_re_date(rs.getString("ask_re_date"));
						return null;
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
}
