package kr.co.shopping_mall.config;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.co.shopping_mall.dao.MallDao;


public class Main {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"/kr/co/shopping_mall/config/dataSource.xml");
		MallDao dao = (MallDao) context.getBean("mallDao");
		System.out.println(dao.getCount());
	}
}
