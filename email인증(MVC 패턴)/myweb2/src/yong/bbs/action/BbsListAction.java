package yong.bbs.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import yong.controller.CommandHandler;

import yong.bbs.model.*;
import java.util.*;

public class BbsListAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/**페이지수 결정*/
		BbsDAO dao = new BbsDAO();
		int onepage = 4;	//한 화면에 게시물 수(listSize)
		int totalPage = dao.getPaging();	//전체 게시물 갯수 totalCnt
		
		int paging = totalPage / onepage;	//화면에 나타날 페이지수
		int ppaging = 2; // 한화면에 나타낼 페이지숫자의 수(페이징의 페이징)(pageSize)
		
		String cp_s = req.getParameter("cp");
		if((cp_s==null || cp_s.equals(""))){
			 cp_s="1";
		}
		int cp = Integer.parseInt(cp_s);
		
		
		
		if(totalPage%onepage>0){
			paging+=1;
		}
		int page = 1;
		String page_s = req.getParameter("cp");

		if(!(page_s==null || page_s.equals(""))){
		 page = Integer.parseInt(page_s);
		}
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		
		
		
		if(page==1){
		list = dao.getList(1, onepage);
		}else{
		list = dao.getList(page, onepage);
		
		}
		
		String pageStr = yong.page.PageModule.pageMake("bbsList.yong", totalPage, onepage, ppaging, cp);
		
		req.setAttribute("pageStr",pageStr);
		//처음(-1) 중간(0) 시작(1) 부분  <과 >삽입을 위해
		
		
		req.setAttribute("page", page);
		req.setAttribute("ppaging",ppaging);
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
		
		return "/bbs/bbsList.jsp";
	}

}
