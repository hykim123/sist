package am;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Ex3Servlet
 */
public class Ex3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답시 한글처리
		response.setContentType("text/html; charset=utf-8");
		
		//요청지로부터 전달되어 오는 파라미터들 받기 전에
		// 요청시 한글처리를 해야 한다.
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("m_id");
		String name = request.getParameter("m_name");
		String addr = request.getParameter("m_addr");
		
		//응답을 위한 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<h2>받은 id: " + id + "</h2><br/>");
		out.println("<h2>받은 name: " + name + "</h2><br/>");
		out.println("<h2>받은 addr: " + addr + "</h2><br/>");
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
