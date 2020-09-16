package kr.or.ddit.history.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.python.apache.commons.compress.utils.IOUtils;
import org.springframework.web.bind.annotation.RequestParam;

import twitter4j.JSONObject;

@WebServlet("/HistoryDetail.do")
public class HistoryDetail extends HttpServlet {
	
	public void HistoryDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam String key) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListByDate?serviceKey=";
		String serviceKey = "IGbeITLd67yRCztv9r65smZLPw2NfvkXkgh7G6BnB3JbBcn3jnPdQ5x5wRJdqMEg62O9YJ9kvgy4jl%2BwoxA5Fg%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		
		parameter = parameter + "&" + "key=" + key;
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		System.out.println(addr);
		
		InputStream in = url.openStream(); // URL로 부터 자바로 데이터 읽어오도록 URL 객체로 스트림 열기
		
		ByteArrayOutputStream bos1 = new ByteArrayOutputStream(); // InputStream의 데이터들을 바이트 배열로 저장하기 위해
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
		
		String mbos = bos1.toString("UTF-8");
		
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		
		JSONObject json = new JSONObject();
		json.put("data", s);
		
		
	}

}
