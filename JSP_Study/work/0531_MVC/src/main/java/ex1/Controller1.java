package ex1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller1
 */
@WebServlet("/Controller1")
public class Controller1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//"type"이라는 파라미터를 받아서 변수 type에 저장!
			String type = request.getParameter("type");
			
			/*
			 *	type의 값이 null 이거나 "greet"이면 view1.jsp로 경로를 지정
			 *	그렇지 않고, type의 값이 "hi"이면 view2.jsp로 경로 지정 
			 */
			String viewPath = null; //경로를 저장할 변수
			if(type == null || type.equalsIgnoreCase("greet")) {
				viewPath = "/ex1/view1.jsp";
				request.setAttribute("v1","Hello~");
			}else if(type.equalsIgnoreCase("hi")) {
				viewPath = "/ex1/view2.jsp";
				request.setAttribute("v1","안녕하세요");
			}
			//MVC패턴에서는 뷰 페이지 이동을 forward를 시킨다.
			RequestDispatcher disp = request.getRequestDispatcher(viewPath);
			disp.forward(request, response); //forward로 이동
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
