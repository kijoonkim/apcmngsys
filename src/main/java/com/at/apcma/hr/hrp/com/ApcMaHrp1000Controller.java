package com.at.apcma.hr.hrp.com;

import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 개인급여 정보 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.05.23
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 개인급여 정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.05.23  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHrp1000Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;


    // 관리번호 채번 정보 조회
    @PostMapping(value = "/hr/hrp/com/selectHrp1000List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrp1000List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrp1000List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRP1000_Q");
            resultMap = apcMaCommDirectService.callProc(param, request.getMethod(), "");

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrp1000List=====end========");
        return getSuccessResponseEntity(resultMap);
    }


}
