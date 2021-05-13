//package product.view;
//
//import java.io.IOException;
//import java.net.URL;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import product.Product;
//import product.ProductDao;
//
//@WebServlet("")
//public class ProductServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ProductDao dao = new ProductDao();
//		List<Product> product_list = dao.readProduct();
//		URL uploadDir = getServletContext().getResource("imageUpload");
//        String uploadPath = uploadDir.toString().substring(6);
//        request.setAttribute("upload_path", uploadPath);
//		request.setAttribute("product_list", product_list);
//		request.getRequestDispatcher("index.jsp").forward(request, response);
//	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
//}
