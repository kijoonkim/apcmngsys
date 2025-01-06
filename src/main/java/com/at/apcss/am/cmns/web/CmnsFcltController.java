package com.at.apcss.am.cmns.web;

import com.at.apcss.am.cmns.service.CmnsFcltService;
import com.at.apcss.am.cmns.vo.CmnsFcltAtrbVO;
import com.at.apcss.am.cmns.vo.CmnsFcltDtlVO;
import com.at.apcss.am.cmns.vo.CmnsFcltVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import org.springframework.beans.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CmnsFcltController extends BaseController {
    @Resource(name = "wghInfoService")
    private CmnsFcltService cmnsFcltService;

    @PostMapping(value = "/am/cmns/selectWghDtlInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectWghDtlInfoList(@RequestBody CmnsFcltAtrbVO cmnsFcltAtrbVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<CmnsFcltDtlVO> resultList;
        try{
            resultList = cmnsFcltService.selectWghDtlInfoList(cmnsFcltAtrbVO);

        }catch (Exception e){
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        }finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/am/cmns/selectWghInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectWghInfoList(@RequestBody CmnsFcltAtrbVO cmnsFcltAtrbVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<CmnsFcltAtrbVO> resultList;
        try{
            resultList = cmnsFcltService.selectWghInfoList(cmnsFcltAtrbVO);

        }catch (Exception e){
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        }finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value="/am/cmns/insertWghInfo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> insertWghInfo(@RequestBody List<Object> data, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int insertedCt = 0;
        try{
            /** 계량설비 상세속성 VO **/
            ObjectMapper mapper = new ObjectMapper();
            CmnsFcltVO cmnsFcltVO = mapper.convertValue(data.get(0), CmnsFcltVO.class);
            cmnsFcltVO.setDelYn("N");
            cmnsFcltVO.setSysFrstInptUserId(getUserId());
            cmnsFcltVO.setSysFrstInptPrgrmId(getPrgrmId());
            cmnsFcltVO.setSysLastChgUserId(getUserId());
            cmnsFcltVO.setSysLastChgPrgrmId(getPrgrmId());


            /** 계량설비 상세 propertise VO **/
            List<Map<String,Object>> cmnsFcltAtrbList = (List<Map<String, Object>>) data.get(1);
            CollectionType listType = mapper.getTypeFactory().constructCollectionType(List.class, CmnsFcltAtrbVO.class);
            List<CmnsFcltAtrbVO> cmnsFcltDtlVoList = mapper.convertValue(cmnsFcltAtrbList, listType);

            for(CmnsFcltAtrbVO cmnsFcltAtrbVO : cmnsFcltDtlVoList){
                cmnsFcltAtrbVO.setDelYn("N");
                cmnsFcltAtrbVO.setSysFrstInptUserId(getUserId());
                cmnsFcltAtrbVO.setSysFrstInptPrgrmId(getPrgrmId());
                cmnsFcltAtrbVO.setSysLastChgUserId(getUserId());
                cmnsFcltAtrbVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            insertedCt = cmnsFcltService.insertWghInfo(cmnsFcltVO,cmnsFcltDtlVoList);

        }catch (Exception e){
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        }finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_STATUS,"S");
        resultMap.put(ComConstants.PROP_INSERTED_CNT,insertedCt);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value="/am/cmns/updateWghInfo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> updateWghInfo(@RequestBody List<Object> data, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int insertedCt = 0;
        try{
            /** 계량설비 상세속성 VO **/
            ObjectMapper mapper = new ObjectMapper();
            CmnsFcltVO cmnsFcltVO = mapper.convertValue(data.get(0), CmnsFcltVO.class);
            cmnsFcltVO.setSysFrstInptUserId(getUserId());
            cmnsFcltVO.setSysFrstInptPrgrmId(getPrgrmId());
            cmnsFcltVO.setSysLastChgUserId(getUserId());
            cmnsFcltVO.setSysLastChgPrgrmId(getPrgrmId());


            /** 계량설비 상세 propertise VO **/
            List<Map<String,Object>> cmnsFcltAtrbList = (List<Map<String, Object>>) data.get(1);
            CollectionType listType = mapper.getTypeFactory().constructCollectionType(List.class, CmnsFcltAtrbVO.class);
            List<CmnsFcltAtrbVO> cmnsFcltDtlVoList = mapper.convertValue(cmnsFcltAtrbList, listType);

            for(CmnsFcltAtrbVO cmnsFcltAtrbVO : cmnsFcltDtlVoList){
                cmnsFcltAtrbVO.setSysFrstInptUserId(getUserId());
                cmnsFcltAtrbVO.setSysFrstInptPrgrmId(getPrgrmId());
                cmnsFcltAtrbVO.setSysLastChgUserId(getUserId());
                cmnsFcltAtrbVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            insertedCt = cmnsFcltService.updateWghInfo(cmnsFcltVO,cmnsFcltDtlVoList);

        }catch (Exception e){
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        }finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_STATUS,"S");
        resultMap.put(ComConstants.PROP_INSERTED_CNT,insertedCt);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/am/cmns/selectWghDtlInfo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectWghDtlInfo(@RequestBody CmnsFcltDtlVO cmnsFcltDtlVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
            resultMap = cmnsFcltService.selectWghDtlInfo(resultMap,cmnsFcltDtlVO);

        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_STATUS,"S");
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/am/cmns/deleteWghInfo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteWghInfo(@RequestBody CmnsFcltDtlVO cmnsFcltDtlVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int deletedCnt = 0;
        try {
            deletedCnt = cmnsFcltService.deleteWghInfo(cmnsFcltDtlVO);

        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_STATUS,"S");
        resultMap.put(ComConstants.PROP_DELETED_CNT,deletedCnt);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value="/am/cmns/saveWghFcltList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> saveWghFcltList(@RequestBody List<CmnsFcltVO> obj, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int insertedCt = 0;
        try{
        	for(CmnsFcltVO cmnsFcltVO : obj){
        		cmnsFcltVO.setSysFrstInptUserId(getUserId());
        		cmnsFcltVO.setSysFrstInptPrgrmId(getPrgrmId());
        		cmnsFcltVO.setSysLastChgUserId(getUserId());
        		cmnsFcltVO.setSysLastChgPrgrmId(getPrgrmId());
            }
            insertedCt = cmnsFcltService.saveWghFcltList(obj);
        }catch (Exception e){
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        }finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_STATUS,"S");
        resultMap.put(ComConstants.PROP_INSERTED_CNT,insertedCt);
        return getSuccessResponseEntity(resultMap);
    }
}
