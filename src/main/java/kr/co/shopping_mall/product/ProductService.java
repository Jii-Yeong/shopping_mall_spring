package kr.co.shopping_mall.product;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.shopping_mall.dao.ProductDao;

@Service
public class ProductService {
	private ProductDao dao;
	public List<Product> readAll() {
		return dao.readAllProduct();
	}
}


