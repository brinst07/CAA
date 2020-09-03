package kr.or.ddit.cctv.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class TTT {
	public static void main(String[] args) {
		try {
			URL url = new URL("http://cctvsec.ktict.co.kr/2487/65rPBtfpE8PykdJwf+pvwa+fbztACc7ZgqitPYf48CGmx8NK7qRATJLQuIMK0vS3");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			InputStream bis = con.getInputStream();
			byte[] tmp = new byte[1024];
			FileOutputStream fo = new FileOutputStream("d:/asd.mp4");
			int c;
			while((c=bis.read(tmp)) != -1) {
				fo.write(tmp, 0, c);
			}
			
			fo.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	
		
		
	}
}
