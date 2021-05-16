package kr.co.shopping_mall.admin_user;

import java.sql.Date;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage-page1")
public class UserController {
	@Autowired
	private UserService service;
	
	// 모든 회원 정보 불러오기
	@RequestMapping("list.do")
	public String getAllUser(Model model) {
		model.addAttribute("user_list", service.getAllUser());
		return "manage-page";
	}
	
	// 회원 1명 정보 불러오기
	@GetMapping(value="userInfo.do")
	public String getByUserNum(User user, Model model) throws Exception {
		 model.addAttribute("user_info", service.getByUserNum(user.getUser_num()));
		 return "manage-user-update";
	}
	
	// 회원 정보 수정
	@PostMapping(value="update.do")
	public String updateUser(User user) {
		service.update(user);
		return "redirect://manage-page1/list.do";
	}

	// 회원 계정 삭제
	@GetMapping(value="delete.do")
	public String deleteUser(User user) {
		service.delete(user.getUser_num());
		return "redirect://manage-page1/list.do";
	}
}