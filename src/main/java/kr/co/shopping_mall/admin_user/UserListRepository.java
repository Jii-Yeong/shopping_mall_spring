package kr.co.shopping_mall.admin_user;

import java.util.ArrayList;
import java.util.List;

public class UserListRepository {
	private static List<User> list = new ArrayList<>();
	public static void addUser(User user) {
		list.add(user);
	}
	public static List<User> getList() {
		return list;
	}
	public static void deleteUser(User user) {
		list.remove(user);
	}
	public static void updateUser(User from, User to) {
		if (list.contains(from)) {
			deleteUser(from);
			addUser(to);
		}
	}
}