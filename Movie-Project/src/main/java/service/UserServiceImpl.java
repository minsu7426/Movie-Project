package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
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
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String user_date = formatter.format(new Date());
		userDto.setUser_phone(phone);
		userDto.setUser_jumin(jumin);
		userDto.setUser_Date(user_date);
		userDao.setInsertUser(userDto);
	}

	@Override
	public List<UserDto> getSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDto getSelectById(String user_Id) {
		UserDto userDto = userDao.getSelectById(user_Id);
		return userDto;
	}

	@Override
	public void setUpdateUser(UserDto userDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserDto getSelectByIdPw(String user_Id, String user_Pw) {
		UserDto userDto = userDao.getSelectByIdPw(user_Id, user_Pw);
		return userDto;
	}
	


}
