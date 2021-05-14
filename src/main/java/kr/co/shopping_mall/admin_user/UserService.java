package kr.co.shopping_mall.admin_user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shopping_mall.dao.UserDao;

@Service
public class UserService {
	@Autowired
	private UserDao dao;
	// 전체 회원 조회
	public List<User> getAllUser() {
		return dao.getAllUser();
	}
	// 회원 정보 업데이트
	public int update(User user) {
		return dao.update(user);
	}
	// 회원 삭제
	public int delete(User user) {
		return dao.deleteUser(user.getUser_num());
	}
}