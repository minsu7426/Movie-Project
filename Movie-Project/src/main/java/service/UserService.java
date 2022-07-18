package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.UserDto;

public interface UserService {

	public void setInsertUser(UserDto userDto, HttpServletRequest request);
	public List<UserDto> getSelectAll();
	public UserDto getSelectById(String user_Id);
	public UserDto setUpdateUser(UserDto userDto, HttpServletRequest request);
	public UserDto getSelectByIdPw(String user_Id, String user_Pw);
}
