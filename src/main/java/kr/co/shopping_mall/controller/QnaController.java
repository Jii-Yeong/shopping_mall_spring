package kr.co.shopping_mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.shopping_mall.dao.QnaDao;
import kr.co.shopping_mall.model.Qna;
import kr.co.shopping_mall.service.QnaService;
import kr.co.shopping_mall.service.ReviewPagination;

@Controller
@RequestMapping("/qna")
public class QnaController {
	@Autowired
	private QnaService service;
	@Autowired
	private QnaDao dao;
	
	@GetMapping
	public String qna(Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			ReviewPagination pagination) {
		int total = service.qnaCount();
		System.out.println("요청페이지 : " + nowPage);
		System.out.println("전체 글 갯수 : " + total);
		if (nowPage == null) {
			nowPage = "1";
		}
		pagination = new ReviewPagination(total, Integer.valueOf(nowPage));
		model.addAttribute("list", dao);
		model.addAttribute("count", service.qnaCount());
		model.addAttribute("paging", pagination);
		model.addAttribute("read", service.qnaRead(pagination.getStartRow() - 1));
		return "/qna-board";
	}
	
//	@RequestMapping(value="/qna-write", method = RequestMethod.GET)
	@GetMapping("/qna-write")
	public String addQnaGet(Qna qna, Model model) throws Exception {
		System.out.println("addQna, GET방식 입니다.");
		System.out.println(qna.toString());
		return "qna-write";
	}
	
//	@RequestMapping(value = "qna-writeAction", method = RequestMethod.POST)
	@PostMapping("qna-writeAction")
	public String addQnaPost(Qna qna, Model model) throws Exception {
		System.out.println("qna-writeAction, POST 방식 입니다.");
        System.out.println(qna.toString());
        service.addQna(qna);
		return "redirect:/qna";
	}

	// 게시글 보기
	@GetMapping("/view")
	public String getView(@RequestParam("qna_num") int qna_num, Model model) throws Exception {
		Qna qna = service.view(qna_num);
		System.out.println("조회하려는 글의 번호 : " + qna_num);
		model.addAttribute("view", qna);
		return "qna-view";
	}
	
	
	// 게시글 수정3
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String modify(@RequestParam("qna_num") int qna_num, Model model) throws Exception {
		System.out.println("테스트1");
		Qna qna = service.view(qna_num);
		model.addAttribute("view", qna);
		System.out.println("테스트2, " + qna_num);
		return "qna-update";
	}
	
	@PostMapping("qna-updateAction")
	public String modifyPost(Qna qna, Model model) throws Exception {
		service.update(qna);
		return "redirect:/qna";
	}

	@RequestMapping("delete")
	public String delete(@RequestParam("qna_num") int qna_num) {
		service.delete(qna_num);
		return "redirect:/qna";
	}
}
