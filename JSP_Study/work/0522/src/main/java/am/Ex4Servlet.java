package am;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Ex4Servlet
 */
public class Ex4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Ex4Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 응답시 한글처리
		response.setContentType("text/html; charset=utf-8");

		// 요청지로부터 전달되어 오는 파라미터들 받기 전에
		// 요청시 한글처리를 해야 한다.
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("m_name");
		String[] hobby = request.getParameterValues("m_hobby");

		// 응답을 위한 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<h2>받은 name:" + name + "</h2><br/>");
		out.print("<h2>받은 hobby: </h2>");
		if (hobby != null) {
			for (int i = 0; i < hobby.length; i++) {
				out.println(hobby[i]);
				if (i < hobby.length - 1)
					out.print(",");
			}
		}
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
