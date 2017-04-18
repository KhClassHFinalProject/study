package yong.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//설정파일 사용하기
import java.util.*;
import java.io.*;


public class YongController extends HttpServlet {
	
	private HashMap map;
	
	public YongController() {
		map = new HashMap();
	}
	
	@Override
	public void init() throws ServletException {
		
		String absPath = this.getServletContext().getRealPath("/WEB-INF/yongCommnad.properties");
		
//		System.out.println(absPath);
		Properties pr = new Properties();
		try {
			FileInputStream fis = new FileInputStream(absPath);
			pr.load(fis);
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Iterator keys = pr.keySet().iterator();
		
		while(keys.hasNext()){
			String key = (String)keys.next();
			String value = pr.getProperty(key);
			try {
				Class classValue = Class.forName(value);//설계도를 반환타입으로 받기
				Object obj = classValue.newInstance();
				
				map.put(key, obj);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // 사용자 정의 메소드

		// 1.요청받기
		// 파라매터로 구분하기
//		String type = req.getParameter("type");
		String type = req.getRequestURI();
		if(type.indexOf(req.getContextPath())==0){
			type = type.substring(req.getContextPath().length());
			
		}
		
//우리가 고민해야 하는 부분
		// 2.요구분석 //3가지 기능이 있다고 가정
	
//		String result = "";
//		String goPage = "";
//		CommandHandler cmd = null;
		
		CommandHandler cmd = (CommandHandler)map.get(type);
		
//		if (type.equals("list")) {
//			// 3.요구분석에 따른 기능 수행
////			result = "MVC를 이용한 리스트 결과";
////			goPage = "/list.jsp";
//			
//			cmd = new ListAction();
//
//		} else if (type.equals("write")) {
//			// 3.요구분석에 따른 기능 수행
////			result = "MVC를 이용한 글쓰기 결과";
////			goPage = "/write.jsp";
//			
//			cmd = new WriteAction();
//			
//		} else if (type.equals("content")) {
//			// 3.요구 분석에 따른 기능 수행
////			result = "MVC를 이용한 본문보기 결과";
////			goPage = "/content.jsp";
//			
//			cmd = new ContentAction();
//		}
		
		String goPage = cmd.process(req, resp);

//4번5번은 정형화된 코드임.
		
		// 4.결과저장
//		req.setAttribute("result", result);

		// 5.전달
		// 내가 어느페이지로 전달할 것인가 정해야 한다. 위쪽에 goPage부분 추가
		RequestDispatcher dis = req.getRequestDispatcher(goPage); // dispatcher객체
																	// 할당

		dis.forward(req, resp); // 웹의 기본인 요청 및 응답 객체를 보내야한다.

	}

}
