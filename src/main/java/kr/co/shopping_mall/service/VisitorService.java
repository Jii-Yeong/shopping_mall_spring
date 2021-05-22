package kr.co.shopping_mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shopping_mall.dao.VisitorDao;
import kr.co.shopping_mall.model.Visitor;

@Service
public class VisitorService {
	@Autowired
	private VisitorDao dao;
	
	public List<Visitor> VisitorRead() {
		return dao.VisitorRead();
	}
	
	public void ExistToday(String today) {
		dao.ExistToday(today);
	}
}
