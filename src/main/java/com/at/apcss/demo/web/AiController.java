package com.apcmngsys.apcss.demo.web;

import com.apcmngsys.apcss.co.sys.vo.LoginVO;
import com.apcmngsys.apcss.demo.service.AiService;
import com.apcmngsys.apcss.demo.vo.AiRequestDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class AiController {
    private static final Logger log = LoggerFactory.getLogger(AiController.class);

    @Autowired
    private AiService aiService;

    @PostMapping("/ask-ai") // 5. 이제 클래스의 /api와 조합되어 /api/ask-ai 가 됩니다.
    public Map<String, String> askAi(@RequestBody AiRequestDto requestDto, HttpServletRequest request) throws Exception { // 6. @RequestParam 대신 @RequestBody를 사용합니다!
        log.info("React로부터 받은 프롬프트: {}", requestDto.getPrompt());

        // 4. 서비스 클래스의 메소드를 호출하여 Gemini API와 통신합니다.
        String prompt = requestDto.getPrompt();
        List<Map<String, Object>> tools = requestDto.getTools();
        Map<String, String> context = (Map<String, String>) requestDto.getContext();
        HttpSession session = request.getSession();

        LoginVO loginVO = (LoginVO) session.getAttribute("loginVO");

        String sessionApcCd = loginVO.getApcCd();
        String sessionApcNm = loginVO.getApcNm();

        // 컨텍스트 검증
        if (context == null || !sessionApcCd.equals(context.get("apcCd"))) {
            log.warn("권한 오류: 세션 APC={}, 요청 APC={}", sessionApcCd, context != null ? context.get("apcCd") : "null");
            return Map.of("answer", "해당 APC에 대한 권한이 없습니다.");
        }

        if (loginVO == null) {
            return Map.of("answer", "로그인이 필요합니다.");
        }

        String enrichedPrompt = String.format(
                "[시스템 컨텍스트]\n" +
                        "현재 로그인 APC: %s (코드: %s)\n" +
                        "사용자가 APC명을 명시하지 않은 모든 질문은 이 APC에 대한 것으로 간주합니다.\n" +
                        "실적 조회 시 apc_code와 apc_name이 비어있다면 위 정보를 사용하세요.\n\n" +
                        "[사용자 질문]\n%s",
                sessionApcNm,
                sessionApcCd,
                prompt
        );


        String geminiResponse = aiService.handleAiRequest(enrichedPrompt, tools, context, session);

        log.info("Gemini로부터 받은 응답: {}", geminiResponse);

        Map<String, String> jsonResponse = new HashMap<>();
        jsonResponse.put("answer", geminiResponse);

        // 5. Gemini API의 응답을 그대로 React 클라이언트에게 전달합니다.
        return jsonResponse;
    }


}
