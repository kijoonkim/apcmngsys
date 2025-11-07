package com.at.apcss.demo.web;

import com.at.apcss.demo.service.AiService;
import com.at.apcss.demo.vo.AiRequestDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
    public Map<String, String> askAi(@RequestBody AiRequestDto requestDto) { // 6. @RequestParam 대신 @RequestBody를 사용합니다!
        log.info("React로부터 받은 프롬프트: {}", requestDto.getPrompt());

        // 4. 서비스 클래스의 메소드를 호출하여 Gemini API와 통신합니다.
        String prompt = requestDto.getPrompt();
        List<Map<String, Object>> tools = requestDto.getTools();
        String geminiResponse = aiService.handleAiRequest(prompt, tools);

        log.info("Gemini로부터 받은 응답: {}", geminiResponse);

        Map<String, String> jsonResponse = new HashMap<>();
        jsonResponse.put("answer", geminiResponse);

        // 5. Gemini API의 응답을 그대로 React 클라이언트에게 전달합니다.
        return jsonResponse;
    }


}
