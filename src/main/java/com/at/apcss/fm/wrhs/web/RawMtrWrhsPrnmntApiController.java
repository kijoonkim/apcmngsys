package com.at.apcss.fm.wrhs.web;


import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.wrhs.service.RawMtrWrhsPrnmntService;
import com.at.apcss.fm.wrhs.vo.RawMtrWrhsPrnmntVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : RawMtrWrhsPrnmntApiController.java
 * @Description : 원물입고예정 대한 ApiController 클래스
 * @author 윤 필 호
 * @since 2024.09.02
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.02  윤필호        최초 생성
 * </pre>
 */

@RestController
public class RawMtrWrhsPrnmntApiController extends BaseController {
    @Resource(name = "rawMtrWrhsPrnmntService")
    private RawMtrWrhsPrnmntService rawMtrWrhsPrnmntService;

    //입고실적예정 조회
    @PostMapping(value = "/api/mobile/fm/wrhs/selectRawMtrWrhsPrnmntList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsPrnmntList(@RequestBody RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<RawMtrWrhsPrnmntVO> resultList;
        try {
            resultList = rawMtrWrhsPrnmntService.selectRawMtrWrhsPrnmntList(rawMtrWrhsPrnmntVO);
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    //입고실적예정 삭제
    @PostMapping(value = "/api/mobile/fm/wrhs/deleteRawMtrWrhsPrnmnt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteRawMtrWrhsPrnmnt(@RequestBody RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> result = new HashMap<String, Object>();

        try {
            result = rawMtrWrhsPrnmntService.deleteRawMtrWrhsPrnmnt(rawMtrWrhsPrnmntVO);

        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put("result", result);
        return getSuccessResponseEntity(resultMap);
    }

    //모바일 입고예정 INSERT
    @PostMapping(value = "/api/mobile/fm/wrhs/insertRawMtrWrhsPrnmnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertRawMtrWrhsPrnmnt(@RequestBody RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            HashMap<String, Object> rtnObj = rawMtrWrhsPrnmntService.insertRawMtrWrhsPrnmnt(rawMtrWrhsPrnmntVO);

            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());

            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);

            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_MAP, rawMtrWrhsPrnmntVO);

        return getSuccessResponseEntity(resultMap);
    }
}
