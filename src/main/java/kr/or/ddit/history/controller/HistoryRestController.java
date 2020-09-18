package kr.or.ddit.history.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.or.ddit.ir.domain.SquarePoint;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/history/rest/*")
public class HistoryRestController {

    @PostMapping(value = "/boundSelect", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<Map<String,String>>> boundSelect(@RequestBody SquarePoint squarePoint) {

        //ServiceKey
        String serviceKey = "IGbeITLd67yRCztv9r65smZLPw2NfvkXkgh7G6BnB3JbBcn3jnPdQ5x5wRJdqMEg62O9YJ9kvgy4jl%2BwoxA5Fg%3D%3D";

        
        String url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRectangle?ServiceKey=" + serviceKey + 
        		"&minx=" + squarePoint.getMinx() + "&miny=" + squarePoint.getMiny() + "&maxx=" + 
        		squarePoint.getMaxx() +"&maxy=" + squarePoint.getMaxy()  + "&type=json";
        
        
       

        HttpClient httpClient = new DefaultHttpClient();
        ResponseHandler<String> responseHandler = new BasicResponseHandler();
        HttpGet httpGet = new HttpGet();
        List<Map<String, Object>> finalList = new ArrayList<>();
        List<Map<String,String>> returnMap = new ArrayList<Map<String,String>>();
        try {
            httpGet.setURI(new URI(url));
            String responseBody = httpClient.execute(httpGet, responseHandler);
            //문자열을 자바단으로 바꾸기 위해 ObjectMapper 사용
            ObjectMapper objectMapper = new ObjectMapper();
            //자바 형식으로 바꿈
            Map<String, Map<String, List<Map<String, Object>>>> list = objectMapper.readValue(responseBody,
                    new TypeReference<Map<String, Map<String, Object>>>() {
                    });

            // 선택한 영역의 데이터 전처리 후 필요한 데이터만을 저장하는 list
            
            finalList = list.get("body").get("items");
            if (finalList.size() != 0) {
                for (int i = 0; i < finalList.size(); i++) {
                    Map<String,String> map = new HashMap<>();
                    map.put("storeNm", String.valueOf(finalList.get(i).get("bizesNm")));
                    map.put("storeZi", String.valueOf(finalList.get(i).get("brchNm")));
                    map.put("storeAddr", String.valueOf(finalList.get(i).get("lnoAdr")));
                    map.put("x", String.valueOf(finalList.get(i).get("lon")));
                    map.put("y",String.valueOf(finalList.get(i).get("lat")));
                    map.put("type", String.valueOf(finalList.get(i).get("indsLclsNm")));
                    map.put("category", String.valueOf(finalList.get(i).get("indsSclsNm")));
                    returnMap.add(map);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<List<Map<String,String>>>(returnMap, HttpStatus.OK);
    }
}
