package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import dto.UserDto;


@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void setInsertUser(UserDto userDto) {
		String sql = "insert into user(user_id, user_pw, user_name, user_jumin, user_phone, user_email, user_date) value (?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, 
				userDto.getUser_Id(), 
				userDto.getUser_Pw(), 
				userDto.getUser_Name(), 
				userDto.getUser_jumin(), 
				userDto.getUser_phone(), 
				userDto.getUser_Email(), 
				userDto.getUser_Date()
				);
	}

	@Override
	public List<UserDto> getSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDto getSelectById(String user_Id) {
		List<UserDto> results = jdbcTemplate.query(
				"select * from user where user_id = ?",
				new RowMapper<UserDto>() {
					@Override
					public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						UserDto user = new UserDto();
						user.setUser_Id(rs.getString("user_id"));
						user.setUser_Pw(rs.getString("user_pw"));
						user.setUser_Name(rs.getString("user_name"));
						user.setUser_phone(rs.getString("user_phone"));
						user.setUser_jumin(rs.getString("user_jumin"));
						user.setUser_Email(rs.getString("user_email"));
						return user;
					}
				}, user_Id);

		return results.isEmpty() ? null : results.get(0);
	}

	@Override
	public void setUpdateUser(UserDto userDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserDto getSelectByIdPw(String user_Id, String user_Pw) {
		List<UserDto> results = jdbcTemplate.query(
				"select * from user where user_id = ? and user_pw = ?",
				new RowMapper<UserDto>() {
					@Override
					public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						UserDto user = new UserDto();
						user.setUser_Id(rs.getString("user_id"));
						user.setUser_Pw(rs.getString("user_pw"));
						user.setUser_Name(rs.getString("user_name"));
						user.setUser_phone(rs.getString("user_phone"));
						user.setUser_jumin(rs.getString("user_jumin"));
						user.setUser_Email(rs.getString("user_email"));
						return user;
					}
				}, user_Id, user_Pw);

		return results.isEmpty() ? null : results.get(0);
	}
	

}
