package yong.bbs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yong.controller.CommandHandler;
import yong.bbs.model.*;

public class BbsWriteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String writer = req.getParameter("writer");
		String pwd = req.getParameter("pwd");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		BbsDTO dto = new BbsDTO(writer, pwd, subject, content);
		BbsDAO dao = new BbsDAO();
		int result = dao.bbsWrite(dto);
		String msg = result > 0?"글쓰기 성공!":"글쓰기 실패!";
		req.setAttribute("msg", msg);
		
		return "/bbs/bbsMsg.jsp";
	}

}
