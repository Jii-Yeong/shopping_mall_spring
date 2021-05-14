package kr.co.shopping_mall.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.shopping_mall.dao.ProductDao;

@Service
public class ProductService {
	@Autowired
	private ProductDao dao;
	public List<Product> readAll() {
		return dao.readAllProduct();
	}
	public int add(Product product) {
		return dao.addProduct(product);
	}
}
