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
				userDto.getUser_id(), 
				userDto.getUser_pw(), 
				userDto.getUser_name(), 
				userDto.getUser_jumin(), 
				userDto.getUser_phone(), 
				userDto.getUser_email(), 
				userDto.getUser_date()
				);
	}

	@Override
	public List<UserDto> getSelectAll() {
		List<UserDto> results = jdbcTemplate.query("select * from user order by user_date desc",
				new RowMapper<UserDto>() {

					@Override
					public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						UserDto user = new UserDto();
						user.setUser_id(rs.getString("user_id"));
						user.setUser_pw(rs.getString("user_pw"));
						user.setUser_name(rs.getString("user_name"));
						user.setUser_email(rs.getString("user_email"));
						user.setUser_jumin(rs.getString("user_jumin").substring(0, 6));
						user.setUser_phone(rs.getString("user_phone"));
						user.setUser_date(rs.getString("user_date"));
						user.setUser_class(rs.getString("user_class"));
						return user;
					}
			
		});
		return results;
	}

	@Override
	public UserDto getSelectById(String user_Id) {
		List<UserDto> results = jdbcTemplate.query(
				"select * from user where user_id = ?",
				new RowMapper<UserDto>() {
					@Override
					public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						UserDto user = new UserDto();
						user.setUser_id(rs.getString("user_id"));
						user.setUser_pw(rs.getString("user_pw"));
						user.setUser_name(rs.getString("user_name"));
						user.setUser_phone(rs.getString("user_phone"));
						user.setUser_jumin(rs.getString("user_jumin").substring(0, 6));
						user.setUser_email(rs.getString("user_email"));
						user.setUser_class(rs.getString("user_class"));
						user.setUser_date(rs.getString("user_date"));
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
						user.setUser_id(rs.getString("user_id"));
						user.setUser_pw(rs.getString("user_pw"));
						user.setUser_name(rs.getString("user_name"));
						user.setUser_phone(rs.getString("user_phone"));
						user.setUser_jumin(rs.getString("user_jumin"));
						user.setUser_email(rs.getString("user_email"));
						return user;
					}
				}, user_Id, user_Pw);

		return results.isEmpty() ? null : results.get(0);
	}

	@Override
	public Integer getIdCount(String user_id) {
		Integer count = jdbcTemplate.queryForObject("select count(*) from user where user_id = ?", Integer.class, user_id);
		return count;
	}
	
	@Override
	public void setDeleteUser(String user_id) {
		String sql="delete from user where user_id = ?";
		jdbcTemplate.update(sql, user_id);
	}
	
	@Override
	public void setClassUpdate(UserDto userdto) {
		String sql="update user set user_class = ? where user_id = ?";
		jdbcTemplate.update(sql, userdto.getUser_class(), userdto.getUser_id());
	}

}
