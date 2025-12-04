package com.apcmngsys.apcss.fm.fclt.web;

import com.apcmngsys.apcss.co.constants.ComConstants;
import com.apcmngsys.apcss.co.sys.controller.BaseController;
import com.apcmngsys.apcss.fm.fclt.service.ApcCmsuSrvyService;
import com.apcmngsys.apcss.fm.fclt.vo.ApcCmsuSrvyRsltVO;
import com.apcmngsys.apcss.fm.fclt.vo.ApcCmsuSrvyVO;
import com.apcmngsys.apcss.fm.fclt.vo.FcltOperInfoVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : ApcCmsuSrvyController.java
 * @Description : APC전수조사 설문조사 Controller 클래스
 * @author
 * @since 2025.10.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  	----------  ---------------------------
 * 2025.10.13	유민지       최초 생성
 * </pre>
 */
@Controller
public class ApcCmsuSrvyController extends BaseController {
    @Resource(name= "apcCmsuSrvyService")
    private ApcCmsuSrvyService apcCmsuSrvyService;

    @PostMapping(value = "/fm/fclt/selectSrvyMst.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSrvyMst (Model model, @RequestBody ApcCmsuSrvyVO apcCmsuSrvyVO, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        ApcCmsuSrvyVO srvyInfo = new ApcCmsuSrvyVO();

        try {
            srvyInfo = apcCmsuSrvyService.selectSrvyMst(apcCmsuSrvyVO);
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_MAP, srvyInfo);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/fm/fclt/selectSrvyDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSrvyDtl (Model model, @RequestBody ApcCmsuSrvyVO apcCmsuSrvyVO, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        List<ApcCmsuSrvyVO> resultList = new ArrayList<>();

        try {
            resultList = apcCmsuSrvyService.selectSrvyDtl(apcCmsuSrvyVO);
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/fm/fclt/selectSrvyApcRsltDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSrvyApcRsltDtl (Model model, @RequestBody ApcCmsuSrvyRsltVO apcCmsuSrvyRsltVO, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        List<ApcCmsuSrvyRsltVO> resultList = new ArrayList<>();

        try {
            resultList = apcCmsuSrvyService.selectSrvyApcRsltDtl(apcCmsuSrvyRsltVO);
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/fm/fclt/saveApcCmsuSrvy.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> saveApcCmsuSrvy(@RequestBody ApcCmsuSrvyVO apcCmsuSrvyVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();

        // audit 항목
        apcCmsuSrvyVO.setSysFrstInptUserId(getUserId());
        apcCmsuSrvyVO.setSysFrstInptPrgrmId(getPrgrmId());
        apcCmsuSrvyVO.setSysLastChgUserId(getUserId());
        apcCmsuSrvyVO.setSysLastChgPrgrmId(getPrgrmId());

        try {
            HashMap<String, Object> rtnObj = apcCmsuSrvyService.saveApcCmsuSrvy(apcCmsuSrvyVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }  catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }
}
