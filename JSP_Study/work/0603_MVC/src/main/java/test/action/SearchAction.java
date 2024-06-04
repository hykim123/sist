package test.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class SearchAction implements Action {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {
      //파라미터값(searchType, searchValue) 받기
      String searchType = request.getParameter("searchType");
      String searchValue = request.getParameter("searchValue");
      
      HashMap<String, String> map = new HashMap<>();
      map.put("searchType", searchType);
      map.put("searchValue", searchValue);
      
      EmpVO[] ar = EmpDAO.searchList(map);
      
      //jsp에서 표현할 수 있도록 저장
      request.setAttribute("ar", ar);
      
      return "searchEmp.jsp";
   }

}
