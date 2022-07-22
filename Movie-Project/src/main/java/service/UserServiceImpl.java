package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import dto.Criteria;
import dto.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public void setInsertUser(UserDto userDto, HttpServletRequest request) {
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
				+ request.getParameter("phone3");
		String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String user_date = formatter.format(new Date());
		userDto.setUser_phone(phone);
		userDto.setUser_jumin(jumin);
		userDto.setUser_date(user_date);
		userDao.setInsertUser(userDto);
	}

	@Override
	public List<UserDto> getSelectAll(String search_item, String text, Criteria cri) {
		List<UserDto> userList = userDao.getSelectAll(search_item, text, cri);
		return userList;
	}

	@Override
	public UserDto getSelectById(String user_Id) {
		UserDto userDto = userDao.getSelectById(user_Id);
		return userDto;
	}

	@Override
	public UserDto setUpdateUser(UserDto userDto, HttpServletRequest request) {
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
				+ request.getParameter("phone3");
		userDto.setUser_phone(phone);
		userDao.setUpdateUser(userDto);
		return userDto;
	}

	@Override
	public UserDto getSelectByIdPw(String user_Id, String user_Pw) {
		UserDto userDto = userDao.getSelectByIdPw(user_Id, user_Pw);
		return userDto;
	}
	
	@Override
	public Integer getIdCount(String user_id) {
		return userDao.getIdCount(user_id);
	}
	
	@Override
	public void setDeleteUser(String user_id) {
		userDao.setDeleteUser(user_id);
	}
	
	@Override
	public void setClassUpdate(UserDto userdto) {
		userDao.setClassUpdate(userdto);
	}
	
	@Override
	public List<String> getSelectId() {
		return userDao.getSelectId();
	}
	
	@Override
	public int getAllCount(String search_item, String text) {
		return userDao.getAllCount(search_item, text);
	}
	
	@Override
	public List<String> getSearchId(String userName, String userJumin) {
		return userDao.getSearchId(userName, userJumin);
	}
	
	@Override
	public List<String> getSearchPw(String userId, String userName) {
		return userDao.getSearchPw(userId, userName);
	}
	
}
