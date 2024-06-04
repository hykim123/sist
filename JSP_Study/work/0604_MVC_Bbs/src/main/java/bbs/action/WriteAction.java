package bbs.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//bname이라는 파라미터 값 받기
		String bname = request.getParameter("bname");
		String viewPath = null;
		
		// 글쓰기 화면으로 이동하거나 데이터들을 더 받아서 DB에 저장하거나
		// 둘 중 하나를 하게 된다.
		// 현재 액션객체를 호출하는 곳이 2군데나 된다.
		// 1) list.jsp 에서 [글쓰기] 클릭했을 때 get방식으로 오게된다 
		// 2) write.jsp 에서 [저장] 버튼 눌렀을 때 post방식으로 오게된다
		
		String enc_type = request.getContentType();
		System.out.println("type: " + enc_type);
		
		if(enc_type == null) {
			viewPath = "/jsp/"+bname+"/write.jsp";
		}else if(enc_type.startsWith("multipart")) {
			//파일 첨부가 된 상태에서 현재 겍체가 불려진 겅우
			// 폼에 enctype이 multipart....로 지정 되었다면
			// 절대로 request.getParameter()로 값을 받지 못한다.
			// 반드시 cos.jar 라는 라이브러리에 있는 MultipartRequest를 이용해야 한다
			
			//첨부된 파일이 저장될 곳을 절대경로로 만들어야 한다.
			ServletContext application = request.getServletContext(); //우리가 만들고있는 프로젝트 자체 의미
			
			String realPath = application.getRealPath("/upload"); //webapp까지의 경로 잡아줌
			
			
			
		}
		return viewPath;
	}

}
