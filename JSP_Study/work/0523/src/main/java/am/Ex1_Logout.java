package am;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class Ex1_Logout
 */
public class Ex1_Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex1_Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션얻기
		HttpSession session = request.getSession();
		
		//로그인시에 저장했던 값을 삭제
		session.removeAttribute("mvo");
		
		//강제 이동 > 다 버리고 이동하므로 request는 안돼
		// 세션: 내가쓰는것 , 어플리케이션: 다 같이 쓰는것 + 서버 끝나기 전까지 유지됨
		// 리다이렉트는 다버리고 가고 포워드는 들고감
		response.sendRedirect("Ex1_Service");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
