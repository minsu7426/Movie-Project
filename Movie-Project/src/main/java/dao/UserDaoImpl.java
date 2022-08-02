package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import dto.Criteria;
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
	public List<UserDto> getSelectAll(String search_item, String text, Criteria cri) {
		String sql;
		if(search_item == null && text == null) {
			sql = "select * from user order by user_date desc limit ?, ?";
		} else if(search_item.equals("") && text.equals("")) {
			sql = "select * from user order by user_date desc limit ?, ?";
		} else {
			sql = "select * from user where "+ search_item + " like '%" + text + "%' order by user_date desc limit ?, ?";
		}
		
		List<UserDto> results = jdbcTemplate.query(sql,
				new RowMapper<UserDto>() {

					@Override
					public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
						UserDto user = new UserDto();
						user.setUser_id(rs.getString("user_id"));
						user.setUser_pw(rs.getString("user_pw"));
						user.setUser_name(rs.getString("user_name"));
						user.setUser_email(rs.getString("user_email"));
						user.setUser_jumin(rs.getString("user_jumin"));
						user.setUser_phone(rs.getString("user_phone"));
						user.setUser_date(rs.getString("user_date"));
						user.setUser_class(rs.getString("user_class"));
						return user;
					}
			
		}, cri.getPageStart(), cri.getPerPageNum());
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
		String sql = "update user set user_pw = ?, user_phone = ?, user_email = ? where user_id = ?";
		jdbcTemplate.update(sql,
				userDto.getUser_pw(),
				userDto.getUser_phone(),
				userDto.getUser_email(),
				userDto.getUser_id()
				);
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
						user.setUser_class(rs.getString("user_class"));
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
	
	@Override
	public List<String> getSelectId() {
		String sql = "select user_id from user";
		List<String> idList = jdbcTemplate.queryForList(sql, String.class);
		return idList;
	}
	
	@Override
	public int getAllCount(String search_item, String text) {
		String sql = "select count(*) from user";
		if(search_item == null && text == null) {
			sql = "select count(*) from user";
		} else if(search_item.equals("") && text.equals("")) {
			sql = "select count(*) from user";
		} else {
			sql = "select count(*) from user where "+ search_item + " like '%" + text + "%'";
		}
		
		Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
	@Override
	public List<String> getSearchId(String userName, String userJumin) {
		String sql = "select user_id from user where user_name = ? and user_jumin = ?";
		List<String> id = jdbcTemplate.queryForList(sql, String.class, userName, userJumin);
		return id;
	}
	
	@Override
	public List<String> getSearchPw(String userId, String userName) {
		String sql = "select user_pw from user where user_id = ? and user_name = ?";
		List<String> pw = jdbcTemplate.queryForList(sql, String.class, userId, userName);
		return pw;
	}

}
