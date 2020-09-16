package kr.or.ddit.history.controller;

import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.python.jline.internal.InputStreamReader;

public class HistoryAPI {
	public static void main(String[] args) {
		BufferedReader br = null;
		try {
			String urlstr = "http://apis.data.go.kr/" + ""
					+ "B553077/api/open/sdsc/storeListByDate"
					+ "?key=20171202&serviceKey=IGbeITLd67yRCztv9r65smZLPw2NfvkXkgh7G6BnB3JbBcn3jnPdQ5x5wRJdqMEg62O9YJ9kvgy4jl%2BwoxA5Fg%3D%3D";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			System.out.println(result);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
