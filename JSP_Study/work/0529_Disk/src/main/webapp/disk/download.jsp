<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
		//요청시 한글처리
		request.setCharacterEncoding("utf-8");

		//전달되어 오는 파라미터들 받기(f_name, cPath)
		String cPath = request.getParameter("cPath"); //파일의 위치
		String fname = request.getParameter("f_name");	//파일명
		
		//파일객체 만들어야하고 파일객체 만들려면 절대경로 필요함
		//위의 값들을 연결하여 절대 경로로 만든다
		String realPath = application.getRealPath("/members/"+cPath+"/"+fname);	
		
		File f = new File(realPath);
		
		//존재 여부 확인
		if(f.exists()){
			byte[] buf = new byte[4069]; //바구니 만들었음
			int size = -1;  //읽은 개수
			
			//다운로드에 필요한 스트림들 준비
			BufferedInputStream bis = null;
			FileInputStream fis = null;
			
			BufferedOutputStream bos = null;
			ServletOutputStream sos = null; // FileOutputStream이 아닌이유: 접속자 PC로 다운로드를 시켜야 하기때문에 response를 통해 스트림을
											// 생성 또는 얻어내야 한다. 즉, response로부터 얻어지는 OutputStream이 바로 ServletOutputStream이다.
			
			try{
				//접속자 화면에 다운로드 창을 보여준다
				response.setContentType("application/x-msdownload");
				response.setHeader("Content-Disposition", "attachment;filename="+ new String(fname.getBytes(),"8859_1"));
				// -------------------------------------------------------------------------------------------------------------
				
				//다운로드 할 File과 연결되는 스트림을 생성
				fis = new FileInputStream(f);
				bis = new BufferedInputStream(fis);
				
				//response를 통해 이미 out이라는 스트림이 존재하므로 오류가 발생함
				// 이것을 잠시 없앤다
				out.clear();
				
				out = pageContext.popBody();
				
				sos = response.getOutputStream(); //*******
				bos = new BufferedOutputStream(sos);
				
				//스트림이 모두 준비완료 되었으니 읽기한 후 바로 쓰기를 하여
				//요청한 곳으로 부터 다운이 되도록 한다
				while((size = bis.read(buf)) != -1){
					//읽은 자원은 buf가 가지고 있으며, 읽은 바이트 수는
					//size가 기억하고 있다.
					bos.write(buf,0,size);
					bos.flush();
				}
				
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(fis != null)
						fis.close();
					if(bis != null)
						bis.close();
					if(sos != null)
						sos.close();
					if(bos != null)
						bos.close();
				}catch(Exception e){
					
				}
			}
											
		}//if문의 끝
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>