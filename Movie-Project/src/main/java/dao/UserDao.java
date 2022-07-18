package dao;

import java.util.List;

import dto.UserDto;

public interface UserDao {
	
	// 회원가입(회원정보 입력)
	public void setInsertUser(UserDto userDto);
	
	// 모든회원정보 가져오기
	public List<UserDto> getSelectAll();
	
	// 아이디로 검색해서 회원정보 가져오기
	public UserDto getSelectById(String user_Id);
	
	// 회원정보 수정
	public void setUpdateUser(UserDto userDto);
	
	// 아이디, 패스워드 검색해서 회원정보 가져오기(로그인)
	public UserDto getSelectByIdPw(String user_Id, String user_Pw);
	
}