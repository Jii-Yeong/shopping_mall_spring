package kr.co.shopping_mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shopping_mall.dao.QnaDao;
import kr.co.shopping_mall.model.Qna;

@Service
public class QnaService {
	@Autowired
	public QnaDao dao;

	public int addQna(Qna qna) {
		return dao.addQna(qna);
	}

	public List<Qna> qnaRead(int startRow) {
		return dao.qnaRead(startRow);
	}

	public List<Qna> listAll() {
		return dao.selectAll();
	}

	public Qna view(int qna_num) {
		dao.updateViewCnt(qna_num);
		return dao.selectOne(qna_num);
	}

	public int qnaCount() {
		return dao.qnaCount();
	}

	public int update(Qna qna) {
		return dao.update(qna);
	}

	public int delete(int qna_num) {
		return dao.delete(qna_num);
	}
}
