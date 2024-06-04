package test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class EmpAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 사원목록 EmpDAO에서 가져오기
		EmpVO[] ar = EmpDAO.getList();
		
		//위에서 얻어낸 사원들의 목록을 request에 "emp"라는 이름으로 저장하면 된다.
		request.setAttribute("emp", ar);
		
		return "emp.jsp"; 	//뷰 페이지의 경로를 반환한다.
	}

}
