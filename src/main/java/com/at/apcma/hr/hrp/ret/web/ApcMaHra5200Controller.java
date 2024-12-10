package com.at.apcma.hr.hrp.ret.web;

import com.at.apcma.com.service.ApcMaComService;
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
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 중간/퇴직급여 계산 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.07.16
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 퇴직소득원천징수영수증 (Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.07.16  표주완     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHra5200Controller extends BaseController {

    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;

    // 퇴직소득원천징수영수증 조회
    @PostMapping(value = "/hr/hrp/ret/selectHra5200List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHra5200List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHra5200List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {

            param.put("procedure", "P_HRA5200_2022_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
			//self url 편집
			String f_path1 = request.getRequestURL().toString();
			String f_path2 = request.getRequestURI().toString();
			String f_path3 = f_path1.replaceAll(f_path2, "");
			resultMap.put("SEVER_ROOT_PATH", f_path3);

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHra5200List=====end========");
        return getSuccessResponseEntityMa(resultMap);

    }


}
