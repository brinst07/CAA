package kr.or.ddit.history.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/History.do")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/* @See HttpServlet#HttpServlet() */
	public History() {
		super();
	}
	
	/* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListByDate?serviceKey=";
		String serviceKey = "IGbeITLd67yRCztv9r65smZLPw2NfvkXkgh7G6BnB3JbBcn3jnPdQ5x5wRJdqMEg62O9YJ9kvgy4jl%2BwoxA5Fg%3D%3D";
		String parameter = "";
//			serviceKey = URLEncoder.encode(serviceKey, "utf-8");
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "key=20171202";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
//		CachedOutputStream bos = new CachedOutputStream();
		
	}
	
	

}
