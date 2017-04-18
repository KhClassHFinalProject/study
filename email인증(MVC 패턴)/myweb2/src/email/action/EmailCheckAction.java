package email.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yong.controller.CommandHandler;

public class EmailCheckAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String inputcode = req.getParameter("inputcode");
		/* String code = (String)request.getAttribute("code"); */
		String code = req.getParameter("code");
		System.out.println("code = "+code);
		
		System.out.println("EmailCheckAction 호출");
		String result = "false";
		String msg = "이메일 인증실패";
		if(inputcode.equals(code)){
			msg="이메일 인증성공";
			result="true";
			req.setAttribute("msg", msg);
			req.setAttribute("result", result);
			return "email/mailMsg.jsp";
		}else{
			req.setAttribute("msg", msg);
			req.setAttribute("result", result);
			return "email/mailMsg.jsp";
		}

		
		
		
	}

}
