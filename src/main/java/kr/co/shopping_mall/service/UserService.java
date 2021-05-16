package kr.co.shopping_mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shopping_mall.dao.UserDao;
import kr.co.shopping_mall.model.User;

@Service
public class UserService {
	@Autowired
	private UserDao dao;
	// 전체 회원 조회
	public List<User> getAllUser() {
		return dao.getAllUser();
	}
	// 아이디로 회원 조회
	public User getByUserNum(int user_num) {
		return dao.getByUserNum(user_num);
	}
	// 회원 정보 업데이트
	public int update(User user) {
		return dao.update(user);
	}
	// 회원 삭제
	public int delete(int user_num) {
		return dao.deleteUser(user_num);
	}
}