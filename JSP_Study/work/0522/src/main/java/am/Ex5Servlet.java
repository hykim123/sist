package am;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Ex5Servlet
 */
public class Ex5Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex5Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		//요청지로부터 전달되어 오는 파라미터들 받기 전에
		// 요청시 한글처리를 해야 한다.
		request.setCharacterEncoding("utf-8");
		String[] f_name = request.getParameterValues("f_name");
		
		//응답을 위한 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("받은 친구의 이름들 ------------<br/>");
		int count = 0;
		for(int i = 0; i<f_name.length; i++) {
			if(f_name[i].trim().length() > 0) {
				out.println(f_name[i] + "<br/>");
				count++;
			}
		}
		out.println("친구 "+ count + "명");
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
