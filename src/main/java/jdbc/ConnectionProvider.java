package jdbc;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;


public class ConnectionProvider extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataSource dataSource;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String driver = config.getInitParameter("driver");
		String url = config.getInitParameter("url");
		String user = config.getInitParameter("user");
		String password = config.getInitParameter("password");
		
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(driver);
		ds.setUrl(url);
		ds.setUsername(user);
		ds.setPassword(password);
		dataSource = ds;
	}
	
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
}
