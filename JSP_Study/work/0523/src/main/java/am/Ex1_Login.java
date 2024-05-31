package am;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import am.vo.MemVO;

/**
 * Servlet implementation class Ex1_Login
 */
public class Ex1_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex1_Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 보통 로그인을 수행할 때 id와 pw는 한글로하는 사람이 없으므로
		// 요청시 한글 처리는 생략한다
		// 1. 파라미터(mid, mpw)들 받기
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		//DB로부터 인증받기 위해 login mapper를 호출해야 한다.
		Map<String, String> map = new HashMap<>();
		map.put("mid",mid);
		map.put("mpw",mpw);
		
		Reader r = Resources.getResourceAsReader("am/config/config.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		r.close();
		
		SqlSession ss = factory.openSession();
		
		MemVO mvo = ss.selectOne("member.login", map);
		if(mvo != null) {
			HttpSession session = request.getSession(); // 이미 톰캣으로부터 만들어져 있는 세션을 받음
			session.setAttribute("mvo", mvo); //이렇게 하면 나중에 로그인 한 애들마다 mvo가 있는지 확인해서
			// 있으면 로그인 시키고 없으면 로그인 안시킴
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
