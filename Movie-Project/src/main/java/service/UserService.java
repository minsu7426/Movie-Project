package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.UserDto;

public interface UserService {

	// 회원가입(회원정보 입력)
	public void setInsertUser(UserDto userDto, HttpServletRequest request);
	
	// 모든회원정보 가져오기
	public List<UserDto> getSelectAll();
	
	// 아이디로 검색해서 회원정보 가져오기
	public UserDto getSelectById(String user_Id);
	
	// 회원정보 수정
	public void setUpdateUser(UserDto userDto);
	
	// 아이디, 패스워드 검색해서 회원정보 가져오기(로그인)
	public UserDto getSelectByIdPw(String user_Id, String user_Pw);
	
	// 아이디 중복확인
	public Integer getIdCount(String user_id);
	
	// 아이디 삭제
	public void setDeleteUser(String user_id);
	
	// 회원 등급 업데이트
	public void setClassUpdate(UserDto userdto);

}
