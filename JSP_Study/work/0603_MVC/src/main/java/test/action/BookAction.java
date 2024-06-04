package test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BookDAO;
import mybatis.dao.EmpDAO;
import mybatis.dao.MemoDAO;
import mybatis.vo.BookVO;
import mybatis.vo.EmpVO;
import mybatis.vo.MemoVO;

public class BookAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 사원목록 EmpDAO에서 가져오기
		BookVO[] ar = BookDAO.getList();
		
		//위에서 얻어낸 사원들의 목록을 request에 "memo"라는 이름으로 저장하면 된다.
		request.setAttribute("book", ar);
		
		return "book.jsp"; 	//뷰 페이지의 경로를 반환한다.
	}

}
