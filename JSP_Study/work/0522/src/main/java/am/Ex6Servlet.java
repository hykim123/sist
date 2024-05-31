package am;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Ex6Servlet
 */
public class Ex6Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex6Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 응답시 한글처리
		response.setContentType("text/html; charset=utf-8");
		
		// 요청시 한글처리
		request.setCharacterEncoding("utf-8");
		
		//전달되는 파라미터 받기
		String u_id = request.getParameter("u_id");
		String u_pw = request.getParameter("u_id");
		String u_name = request.getParameter("u_name");
		
		//이메일은 text박스가 2개이고 이름이 같기 때문에 배열로 받는다.
		String[] u_email = request.getParameterValues("u_email");
		
		String[] u_hobby = request.getParameterValues("u_hobby");
		
		//응답을 위한 스트림 준비-개인적으로 중요하지 않다.
		PrintWriter out = response.getWriter();
		
		//응답시작
		out.println("<h2>받은 값</h2>");
		out.println("<hr/>"); //구분선
		out.println("<p>아이디:" + u_id + "</p>");
		out.println("<p>비밀번호:" + u_pw + "</p>");
		out.println("<p>이름:" + u_name + "</p>");
		out.println("<p>이메일:" + u_email[0]+"@"+u_email[1] + "</p>");
		out.println("<p>선택된 취미</p>");
		out.println("<ul>");
		for(int i=0; i<u_hobby.length; i++) {
			out.println("<li>"+u_hobby[i]+"</li>");
		}
		out.println("</ul>");
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
