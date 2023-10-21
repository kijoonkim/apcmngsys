package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;

public class test {

	public static void main(String[] args) throws Exception {
		String url = "https://uni.agrix.go.kr/api/srvc/farmerInfo?accessToken=eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTk2NDcyOTI3NzMsImFwaU5tIjoiZmFybWVySW5mbyIsImlzcyI6IlNZU1RFTSJ9.f9oToC5zUynRzK5zCgu-zgvZNJ0bN-MSzA_FQxtaEPY&version=1.0&responseType=json&frmerSn=AGUN47";

		System.out.println("==========================11");

		System.out.println("==========================1");
		//HashMap<String, Object> hMap = new HashMap<>();
	//	hMap.put("frmerSn", "AGUN47");

		ObjectMapper objectMapper = new ObjectMapper();
		String jsonStr = "";
		//	jsonStr = objectMapper.writeValueAsString(hMap);
		RestFulService restFulService = new RestFulService();
			System.out.println("=====================");
			Map rtnData = (Map) restFulService.clear().get().contentType(new MediaType(MediaType.APPLICATION_JSON)).baseUrl(url).body(jsonStr).execute().bodyToData(Map.class);

			System.out.println(rtnData);
			Map<String, Object> map = (Map<String, Object>) rtnData.get("items");

			for (String key : map.keySet()) {
				System.out.println("key = " + key);
				System.out.println(map.get(key));

				if ("item".equals(key)) {
					List<Map> list = (List<Map>) map.get(key);

					for (Map<String, String> m : list) {

						for (String key2 : m.keySet()) {
							System.out.println("item key2 = " + key2);
							System.out.println(m.get(key2));

							//server.aaa(m)

							//mapper.insert


						//intser into aaa(a, b,c) values(#{brthdy}, #{brthdy2}, #{brthdy})

						}
					}
				}
			}
/*


			List<Map> list = (List<Map>) map.get("item");

			for (Map m : list) {
				System.out.println(m.get("frmerSn"));
			}


			System.out.println(list);
			System.out.println(map.get("message"));
*/
	}

}
