<%@page import="mybatis.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //request에 ar이라는 이름으로 저정된 정보를 가져온다.
   Object obj = request.getAttribute("ar");

   //obj가 비어있지 않을때만 형변환을 해야함
   EmpVO[] ar = null;
   if(obj != null){
      ar = (EmpVO[])obj;
      
      for(EmpVO evo : ar){
%>
      <tr>
         <td><%=evo.getEmpno() %></td>
         <td><%=evo.getEname() %></td>
         <td><%=evo.getJob() %></td>
         <td><%=evo.getDeptno() %></td>
      </tr>
<%                        
      }
   }
%>
