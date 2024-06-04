package pm;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String viewPath = null; //jsp경로 저장
		Action action = null;
		if(type == null || type.equalsIgnoreCase("emp")) {
			action = new Action() {
				
				@Override
				public String execute(HttpServletRequest request, HttpServletResponse response) {
					EmpVO[] ar = EmpDAO.getList();
					
					//위에서 얻어낸 배열을 request에 저장
					request.setAttribute("list",ar);
					return "/jsp/emp.jsp"; //forward 되는 jsp경로
				}
			};
			viewPath = action.execute(request, response);
			RequestDispatcher disp = request.getRequestDispatcher(viewPath);
			disp.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
