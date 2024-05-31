<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	//파라미터들 받기(cPath, f_name)
	String cPath = request.getParameter("cPath"); //위치
	String f_name = request.getParameter("f_name"); // 폴더명
	
	//파일을 만들때는 절대 경로가 필요함
	//절대경로 생성
	String path = application.getRealPath("/members/"+cPath+"/"+f_name); // /: 0528_Disk의 webapp 딱 여기
	
	//절대경로를 가지고 File객체 생성
	File f = new File(path);
	
	if(!f.exists()){
		f.mkdirs(); //폴더 생성
	}
	
	//원래 있던 위치(cPath)로 강제 이동
	//response.sendRedirect("myDisk.jsp?cPath="+cPath);
	
%>
<script>
	location.href="myDisk.jsp?cPath=<%=cPath%>";
</script>
