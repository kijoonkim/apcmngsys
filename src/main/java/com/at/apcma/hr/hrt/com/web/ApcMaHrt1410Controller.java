package com.at.apcma.hr.hrt.com.web;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaComUtil;
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
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 근무조 정보 (사원편성)를 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.06.03
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 인사정보 등록 >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2024.06.03  이경한     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaHrt1410Controller extends BaseController {
    @Resource(name= "apcMaCommDirectService")
    private ApcMaCommDirectService apcMaCommDirectService;

    @Resource(name= "apcMaComService")
    private ApcMaComService apcMaComService;

    @PostMapping(value = "/hr/hrt/com/selectHrt1410List.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectHrt1410List(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============selectHrt1410List=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            param.put("procedure", 		"P_HRT1410_Q");
            resultMap = apcMaCommDirectService.callProc(param, session, request, "");

            if(param.get("workType").equals("LIST")) {
                List<Map<String, Object>> listData = (List<Map<String, Object>>) resultMap.get("cv_1");
                if(listData.size() > 0) {
                    Map<String, Map<String, Object>> deptMap = listData.stream()
                            .collect(Collectors.toMap(dept -> (String) dept.get("KEYID"), dept -> dept));

                    List<Map<String, Object>> sortedDepartments = new ArrayList<>();
                    listData.stream()
                            .filter(dept -> !dept.containsKey("PARENTKEYID") || !deptMap.containsKey(dept.get("PARENTKEYID")))
                            .forEach(dept -> ApcMaComUtil.buildTree(dept, deptMap, sortedDepartments, 0));

                    resultMap.put("cv_1", sortedDepartments);
                }
            }

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        logger.info("=============selectHrt1410List=====end========");
        if(resultMap.get("resultStatus").equals("E")) {
            String errorCode = Optional.ofNullable(resultMap.get("v_errorCode")).orElse("").toString();
            String errorStr = Optional.ofNullable(resultMap.get("resultMessage")).orElse("").toString();

            return getErrorResponseEntity(errorCode, errorStr);
        } else {
            return getSuccessResponseEntity(resultMap);
        }
    }

    @PostMapping(value = "/hr/hrt/com/insertHrt1410Emp.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrt1410Emp(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrt1410Emp=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "P_HRT1410_S1");

            logger.info("=============insertHrt5200List=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

    }

    @PostMapping(value = "/hr/hrt/com/insertHrt1410Patten.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertHrt1410Patten(
            @RequestBody Map<String, Object> param
            , Model model
            , HttpSession session
            , HttpServletRequest request) throws Exception{

        logger.info("=============insertHrt1410Patten=====start========");
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", "P_HRT1410_S2");

            logger.info("=============insertHrt5200List=====end========");
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }
    }

}
