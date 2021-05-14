package kr.co.shopping_mall.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;

import kr.co.shopping_mall.dao.ProductDao;
import kr.co.shopping_mall.dao.ReviewDAO;

@Configuration
//패키지 스캔
@ComponentScan("kr.co.shopping_mall")
//프로퍼티 파일 경로
@PropertySource("classpath:/kr/co/shopping_mall/config/mysql.properties")
public class DBConfig {
	@Value("${mysql.driverClassName}")
	private String driverClassName;
	@Value("${mysql.url}")
	private String url;
	@Value("${mysql.username}")
	private String username;
	@Value("${mysql.password}")
	private String password;

	@Bean
	public DataSource dataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(driverClassName);
		ds.setUrl(url);
		ds.setUsername(username);
		ds.setPassword(password);
		return ds;
	}

	@Bean
	@Autowired
	public JdbcTemplate jdbcTemplate(DataSource dataSource) {
		return new JdbcTemplate(dataSource);
	}
	
	@Bean
	@Autowired
	public ProductDao productDao(JdbcTemplate jdbcTemplate) {
		return new ProductDao(jdbcTemplate);
	}
	
	@Bean
	@Autowired
	public ReviewDAO reviewDAO(JdbcTemplate jdbcTemplate) {
		return new ReviewDAO(jdbcTemplate);
	}
}

	
