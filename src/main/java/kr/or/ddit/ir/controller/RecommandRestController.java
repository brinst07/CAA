package kr.or.ddit.ir.controller;

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
@RequestMapping("/ir/rest/*")
public class RecommandRestController {

    @PostMapping(value = "/boundSelect",produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Map<String,Object>> boundSelect(@RequestBody SquarePoint squarePoint){
        log.warn(squarePoint);

        //ServiceKey
        String serviceKey = "21SOlCjmfqUliASu82VGE2%2FXQ1uFeVzXzPQ7egYRvgT7cKF1cBdfAONRgbHRnpHFgtd3NlHgCOj2kblMeWg6iQ%3D%3D";

        String url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInRectangle?minx="+squarePoint.getMinx()+"&miny=" + squarePoint.getMiny()
                + "&maxx=" + squarePoint.getMaxx() + "&maxy=" + squarePoint.getMaxy() + "&ServiceKey="+serviceKey +"&type=json";

        HttpClient httpClient = new DefaultHttpClient();
        ResponseHandler<String> responseHandler = new BasicResponseHandler();
        HttpGet httpGet = new HttpGet();
        List<Map<String, Object>> finalList = new ArrayList<>();
        Map<String,Object> pointsName = new HashMap<>();
        try {
            httpGet.setURI(new URI(url));
            String responseBody = httpClient.execute(httpGet,responseHandler);

            ObjectMapper objectMapper = new ObjectMapper();

            Map<String, Map<String, List<Map<String, Object>>>> list = objectMapper.readValue(responseBody,
                    new TypeReference<Map<String, Map<String, Object>>>() {
                    });

            // 선택한 영역의 데이터 전처리 후 필요한 데이터만을 저장하는 list
            finalList = list.get("body").get("items");

            if(finalList.size() != 0){
                List<Map<String,String>> points = new ArrayList<>();
                for(int i = 0; i<finalList.size(); i++){
                    //상권이름 추출
                    String scName = (String) finalList.get(i).get("mainTrarNm");

                    //상권의 좌표를 출력
                    String polygonStr = (String) finalList.get(i).get("coords");

                    //데이터 전처리
                    polygonStr = polygonStr.replace("POLYGON ((","");
                    polygonStr = polygonStr.replace("))","");

                    String[] polygonlist = polygonStr.split(", ");

                    //공백을 기준으로 split을 사용
                    for(int j = 0; j<polygonlist.length; j++){
                        Map<String,String> point = new HashMap<>();
                        String[] tempList = polygonlist[j].split(" ");
                        point.put("x",tempList[0]);
                        point.put("y",tempList[1]);
                        points.add(point);
                    }
                    pointsName.put(scName,points);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return new ResponseEntity<Map<String,Object>>(pointsName, HttpStatus.OK);
    }
}
