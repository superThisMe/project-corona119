package com.project.corona.common;

import java.net.URI;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class KakaoRestApiHelper {
	
	private String restApiKey = "b0f607af4376f5d8e232203aa181f0cd";
	
	private static final String API_SERVER_HOST = "https://dapi.kakao.com";
	private static final String SEARCH_PLACE_BY_ADDR = "/v2/local/search/address.json";
	
	public List<String> searchPlaceByAddr(ArrayList<String> moves) throws Exception {
		
		List<String> latLngs = new ArrayList<String>();
		
		for (String move : moves) {
			String queryString = "?query=" + URLEncoder.encode(move, "UTF-8");
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			
			headers.add("Authorization", "KakaoAK " + restApiKey);
			headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
			headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
			
			URI uri = URI.create(API_SERVER_HOST + SEARCH_PLACE_BY_ADDR + queryString);
			RequestEntity<String> req = new RequestEntity<String>(headers, HttpMethod.GET, uri);
			ResponseEntity<String> res = restTemplate.exchange(req, String.class);
			
			JsonElement root = JsonParser.parseString(res.getBody());
			JsonObject doc = root.getAsJsonObject();
			JsonArray ar = doc.get("documents").getAsJsonArray();
			
			Iterator<JsonElement> iter = ar.iterator();
			JsonObject item = iter.next().getAsJsonObject();
			JsonObject address = item.get("address").getAsJsonObject();
			
			String x = address.get("x").getAsString();
			String y = address.get("y").getAsString();
			
			latLngs.add(y + "|" + x);
		}
		
		return latLngs;
	}

}
