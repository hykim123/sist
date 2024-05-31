package am;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Ex2Servlet
 */
public class Ex2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답시 한글처리
		response.setContentType("text/html; charset=utf-8");
		
		//응답을 위한 스트림 준비
		PrintWriter out = response.getWriter();
		
		//요청(request)한 곳으로 부터 파라미터(인자) 받기
		// msg라는 이름으로 전달되는 인자를 받는다.
		String param1 = request.getParameter("msg");
		String param2 = request.getParameter("name");
		
		//응답시작
		out.println("<h2>"+param1+"입니다.</h2>");
		out.println("<h2>"+param2+": 이름입니다.</h2>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
