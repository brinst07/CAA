package kr.or.ddit.sns.controller;

import java.net.URI;
import java.net.URISyntaxException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;
@Component
public class TextAnalysis {

	public void emotionAnalysis(String keyword) {
		HttpClient httpclient = HttpClients.createDefault();
	try {
		URIBuilder builder = new URIBuilder("https://koreacentral.api.cognitive.microsoft.com/text/analytics/v2.1/sentiment");

        builder.setParameter("showStats", "{boolean}");

        URI uri = builder.build();
        HttpPost request = new HttpPost(uri);
        request.setHeader("Content-Type", "application/json");
        request.setHeader("Ocp-Apim-Subscription-Key", "{7289f56dfecc47ca9049eedb5b4b71af}");


        // Request body
        StringEntity reqEntity = new StringEntity("{"+keyword+"}");
        request.setEntity(reqEntity);

        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();

        if (entity != null) 
        {
            System.out.println(EntityUtils.toString(entity));
        }
    }
    catch (Exception e)
    {
        System.out.println(e.getMessage());
    }
}
}
