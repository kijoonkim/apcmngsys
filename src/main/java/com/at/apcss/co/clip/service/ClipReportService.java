package com.at.apcss.co.clip.service;


import com.at.apcss.co.clip.vo.ClipReportVO;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 클립리포트 Service 인터페이스
 * @author 신정철
 * @since 2024.09.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.20  신정철       최초 생성
 * </pre>
 */
public interface ClipReportService {

    public HashMap<String, Object> sendMailForPdfByJson(
            @RequestBody Map<String, Object> params, HttpServletRequest request, ClipReportVO clipReportVO
    ) throws Exception;

    public HashMap<String, Object> sendEmsMailForPdfByJson(
            @RequestBody Map<String, Object> params, HttpServletRequest request, ClipReportVO clipReportVO
    ) throws Exception;


}
