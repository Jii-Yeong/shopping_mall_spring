package review;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/reviewUpload")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/shopping_mall/bullentin-board.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadDir = this.getClass().getResource("").getPath();
		uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "shopping_mall/WebContent/imageUpload";
		
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String id = multipartRequest.getParameter("id");
		String text = multipartRequest.getParameter("text");
		String fileName = multipartRequest.getOriginalFileName("file");
		String now = new SimpleDateFormat("yyyy-MM-dd-HH_mm_ss_").format(new Date());
		
		File file = new File(uploadDir + "/" + fileName);
		file.renameTo(new File(uploadDir + "/" + now + fileName));
		
		ReviewDAO dao = new ReviewDAO();
		ReviewRepository rr = new ReviewRepository(dao);
		rr.reviewAdd(new Review(id, now + fileName, text));
		
		try {
			Thread.sleep(5000);
			doGet(request, response);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
