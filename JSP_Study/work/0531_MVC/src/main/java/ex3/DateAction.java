package ex3;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		LocalDate date = LocalDate.now();
		request.setAttribute("date", date.toString());

		return "/ex3/page2.jsp";
	}

}
