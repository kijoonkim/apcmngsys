package com.at.apcss.co.mng.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.mng.service.ComMngService;
import com.at.apcss.co.mng.vo.ComMenuLogHstryVO;
import com.at.apcss.co.mng.vo.ComUserVO;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : ComMngController.java
 * @Description : 시스템현황에 대한 Controller 클래스
 * @author 김은총
 * @since 2025.04.09
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.04.09  김은총        최초 생성
 *      </pre>
 */
@Controller
public class ComMngController extends BaseController {

    @Resource(name = "comMngService")
    private ComMngService comMngService;


    // 사용자 및 트래픽 조회
    @PostMapping(value = "/co/mng/selectVstrCnt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectVstrCnt(@RequestBody ComMenuLogHstryVO comMenuLogHstryVO, HttpServletRequest request) throws  Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ComMenuLogHstryVO> resultList = new ArrayList<>();

        try {
            resultList = comMngService.selectVstrCnt(comMenuLogHstryVO);
        } catch (Exception e) {
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/co/mng/selectPageViewCnt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectPageViewCnt(@RequestBody ComMenuLogHstryVO comMenuLogHstryVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ComMenuLogHstryVO> resultList = new ArrayList<>();

        try {
            resultList = comMngService.selectPageViewCnt(comMenuLogHstryVO);
        } catch (Exception e) {
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/co/mng/selectUserCnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectUserCnt(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ComUserVO> resultList = new ArrayList<>();

        try {
            resultList = comMngService.selectUserCnt(comUserVO);
        } catch (Exception e) {
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/co/mng/selectOgnzPrstCnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectOgnzPrstCnt(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ComUserVO> resultList = new ArrayList<>();

        try {
            resultList = comMngService.selectOgnzPrstCnt(comUserVO);
        } catch (Exception e) {
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/co/mng/selectOgnzTaskMbrCnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectOgnzTaskMbrCnt(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ComUserVO> resultList = new ArrayList<>();

        try {
            resultList = comMngService.selectOgnzTaskMbrCnt(comUserVO);
        } catch (Exception e) {
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }
}
