package ex3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Controller3
 */
@WebServlet("/Controller3")
public class Controller3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//type이라는 파라미터 받기
				String type = request.getParameter("type");
				String viewPath = null;
				Action action = null;
				if(type==null || type.equalsIgnoreCase("greet")) {
					action = new GreetAction();
				}else if(type.equalsIgnoreCase("date")) {
					action = new DateAction();
				}else if(type.equalsIgnoreCase("test")) {
					action = new Action() {
						@Override
						public String execute(HttpServletRequest request, HttpServletResponse response) {
							request.setAttribute("test", "TestAction입니다");

							return "/ex3/page3.jsp";
						}
					};
				}else if(type.equalsIgnoreCase("hungry")) {
					action = () -> {
						(request, response) {
							request.setAttribute("test", "점심먹으러 가요");

							return "/ex3/page4.jsp";
						}
					};
				}
				viewPath = action.execute(request, response); //재정의 돼서 자식 execute가 우선순위 된거임
				
				//forward시킬 준비
				RequestDispatcher disp = request.getRequestDispatcher(viewPath);
				disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
