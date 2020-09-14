package kr.or.ddit.sns.controller;

import org.springframework.stereotype.Component;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
@Component
public class DataLab {

	public static String start(String startDate, String endDate, String keyword) {
		// 네이버 데이터랩
		String clientId = "Lffj02AAFQlR_VDui1lo";
		String clientSecret = "q7_eGt_AUC";

		String apiUrl = "https://openapi.naver.com/v1/datalab/search";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		requestHeaders.put("Content-Type", "application/json; charset=utf-8");
		
		 String requestBody = "{\"startDate\":\""+startDate+"\"," +
	                "\"endDate\":\""+endDate+"\"," +
	                "\"timeUnit\":\"month\"," +
	                "\"keywordGroups\":[{\"groupName\":\""+keyword+"\"," + "\"keywords\":[\""+keyword+"\"]}]," +
	                "\"device\":\"pc\"}";
		
		 String responseBody = post(apiUrl, requestHeaders, requestBody);
		 
		 return responseBody;
	}

	private static String post(String apiUrl, Map<String, String> requestHeaders, String requestBody) {
		HttpURLConnection con = connect(apiUrl);

		try {
			con.setRequestMethod("POST");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			con.setDoOutput(true);
			try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
				wr.write(requestBody.getBytes());
				wr.flush();
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
				return readBody(con.getInputStream());
			} else { // 에러 응답
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
