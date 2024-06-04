<%@page import="mybatis.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #table{
      width:600px;
      border-collapse:collapse;
   }
   
   #table th, #table td{
      border: 1px solid #ccc;
      padding:4px;
   }
   
   #table caption{text-indent: -9999px}
</style>
</head>
<body>
   <div id="wrap">
      <header>
         <h1>사원목록</h1>
      </header>   
      <article>
         <table id="table">
            <caption>사원목록테이블</caption>
            <thead>
               <tr>
                  <td colspan="4">
                     <select id="searchType">
                        <option value="0">::선택::</option>
                        <option value="1">사번</option>
                        <option value="2">이름</option>
                        <option value="3">직종</option>
                        <option value="4">부서코드</option>
                     </select>
                     <input type="text" id="searchValue" />
                     <button type="button" id="btn">검색</button>
                  </td>
               </tr>
               <tr>
                  <th>사번</th>
                  <th>이름</th>
                  <th>직종</th>
                  <th>부서코드</th>
               </tr>
            </thead>
            <tbody>
               <%
                  Object obj = request.getAttribute("emp");
                  
                  if(obj !=  null){
                     EmpVO[] ar = (EmpVO[])obj;
                     for(EmpVO evo:ar){
               %>
                     <tr>
                        <td><%= evo.getEmpno() %></td>
                        <td><%= evo.getEname() %></td>
                        <td><%= evo.getJob() %></td>
                        <td><%= evo.getDeptno() %></td>
                     </tr>
               <%
                     }// for의 끝
                  }// if문의 끝
               %>
            </tbody>
         </table>
      </article>
   </div>
   <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
   <script>
      $(function(){
         $("#btn").click(function(){
            // 사용자가 선택한 검색 타입을 가져온다.
            let type = $("#searchType").val(); // 1,2,3,4 중 하나
            
            // type의 값이 0일 때는 아무것도 해서는 안된다.
            if(type == 0){
               return;
            }
            
            // 다음은 사용자가 입력한 검색어
            let value = $("#searchValue").val();
            
            // 비동기식으로 전달할 파라미터 값 만들기
            let param = "type=search&searchType="+encodeURIComponent(type)+"&searchValue="+encodeURIComponent(value);
            
            $.ajax({
               url:"Controller",
               type: "post",
               data: param
            }).done(function(res){
               $("#table tbody").html(res);
            })
         });
      });
   </script>
</body>
</html>