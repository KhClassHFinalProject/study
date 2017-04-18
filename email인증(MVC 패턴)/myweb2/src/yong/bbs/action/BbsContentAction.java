package yong.bbs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yong.controller.CommandHandler;
import yong.bbs.model.*;

public class BbsContentAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx_s = req.getParameter("idx");
		
		BbsDTO dto = new BbsDTO();
		if(idx_s==null || idx_s.equals("")){
			
		 idx_s = "0";
		}
		
		int idx = Integer.parseInt(idx_s);
		BbsDAO dao = new BbsDAO();
		dto = dao.getContent(idx);
		
		
		String msg = "";
		String goPage="";
		if(dto==null){
			msg="잘못된 접근 또는 삭제된 게시글입니다.";
			req.setAttribute("msg", msg);
			goPage="/bbs/bbsMsg.jsp";
		}else{
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			req.setAttribute("dto", dto);
			goPage="/bbs/bbsContent.jsp";
		}
		return goPage;
	}

}
