package kr.co.shopping_mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shopping_mall.dao.OrderDao;
import kr.co.shopping_mall.model.Order;

@Service
public class OrderService {

	@Autowired
	private OrderDao dao;
	
	public List<Order> readAll() {
		return dao.readAll();
	}
	
	public int delete(int productNum) {
		return dao.deleteOrder(productNum);
	}
}
