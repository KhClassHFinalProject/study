package yong.bbs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yong.controller.CommandHandler;
import yong.bbs.model.*;

public class BbsWriteFormAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		return "/bbs/bbsWrite.jsp";
	}

}
