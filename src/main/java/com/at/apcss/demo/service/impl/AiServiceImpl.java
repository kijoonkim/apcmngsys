// src/main/java/com/at/apcss/demo/service/impl/AiServiceImpl.java
package com.at.apcss.demo.service.impl;

import com.at.apcss.co.sys.vo.LoginVO;
import com.at.apcss.demo.mapper.AiMapper;
import com.at.apcss.demo.service.AiService;
import com.at.apcss.demo.service.RealGeminiApiService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AiServiceImpl implements AiService {

    private final AiMapper aiMapper;
    private final RealGeminiApiService realGeminiApiService;
    private static final Logger log = LoggerFactory.getLogger(AiServiceImpl.class);
    private final ObjectMapper objectMapper = new ObjectMapper();

    // --- 가상의 의존성 주입 ---
    private class ApcRepository {
        public List<HashMap<String, String>> findByName(String name) throws Exception {
            System.out.printf("DB 조회: 'TB_APC_EVRMNT_STNG'에서 '%s' 검색...\n", name);
            List<HashMap<String, String>> result = aiMapper.findByName(name);
            return result;
        }

        public List<HashMap<String, Object>> getPerformance(String apcCode, List<String> typeCodes, String start, String end) throws Exception {
            System.out.printf("DB 조회: 실적 테이블에서 %s, %s, %s ~ %s 검색...\n", apcCode, typeCodes, start, end);
            List<HashMap<String, Object>> result = aiMapper.getPerformance(apcCode, typeCodes, start, end);
            return result;
        }
    }

    private class GoogleSearchService {
        public String search(String query) {
            System.out.printf("Google Search API 호출: 쿼리='%s'\n", query);
            return "오늘 나주 날씨는 맑고 쾌청하며, 최고 기온은 22도입니다.";
        }
    }

    private ApcRepository apcRepository = new ApcRepository();
    private GoogleSearchService googleSearchService = new GoogleSearchService();

    @Override
    public String handleAiRequest(String userPrompt, List<Map<String, Object>> tools, Map<String, String> context, HttpSession session) {

        System.out.println("--- [1단계] 1차 AI 호출 시작 ---");
        String responseJson1 = realGeminiApiService.callGemini(userPrompt, tools);

        try {
            JsonNode rootNode = objectMapper.readTree(responseJson1);
            JsonNode functionCallNode = rootNode.path("candidates").get(0)
                    .path("content").path("parts").get(0)
                    .path("functionCall");

            if (functionCallNode.isMissingNode()) {
                System.out.println("AI가 [일반 텍스트] 응답 생성.");
                return rootNode.path("candidates").get(0)
                        .path("content").path("parts").get(0)
                        .path("text").asText("죄송합니다. 요청을 처리할 수 없습니다.");
            }

            String functionName = functionCallNode.path("name").asText();
            JsonNode args = functionCallNode.path("args");
            System.out.printf("AI가 [도구 선택]: %s\n", functionName);

            switch (functionName) {
                case "findApcByName":
                    return handleFindApcByName(args.path("apc_name").asText(), userPrompt, tools, context, session);

                case "getApcPerformance":
                    return handleGetApcPerformance(args, context, session);

                case "google_search":
                    return handleGoogleSearch(args.path("query").asText());

                default:
                    return "오류: 알 수 없는 도구가 호출되었습니다.";
            }

        } catch (Exception e) {
            log.error("AI 응답 처리 중 오류 발생", e);
            return "오류: AI 응답을 처리하는 중 문제가 발생했습니다.";
        }
    }

    /**
     * [분기점 1] APC 이름으로 검색 후, 결과에 따라 다음 행동 결정
     */
    private String handleFindApcByName(String apcName, String originalPrompt, List<Map<String, Object>> tools, Map<String, String> context, HttpSession session) throws Exception {

        System.out.println("--- [2단계] DB 조회 (findApcByName) ---");
        List<HashMap<String, String>> apcs = apcRepository.findByName(apcName);

        if (apcs.size() == 1) {
            System.out.println("DB 결과: 1건 발견. 2차 AI 호출로 연결합니다.");
            String apcCode = apcs.get(0).get("APC_CD");
            String apcFullName = apcs.get(0).get("APC_NM");

            // ===== 권한 체크 추가 =====
            LoginVO loginVO = (LoginVO) session.getAttribute("loginVO");
            String sessionApcCd = loginVO.getApcCd();

            if (sessionApcCd == null) {
                log.warn("세션에 USER_APC_CD가 없습니다.");
                return "세션이 만료되었습니다. 다시 로그인해주세요.";
            }

            if (!apcCode.equals(sessionApcCd)) {
                log.warn("권한 없는 APC 접근 시도: 요청={}, 세션={}", apcCode, sessionApcCd);
                return String.format("'%s'에 대한 조회 권한이 없습니다. 현재 로그인한 APC의 정보만 확인 가능합니다.", apcFullName);
            }
            // ===== 권한 체크 끝 =====

            String secondPrompt = String.format(
                    "사용자의 원래 질문은 '%s'였습니다. " +
                            "해당 APC의 정확한 이름은 '%s'이고 코드는 '%s'임을 확인했습니다. " +
                            "이제 이 정보를 바탕으로 사용자의 실적 조회 의도를 파악하여 'getApcPerformance' 도구를 호출할 JSON을 생성해주세요.",
                    originalPrompt, apcFullName, apcCode
            );

            System.out.println("--- [3단계] 2차 AI 호출 시작 ---");
            String responseJson2 = realGeminiApiService.callGemini(secondPrompt, tools);

            JsonNode firstPart = objectMapper.readTree(responseJson2)
                    .path("candidates")
                    .path(0)
                    .path("content")
                    .path("parts")
                    .path(0);

            if (firstPart.isMissingNode() || firstPart.isEmpty()) {
                log.warn("2차 AI 응답이 비어있거나 유효하지 않습니다. 응답: {}", responseJson2);
                return "오류: AI로부터 유효한 응답을 받지 못했습니다.";
            }

            JsonNode functionCallNode = firstPart.path("functionCall");

            if (!functionCallNode.isMissingNode()) {
                if ("getApcPerformance".equals(functionCallNode.path("name").asText())) {
                    System.out.println("2차 AI가 'getApcPerformance' 도구를 선택했습니다.");
                    return handleGetApcPerformance(functionCallNode.path("args"), context, session);
                } else {
                    String unexpectedFunction = functionCallNode.path("name").asText("알 수 없는 함수");
                    log.warn("2차 AI가 예상치 못한 도구({})를 호출했습니다.", unexpectedFunction);
                    return String.format("오류: AI가 예상치 못한 작업(%s)을 시도했습니다.", unexpectedFunction);
                }

            } else if (!firstPart.path("text").isMissingNode()) {
                System.out.println("2차 AI가 functionCall 대신 텍스트 응답을 반환했습니다. (정보 부족)");
                return firstPart.path("text").asText();

            } else {
                log.error("2차 AI 응답에 'functionCall'과 'text'가 모두 없습니다. 응답: {}", firstPart.toString());
                return "오류: AI의 응답을 이해할 수 없습니다. (내용 없음)";
            }

        } else if (apcs.size() > 1) {
            System.out.println("DB 결과: 여러 건 발견. 사용자에게 선택지를 제시합니다.");
            StringBuilder choiceList = new StringBuilder("어떤 APC를 말씀하시는 건가요? \n");
            for (int i = 0; i < apcs.size(); i++) {
                choiceList.append(String.format("%d. %s (코드: %s)\n", i + 1, apcs.get(i).get("APC_NM"), apcs.get(i).get("APC_CD")));
            }
            return choiceList.toString();

        } else {
            System.out.println("DB 결과: 0건 발견.");
            return String.format("'%s'이라는 이름을 가진 APC를 찾을 수 없습니다.", apcName);
        }
    }

    /**
     * [최종 행동 1] APC 실적 DB 조회 및 결과 요약
     */
    private String handleGetApcPerformance(JsonNode args, Map<String, String> context, HttpSession session) {
        System.out.println("--- [최종 단계] DB 조회 (getApcPerformance) ---");

        String apcCode = args.path("apc_code").asText();

        Map<String, String> typeMap = Map.of(
                "입고", "01",
                "선별", "02",
                "출하", "03"
        );

        JsonNode typesNode = args.path("performance_types");
        List<String> typeCodes = new ArrayList<>();

        if (typesNode.isArray()) {
            for (JsonNode typeNode : typesNode) {
                String korType = typeNode.asText();
                String code = typeMap.get(korType);
                if (code != null) {
                    typeCodes.add(code);
                }
            }
        }

        if (apcCode == null || apcCode.isEmpty()) {
            apcCode = context.get("apcCd");
            log.info("apc_code 미지정, 컨텍스트 사용: {}", apcCode);
        }

        String start = args.path("start_date").asText();
        String end = args.path("end_date").asText();
        String apcName = args.path("apc_name").asText();

        // ===== 권한 체크 추가 (이중 안전장치) =====
        LoginVO loginVO = (LoginVO) session.getAttribute("loginVO");
        String sessionApcCd = loginVO.getApcCd();

        if (sessionApcCd == null) {
            log.warn("세션에 USER_APC_CD가 없습니다.");
            return "세션이 만료되었습니다. 다시 로그인해주세요.";
        }

        if (!apcCode.equals(sessionApcCd)) {
            log.warn("권한 없는 APC 실적 조회 시도: 요청={}, 세션={}", apcCode, sessionApcCd);
            return String.format("'%s'에 대한 조회 권한이 없습니다.", apcName);
        }
        // ===== 권한 체크 끝 =====
        System.out.println(apcCode + " << : apcCode" + typeCodes + " << : type" + start + "from" + end + "end");

        List<HashMap<String, Object>> result = new ArrayList<>();
        try {
            result = apcRepository.getPerformance(apcCode, typeCodes, start, end);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        StringBuilder response = new StringBuilder();
        response.append(String.format("%s의 %s ~ %s\n", apcName, start, end));

        if(result.size() > 0){
            for (HashMap<String, Object> row : result) {
                String typeName = (String) row.get("TYPE_NM");  // "입고", "선별", "출하"
                Integer wght = ((Number) row.get("WGHT")).intValue();  // 중량
                Integer qntt = ((Number) row.get("QNTT")).intValue();  // 수량
                Integer cnt = ((Number) row.get("CNT")).intValue();    // 건수

                response.append(String.format("- %s: 중량 %,dkg, 수량 %,d개, 건수 %,d건\n",
                        typeName, wght, qntt, cnt));
            }
        }else{
                response.append(String.format("실적이없습니다."));
        }


        return response.toString();

    }

    /**
     * [최종 행동 2] Google 검색 수행 및 결과 반환
     */
    private String handleGoogleSearch(String query) {
        System.out.println("--- [최종 단계] Google Search API 호출 ---");
        String searchResult = googleSearchService.search(query);
        return searchResult;
    }
}