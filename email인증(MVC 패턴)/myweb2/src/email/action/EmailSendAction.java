package email.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import yong.controller.CommandHandler;

import email.model.*;

public class EmailSendAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		
		String keylist="abcdefghijklmnopqrstuvwxyz123456789";
    	String code = "";
    	for(int i = 0 ; i < 8 ; i++){
    		code+= keylist.charAt((int)Math.floor(Math.random()*keylist.length()));
    	}
		
		
		EmailDAO dao = new EmailDAO();
		dao.sendEmail(email, code);
		req.setAttribute("code", code);
		return "email/mailCheck.jsp";
	}

}
