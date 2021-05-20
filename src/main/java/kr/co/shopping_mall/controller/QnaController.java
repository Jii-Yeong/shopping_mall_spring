package kr.co.shopping_mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.shopping_mall.model.Qna;
import kr.co.shopping_mall.service.QnaService;
import kr.co.shopping_mall.service.ReviewPagination;

@Controller
@RequestMapping("/qna")
public class QnaController {
	@Autowired
	private QnaService service;

	@GetMapping
	public String qna(Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			ReviewPagination pagination) {
		int total = service.qnaCount();
		System.out.println("요청페이지 : " + nowPage);
		System.out.println("토탈 : " + total);
		if (nowPage == null) {
			nowPage = "1";
		}
		pagination = new ReviewPagination(total, Integer.valueOf(nowPage));
		model.addAttribute("count", service.qnaCount());
		model.addAttribute("paging", pagination);
		model.addAttribute("read", service.qnaRead(pagination.getStartRow() - 1));
		System.out.println("시작 limit : " + pagination.getStartRow());
		System.out.println("끝 limit : " + pagination.getEndRow());
		return "/qna-board";
	}

	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", service.listAll());
		return "qna/list";
	}

	@GetMapping("/read")
	public String read(@RequestParam("bno") int bno, Model model) throws Exception {
		model.addAttribute("board", service.read(bno));
		return "qna/update";
	}

	@GetMapping("/qna-write")
	public String qnaWrite() {
		return "qna-write";
	}

	@PostMapping("qna-writeAction")
	public String qnaWriteAction() {
		return "qna-writeAction";
	}

//	@PostMapping("write")
//	public String write(@ModelAttribute("board") Qna qna) {
//		System.out.println(qna); //작업테스트
//		service.addQna(qna);
//		return "redirect:list";
//	}

	@RequestMapping("update")
	public String modify(@ModelAttribute("board") Qna qna) {
		service.update(qna);
		return "redirect:list";
	}

	@RequestMapping("delete")
	public String delete(@RequestParam("bno") int qna_num) {
		service.delete(qna_num);
		return "board/view";
	}
}
