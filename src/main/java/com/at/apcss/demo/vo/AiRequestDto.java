package com.at.apcss.demo.vo;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@Getter
@Setter
public class AiRequestDto {
    private String prompt;
    private List<Map<String, Object>> tools;
    private Map<String, String> context;

}