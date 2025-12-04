// src/main/java/com/apcmngsys/apcss/demo/service/AiService.java
package com.apcmngsys.apcss.demo.service;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
public interface AiService {
    /**
     * React로부터 받은 요청을 처리하는 메인 지휘(Orchestration) 메소드
     * @param userPrompt 사용자 프롬프트
     * @param tools AI 도구 목록
     * @param session 세션 (권한 체크용)
     * @return AI 응답 결과
     */
    String handleAiRequest(String userPrompt, List<Map<String, Object>> tools, Map<String, String> context, HttpSession session) throws Exception;
}