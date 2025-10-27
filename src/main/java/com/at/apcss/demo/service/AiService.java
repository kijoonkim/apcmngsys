package com.at.apcss.demo.service;

import com.at.apcss.demo.mapper.AiMapper;
import com.at.apcss.demo.web.AiController;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AiService {
    private final AiMapper aiMapper;
    private final RealGeminiApiService realGeminiApiService;

    private static final Logger log = LoggerFactory.getLogger(AiController.class);


    // --- 가상의 의존성 주입 ---
    // 이 예시에서는 실제 구현 대신 print문으로 대체합니다.
    private class ApcRepository {
        public List<Map<String, String>> findByName(String name) throws Exception{
            System.out.printf("DB 조회: 'TB_APC_EVRMNT_STNG'에서 '%s' 검색...\n", name);
            List<Map<String, String>> result = aiMapper.findByName(name);
            return result;
//            if (name.contains("거산")) {
//                // 1. 결과가 1건일 때 시뮬레이션
//                // return List.of(Map.of("APC_CD", "A123", "APC_NM", "거산유통"));
//
//                // 2. 결과가 여러 건일 때 시뮬레이션
//                return List.of(
//                        Map.of("APC_CD", "A123", "APC_NM", "거산유통"),
//                        Map.of("APC_CD", "B456", "APC_NM", "거산인삼")
//                );
//            }
//            return List.of();
        }
        public Map<String, Object> getPerformance(String apcCode, String type, String start, String end) {
            System.out.printf("DB 조회: 'DAILY_RECORDS'에서 %s, %s, %s, %s 검색...\n", apcCode, type, start, end);
            return Map.of("total_kg", 15200, "unit", "kg");
        }
    }
    private class GoogleSearchService {
        public String search(String query) {
            System.out.printf("Google Search API 호출: 쿼리='%s'\n", query);
            return "오늘 나주 날씨는 맑고 쾌적하며, 최고 기온은 22도입니다.";
        }
    }
    // --- 가상 의존성 객체 생성 ---
    private ApcRepository apcRepository = new ApcRepository();
    private GoogleSearchService googleSearchService = new GoogleSearchService();
    // ---

    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * React로부터 받은 요청을 처리하는 메인 지휘(Orchestration) 메소드
     */
    public String handleAiRequest(String userPrompt, List<Map<String, Object>> tools) {

        System.out.println("--- [1단계] 1차 AI 호출 시작 ---");
        // 1. 1차 AI 호출 (의도 분석)
        String responseJson1 = realGeminiApiService.callGemini(userPrompt, tools);

        try {
            // 2. AI 응답 파싱
            JsonNode rootNode = objectMapper.readTree(responseJson1);
            JsonNode functionCallNode = rootNode.path("candidates").get(0)
                    .path("content").path("parts").get(0)
                    .path("functionCall");

            // 3. "핵심 분기 모듈" (Decision Logic)
            if (functionCallNode.isMissingNode()) {
                // --- 경로 A: 일반 텍스트 응답 (도구 불필요) ---
                System.out.println("AI가 [일반 텍스트] 응답 생성.");
                return rootNode.path("candidates").get(0)
                        .path("content").path("parts").get(0)
                        .path("text").asText("죄송합니다. 요청을 처리할 수 없습니다.");
            }

            String functionName = functionCallNode.path("name").asText();
            JsonNode args = functionCallNode.path("args");
            System.out.printf("AI가 [도구 선택]: %s\n", functionName);

            // 4. 선택된 도구에 따라 작업 분기
            switch (functionName) {
                case "findApcByName":
                    // --- 경로 B: APC 이름 검색 (다단계 로직 시작) ---
                    return handleFindApcByName(args.path("apc_name").asText(), userPrompt, tools);

                case "getApcPerformance":
                    // --- 경로 C: APC 실적 조회 (직접 실행) ---
                    return handleGetApcPerformance(args);

                case "google_search":
                    // --- 경로 D: Google 검색 (일반 검색) ---
                    return handleGoogleSearch(args.path("query").asText());

                default:
                    return "오류: 알 수 없는 도구가 호출되었습니다.";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "오류: AI 응답을 처리하는 중 문제가 발생했습니다.";
        }
    }

    /**
     * [분기점 1] APC 이름으로 검색 후, 결과에 따라 다음 행동 결정
     */
    private String handleFindApcByName(String apcName, String originalPrompt, List<Map<String, Object>> tools) throws Exception {

        System.out.println("--- [2단계] DB 조회 (findApcByName) ---");
        List<Map<String, String>> apcs = apcRepository.findByName(apcName);

        if (apcs.size() == 1) {
            // --- [분기점 1-A: 1건 발견] ---
            // "다시 원래 프롬프트를 호출"하는 로직
            System.out.println("DB 결과: 1건 발견. 2차 AI 호출로 연결합니다.");
            String apcCode = apcs.get(0).get("APC_CD");
            String apcFullName = apcs.get(0).get("APC_NM");

            // 2차 AI 호출을 위한 새로운, 더 명확한 프롬프트 생성
            String secondPrompt = String.format(
                    "사용자의 원래 질문은 '%s'였습니다. " +
                            "해당 APC의 정확한 이름은 '%s'이고 코드는 '%s'임을 확인했습니다. " +
                            "이제 이 정보를 바탕으로 사용자의 실적 조회 의도를 파악하여 'getApcPerformance' 도구를 호출할 JSON을 생성해주세요.",
                    originalPrompt, apcFullName, apcCode
            );

            System.out.println("--- [3단계] 2차 AI 호출 시작 ---");
            String responseJson2 = realGeminiApiService.callGemini(secondPrompt, tools);

            // 1. AI 응답에서 '첫 번째 파트'를 안전하게 추출합니다.
            // path(0)는 get(0)와 달리, 요소가 없어도 에러를 발생시키지 않고 'MissingNode'를 반환합니다.
            JsonNode firstPart = objectMapper.readTree(responseJson2)
                    .path("candidates")
                    .path(0) // Safe: candidates 배열이 비어있어도 OK
                    .path("content")
                    .path("parts")
                    .path(0); // Safe: parts 배열이 비어있어도 OK

            // 2. '첫 번째 파트'가 유효한지 먼저 확인합니다.
            if (firstPart.isMissingNode() || firstPart.isEmpty()) {
                log.warn("2차 AI 응답이 비어있거나 유효하지 않습니다. 응답: {}", responseJson2);
                return "오류: AI로부터 유효한 응답을 받지 못했습니다.";
            }

            // 3. "Happy Path": 'functionCall'이 존재하는지 확인합니다.
            JsonNode functionCallNode = firstPart.path("functionCall");

            if (!functionCallNode.isMissingNode()) {
                // [성공 경로] functionCall이 존재합니다.

                if ("getApcPerformance".equals(functionCallNode.path("name").asText())) {
                    // 우리가 기대한 'getApcPerformance' 도구가 맞습니다.
                    System.out.println("2차 AI가 'getApcPerformance' 도구를 선택했습니다.");
                    return handleGetApcPerformance(functionCallNode.path("args"));
                } else {
                    // [예외 경로] AI가 엉뚱한 도구를 선택했습니다.
                    String unexpectedFunction = functionCallNode.path("name").asText("알 수 없는 함수");
                    log.warn("2차 AI가 예상치 못한 도구({})를 호출했습니다.", unexpectedFunction);
                    return String.format("오류: AI가 예상치 못한 작업(%s)을 시도했습니다.", unexpectedFunction);
                }

            } else if (!firstPart.path("text").isMissingNode()) {
                // [되묻기 경로] functionCall은 없지만, 'text' 응답이 존재합니다.
                // 이것이 바로 AI가 "정보가 부족합니다"라고 되묻는 정상적인 경로입니다.
                System.out.println("2B. 2차 AI가 functionCall 대신 텍스트 응답을 반환했습니다. (정보 부족)");

                // .toString()은 따옴표까지 포함하므로, .asText()를 사용해야 순수한 문자열을 가져옵니다.
                return firstPart.path("text").asText();

            } else {
                // [완전 실패 경로] 'functionCall'도, 'text'도 없는 알 수 없는 응답입니다.
                log.error("2차 AI 응답에 'functionCall'과 'text'가 모두 없습니다. 응답: {}", firstPart.toString());
                return "오류: AI의 응답을 이해할 수 없습니다. (내용 없음)";
            }

        } else if (apcs.size() > 1) {
            // --- [분기점 1-B: 여러 건 발견] ---
            System.out.println("DB 결과: 여러 건 발견. 사용자에게 선택지를 제시합니다.");
            StringBuilder choiceList = new StringBuilder("어떤 APC를 말씀하시는 건가요? \n");
            for (int i = 0; i < apcs.size(); i++) {
                choiceList.append(String.format("%d. %s (코드: %s)\n", i + 1, apcs.get(i).get("APC_NM"), apcs.get(i).get("APC_CD")));
            }
            return choiceList.toString();

        } else {
            // --- [분기점 1-C: 0건 발견] ---
            System.out.println("DB 결과: 0건 발견.");
            return String.format("'%s'이라는 이름을 가진 APC를 찾을 수 없습니다.", apcName);
        }
    }

    /**
     * [최종 행동 1] APC 실적 DB 조회 및 결과 요약
     */
    private String handleGetApcPerformance(JsonNode args) {
        System.out.println("--- [최종 단계] DB 조회 (getApcPerformance) ---");
        String apcCode = args.path("apc_code").asText();
        String type = args.path("performance_type").asText();
        String start = args.path("start_date").asText();
        String end = args.path("end_date").asText();
        String apcName = args.path("apc_name").asText();

        Map<String, Object> result = apcRepository.getPerformance(apcCode, type, start, end);

        // 3차 AI 호출 (결과 요약)을 여기서 하거나,
        // 지금은 간단히 문자열을 조합하여 반환합니다.
        return String.format(
                "%s[%s]의 %s부터 %s까지 %s 입고실적은 총 %,d%s 입니다.",
                apcName, apcCode, start, end, type,
                (Integer)result.get("total_kg"), result.get("unit")
        );
    }

    /**
     * [최종 행동 2] Google 검색 수행 및 결과 반환
     */
    private String handleGoogleSearch(String query) {
        System.out.println("--- [최종 단계] Google Search API 호출 ---");
        String searchResult = googleSearchService.search(query);
        // 이것도 3차 AI 호출로 요약할 수 있지만, 지금은 그대로 반환
        return searchResult;
    }
}