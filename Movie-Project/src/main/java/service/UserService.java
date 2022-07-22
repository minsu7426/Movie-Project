package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Criteria;
import dto.UserDto;

public interface UserService {

	// 회원가입(회원정보 입력)
	public void setInsertUser(UserDto userDto, HttpServletRequest request);
	
	// 모든회원정보 가져오기
	public List<UserDto> getSelectAll(String search_item, String text, Criteria cri);
	
	// 아이디로 검색해서 회원정보 가져오기
	public UserDto getSelectById(String user_Id);

	// 회원정보 수정
	public UserDto setUpdateUser(UserDto userDto, HttpServletRequest request);

	// 아이디, 패스워드 검색해서 회원정보 가져오기(로그인)
	public UserDto getSelectByIdPw(String user_Id, String user_Pw);
	
	// 아이디 중복확인
	public Integer getIdCount(String user_id);
	
	// 아이디 삭제
	public void setDeleteUser(String user_id);
	
	// 회원 등급 업데이트
	public void setClassUpdate(UserDto userdto);
	
	// 아이디만 가져오기
	public List<String> getSelectId();
	
	// 모든회원 개수
	public int getAllCount(String search_item, String text);
	
	// 회원 아이디 찾기
	public List<String> getSearchId(String userName, String userJumin);
	
	// 회원 비밀번호 찾기
	public List<String> getSearchPw(String userId, String userName);

}
