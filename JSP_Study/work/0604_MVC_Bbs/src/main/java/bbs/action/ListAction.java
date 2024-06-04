package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String bname = request.getParameter("bname");
		
		//현재 페이지 값 받기
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			cPage = "1";
		}
		
		// 받은 현재페이지 값을 정수로 변환하자
		int c_page = Integer.parseInt(cPage);
		
		// 한 페이지에 보여질 게시물 수 
		int numPerPage = 10;
		
		int begin = (c_page - 1) * numPerPage + 1;
		int end = begin * numPerPage;
		
		BbsVO[] ar = BbsDAO.getList(bname, begin, end);
		
		// 위의 배열 ar을 jsp에서 표현하기 위해 request에 저장
		request.setAttribute("ar", ar);
		
		return "/jsp/"+bname+"/list.jsp";
	}

}
