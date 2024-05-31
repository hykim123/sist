package pm;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pm.vo.EmpVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * Servlet implementation class Ex8Servlet
 */
public class Ex8Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex8Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 한글처리
		request.setCharacterEncoding("utf-8");
		
		//응답시 한글처리
		response.setContentType("text/html; charset=utf-8");
		
		//전달되어 오는 파라미터들 받기
		String select = request.getParameter("select");
		String select2 = request.getParameter("select2");
		
		//위 두개의 파라미터를 mapper의 emp.xml에서 사용하기 위해 Map구조 만들기
		Map<String, String> map = new HashMap<String, String>();
		map.put("select", select);
		map.put("select2", select2);
		
		Reader r = Resources.getResourceAsReader("pm/config/config.xml"); //.~~. = 자바파일 xml파일이니까 /
		
		//준비된 reader를 활용해서 SqlSessionFactory를 생성하자
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		r.close();
		//-----------한번만 수행하면 좋은 내용-------------
		
		//원하는 SQL문을 호출하기 위해 SqlSession을 구한다.
		SqlSession ss = factory.openSession();
		
		List<EmpVO> list = ss.selectList("emp.select",map);
		
		StringBuffer sb = new StringBuffer(); // 결과를 문자열로 편집하기 위해 필요
		
		sb.append("<ol>");
		//	for(int i=0; i<list.size(); i++) {
		for(EmpVO vo: list) { //리스트로부터 empVO의 evo를 가져온다
			//list에서 하나의 EmpVO객체를 얻어낸다.
			//EmpVO vo = list.get(i);
			sb.append("<li>" + vo.getEmpno() + " / " + vo.getEname() + " / " + vo.getJob() + "</li>");
		}
		sb.append("</ol>");
		
		ss.close();

		//응답을 위해 스트림 준비
		PrintWriter out = response.getWriter();
		
		//응답시작
		out.println("<h1>사원목록</h1>");
		out.println(sb.toString()); //ol태그
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
