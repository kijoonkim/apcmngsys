package com.at.apcss.am.wgh.web;

import com.at.apcss.am.wgh.service.WghMngService;
import com.at.apcss.am.wgh.vo.WghFcltDtlVO;
import com.at.apcss.am.wgh.vo.WghFcltVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class WghMngController extends BaseController {

    @Resource(name = "wghMngService")
    private WghMngService wghMngService;

    @PostMapping(value = "/am/wgh/selectWghFclt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectWghFclt(@RequestBody WghFcltVO wghFcltVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<WghFcltVO> resultList;
        try {
            resultList = wghMngService.selectWghFclt(wghFcltVO);
        } catch (Exception e) {
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

    @PostMapping(value = "/am/wgh/deleteWghApcFclt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> deleteWghApcFclt(@RequestBody WghFcltVO wghFcltVO, HttpServletRequest request) throws Exception{
        int resultCnt = 0;
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            resultCnt = wghMngService.deleteWghApcFclt(wghFcltVO);

        } catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_DELETED_CNT,resultCnt);
        return getSuccessResponseEntity(resultMap);
    }
    @PostMapping(value = "/am/wgh/deleteWghApcFcltDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> deleteWghApcFcltDtl(@RequestBody WghFcltDtlVO wghFcltDtlVO, HttpServletRequest request) throws Exception{
        int resultCnt = 0;
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            resultCnt = wghMngService.deleteWghApcFcltDtl(wghFcltDtlVO);

        } catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_DELETED_CNT,resultCnt);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/am/wgh/insertWghApcFclt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertWghApcFclt(@RequestBody WghFcltVO wghFcltVO, HttpServletRequest request) throws Exception{
        int resultCnt = 0;
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            /** 공통정보 셋팅 **/
            wghFcltVO.setDelYn("N");
            wghFcltVO.setSysFrstInptUserId(getUserId());
            wghFcltVO.setSysFrstInptPrgrmId(getPrgrmId());
            wghFcltVO.setSysLastChgUserId(getUserId());
            wghFcltVO.setSysLastChgPrgrmId(getPrgrmId());

            List<WghFcltDtlVO> dtlList = wghFcltVO.getWghFcltDtlVO();

            for(WghFcltDtlVO vo : dtlList){
                vo.setDelYn("N");
                vo.setSysFrstInptUserId(getUserId());
                vo.setSysFrstInptPrgrmId(getPrgrmId());
                vo.setSysLastChgUserId(getUserId());
                vo.setSysLastChgPrgrmId(getPrgrmId());
            }

            resultCnt = wghMngService.insertWghApcFclt(wghFcltVO);

        } catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_INSERTED_CNT,resultCnt);
        return getSuccessResponseEntity(resultMap);
    }
    @PostMapping(value = "/am/wgh/updateWghApcFclt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updateWghApcFclt(@RequestBody WghFcltVO wghFcltVO, HttpServletRequest request) throws Exception {
        int resultCnt = 0;
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            List<WghFcltDtlVO> dtlList = wghFcltVO.getWghFcltDtlVO();
            String fcltCd = wghFcltVO.getFcltCd();

            /** 최종 수정일자 **/
            wghFcltVO.setSysLastChgUserId(getUserId());
            wghFcltVO.setSysLastChgPrgrmId(getPrgrmId());

            /** 신규 레코드 대비 공통정보 **/
            for (WghFcltDtlVO vo : dtlList) {
                vo.setDelYn("N");
                vo.setSysFrstInptUserId(getUserId());
                vo.setSysFrstInptPrgrmId(getPrgrmId());
                vo.setSysLastChgUserId(getUserId());
                vo.setSysLastChgPrgrmId(getPrgrmId());
                vo.setFcltCd(fcltCd);
            }

            resultCnt = wghMngService.updateWghApcFclt(wghFcltVO);

        } catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_INSERTED_CNT, resultCnt);
        return getSuccessResponseEntity(resultMap);
    }


    }
