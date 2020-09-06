package kr.or.ddit.sns.controller;

import com.twitter.penguin.korean.TwitterKoreanProcessorJava;
import com.twitter.penguin.korean.tokenizer.KoreanTokenizer;
import kr.or.ddit.sns.domain.WordVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import scala.collection.Seq;
import twitter4j.*;
import twitter4j.conf.ConfigurationBuilder;

import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping("/sns/rest/*")
@Log4j
@AllArgsConstructor
public class SNSRestController {
	
	@Autowired
	private DataLab datalab;
	@Autowired
	private TextAnalysis text;
	
	@PostMapping("/wordCloud")
	public ResponseEntity<Map<String, Object>> wordCloud(@RequestBody WordVO vo) {
		String url = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=" + vo.getKeyword();

		Document doc;
		List<String> keywords = null;
		try {
			keywords = new ArrayList<>();
			doc = Jsoup.connect(url).get();
			Elements block = doc.getElementsByClass("_related_keyword_ul");
			Elements li = block.select("li");
			// 연관검색어를 리스트에 넣는 부분
			for (Element element : li) {
				keywords.add(element.text());
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true).setOAuthConsumerKey("7Q6pWnroTBFRhN2dLGK6WwuhU")
				.setOAuthConsumerSecret("wEysjZcsvWtDzoDnRa1loIlgwZkPqcnN0C3XDNqTM9a59D7sJq")
				.setOAuthAccessToken("1300263521997922305-llMTk2omFPmjgnMXggIr0PkoDQmfbA")
				.setOAuthAccessTokenSecret("84wqzksAT4h0sm3rHXBqMKn9Qk3AiVyYn4EgB9aCedNT1");

		TwitterFactory tf = new TwitterFactory(cb.build());
		Twitter twitter = tf.getInstance();

		Query query = new Query(vo.getKeyword());
		query.count(100);
		QueryResult result = null;
		List<Status> tweets = null;
		String resultTxt = "";
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> emotial = new HashMap<String,Object>();
		try {
			result = twitter.search(query);
			tweets = result.getTweets();
			List<Map<String,String>> emotialData = new ArrayList<Map<String,String>>();
			for (int i = 0; i < tweets.size(); i++) {
				resultTxt += tweets.get(i).getText();
				Map<String, String> emotialMap = new HashMap<String, String>();
				
			}

		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//---------------------------------------감정분석
		text.emotionAnalysis(resultTxt);
		
		
		
		
		
		//---------------------------------------감정분석
		

		String response = datalab.start(vo.getStartDate(), vo.getEndDate(), vo.getKeyword());
		log.info(response);
		
		CharSequence normalized = TwitterKoreanProcessorJava.normalize(resultTxt);
		Seq<KoreanTokenizer.KoreanToken> tokens = TwitterKoreanProcessorJava.tokenize(normalized);
		tokens = TwitterKoreanProcessorJava.stem(tokens);
		List<String> javaParsed = TwitterKoreanProcessorJava.tokensToJavaStringList(tokens);
		
		// 단어 Counting
		Set<String> wordSet = new HashSet<String>();
		Map<String, Integer> wordCnt = new HashMap<String, Integer>();
		for (String s : javaParsed) {
			// 일반적으로 많이 등장하는 단어 : 단어 리스트에 불포함
			if (s.equals("으로") || s.equals("에서") || s.equals("이다") || s.equals("있다") || s.equals("일본"))
				continue;
			// 단어 길이가 1인 조사들 : 단어 리스트에 불포함
			if (s.length() > 1) {
				if (wordSet.contains(s)) {
					wordCnt.put(s, 1 + wordCnt.get(s));
				} else if (wordSet.isEmpty()) {
					wordCnt.put(s, 1);
				} else {
					wordCnt.put(s, 1);
				}
				wordSet.add(s);
			}
		}

		// Json 형태로 만들기
		for (String temp : wordSet) {
			if (wordCnt.get(temp) < 10)
				continue;
			else {
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("text", temp);
				map.put("size", wordCnt.get(temp));
				list.add(map);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("keywords",keywords);
		map.put("response", response);
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);

	}
}
