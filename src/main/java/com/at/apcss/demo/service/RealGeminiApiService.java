package com.apcmngsys.apcss.demo.service; // 사용자님의 패키지 경로에 맞게 수정하세요

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList; // Google Search 도구 추가를 위해 import
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Gemini API와 실제로 통신(HTTP POST)하는 역할을 전담하는 서비스 클래스입니다.
 * 'AiService'(지휘자)가 이 서비스를 호출하여 AI의 응답을 받아옵니다.
 */
@Service
public class RealGeminiApiService {

    private static final Logger log = LoggerFactory.getLogger(RealGeminiApiService.class);

    // application.properties에서 API 키를 주입받습니다.
    @Value("${gemini.api.key}")
    private String geminiApiKey;

    // API 엔드포인트 URL (사용할 모델에 맞춰 지정)
    private static final String GEMINI_API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-preview-09-2025:generateContent?key=";

    // HTTP 통신을 위한 RestTemplate (애플리케이션 로드 시 한 번만 생성)
    private final RestTemplate restTemplate = new RestTemplate();

    /**
     * 사용자의 프롬프트와 도구 목록을 받아 Gemini API를 호출하고,
     * AI의 원본 응답(JSON 문자열)을 반환합니다.
     * * @param prompt 사용자가 입력한 원본 프롬프트 (예: "거산 실적 줘")
     * @param tools React 앱에서 전달된 '우리 DB용 도구' 목록
     * @return Gemini API의 원본 JSON 응답 문자열
     */
    public String callGemini(String prompt, List<Map<String, Object>> tools) {

        String apiUrl = GEMINI_API_URL + geminiApiKey;

        // 1. Gemini API 요청 Body를 Map으로 구성합니다.
        Map<String, Object> requestBody = new HashMap<>();

        // 1-1. "contents" 구성: 사용자의 프롬프트를 담습니다.
        Map<String, String> part = new HashMap<>();
        part.put("text", prompt);
        Map<String, Object> content = new HashMap<>();
        content.put("parts", Collections.singletonList(part));
        requestBody.put("contents", Collections.singletonList(content));

        // 1-2. "tools" 구성: '하이브리드 공구함'을 만듭니다.
        List<Object> allTools = new ArrayList<>();
        if (tools != null && !tools.isEmpty()) {
            allTools.addAll(tools); // React에서 받은 '우리 DB용 도구' 추가
        }

        // 여기에 'Google Search' 도구를 추가합니다.
        // AI가 우리 DB로 해결할 수 없는 질문(날씨, 일반 상식 등)을 받았을 때
        // 이 도구를 선택하게 됩니다.
//        Map<String, Object> googleSearchTool = new HashMap<>();
//        googleSearchTool.put("google_search", new HashMap<>()); // 빈 객체로 { "google_search": {} } 를 표현
//        allTools.add(googleSearchTool);

        requestBody.put("tools", allTools);

        log.debug("Gemini API 요청 URL: {}", apiUrl);
        log.debug("Gemini API 요청 Body: {}", requestBody);

        // 2. HTTP 헤더를 설정합니다. (Content-Type: application/json)
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

        // 3. 요청 객체(Body + Header)를 생성합니다.
        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

        try {
            // 4. RestTemplate을 사용하여 POST 요청을 보내고 응답(JSON 문자열)을 받습니다.
            log.info("Gemini API에 요청을 전송합니다...");
            String response = restTemplate.postForObject(apiUrl, entity, String.class);
            log.info("Gemini API로부터 응답을 받았습니다.");
            log.debug("Gemini API 응답 내용: {}", response);
            return response;

        } catch (HttpClientErrorException e) {
            // 4xx, 5xx 에러 등 API에서 에러 응답이 온 경우
            log.error("Gemini API 호출 실패 (HTTP Status: {}): {}", e.getStatusCode(), e.getResponseBodyAsString(), e);
            return String.format("{\"error\": \"API 호출 실패 (HTTP %s)\", \"message\": \"%s\"}",
                    e.getStatusCode(), e.getResponseBodyAsString().replace("\"", "'"));
        } catch (RestClientException e) {
            // 네트워크 연결 실패 등 기타 통신 오류
            log.error("Gemini API 통신 중 오류 발생: {}", e.getMessage(), e);
            return String.format("{\"error\": \"API 통신 오류\", \"message\": \"%s\"}",
                    e.getMessage().replace("\"", "'"));
        }
    }
}
