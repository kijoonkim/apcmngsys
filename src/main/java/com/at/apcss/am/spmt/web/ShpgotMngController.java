package com.at.apcss.am.spmt.web;

import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.service.ShpgotMngService;
import com.at.apcss.am.spmt.service.SpmtCmndService;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrDtlVO;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrVO;
import com.at.apcss.am.spmt.vo.ShpgotApcRawMtrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import lombok.Getter;
import lombok.Setter;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
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
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @Class Name : ShpgotMngController.java
 * @Description : 반품 기준 관리에 대한 Controller 클래스
 * @author 손민성
 * @since 2025.01.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.04  손민성        최초 생성
 * </pre>
 */
@Controller
public class ShpgotMngController extends BaseController {

    @Resource(name = "shpgotMngService")
    private ShpgotMngService shpgotMngService;

    @Getter
    @Setter
    public static class RequestData{
        private ShpgotApcCrtrVO shpgotApcCrtrVO;
        private ShpgotApcCrtrDtlVO shpgotApcCrtrDtlVO;

        private List<ShpgotApcCrtrVO> shpgotApcCrtrVoList;
        public List<ShpgotApcCrtrVO> getShpgotApcCrtrVoList() {
            return shpgotApcCrtrVoList == null ? null : shpgotApcCrtrVoList.stream().collect(Collectors.toList());
        }
        public void setShpgotApcCrtrVoList(List<ShpgotApcCrtrVO> shpgotApcCrtrVoList) {
            this.shpgotApcCrtrVoList = shpgotApcCrtrVoList == null ? null : shpgotApcCrtrVoList.stream().collect(Collectors.toList());
        }

        private List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList;
        public List<ShpgotApcCrtrDtlVO> getShpgotApcCrtrDtlVoList() {
            return shpgotApcCrtrDtlVoList == null ? null : shpgotApcCrtrDtlVoList.stream().collect(Collectors.toList());
        }
        public void setShpgotApcCrtrDtlVoList(List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList) {
            this.shpgotApcCrtrDtlVoList = shpgotApcCrtrDtlVoList == null ? null : shpgotApcCrtrDtlVoList.stream().collect(Collectors.toList());
        }
    }

    @PostMapping(value = "/am/spmt/insertShpgotApcCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> insertShpgotApcCrtr(@RequestBody RequestData requestData, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int insertCnt = 0;

        /** VO 각각 들어올때 -1-**/
//        ShpgotApcCrtrVO shpgotApcCrtrVO = requestData.getShpgotApcCrtrVO();
//        ShpgotApcCrtrDtlVO shpgotApcCrtrDtlVO = requestData.getShpgotApcCrtrDtlVO();
//        try{
//            if(shpgotApcCrtrVO != null){
//                setCommonInfo(shpgotApcCrtrVO);
//                shpgotMngService.insertShpgotApcCrtr(shpgotApcCrtrVO);
//            }
//
//        }catch (Exception e) {
//            return getErrorResponseEntity(e);
//        } finally {
//            HashMap<String, Object> rtnObj = setMenuComLog(request);
//            if (rtnObj != null) {
//                return getErrorResponseEntity(rtnObj);
//            }
//        }

//        /** 다중 VO가 한번에 들어올때 처리 -2-**/
        List<ShpgotApcCrtrVO> shpgotApcCrtrVoList = requestData.getShpgotApcCrtrVoList();
        List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList = requestData.getShpgotApcCrtrDtlVoList();
//
        try {
//            Optional.ofNullable(shpgotApcCrtrVoList).ifPresent(list ->{
//                for(ShpgotApcCrtrVO vo : shpgotApcCrtrVoList){
//                    /** 공통정보 셋팅 **/
//                    vo.setDelYn("N");
//                    vo.setSysFrstInptUserId(getUserId());
//                    vo.setSysFrstInptPrgrmId(getPrgrmId());
//                    vo.setSysLastChgUserId(getUserId());
//                    vo.setSysLastChgPrgrmId(getPrgrmId());
//                }
//            });
//
//            Optional.ofNullable(shpgotApcCrtrDtlVoList).ifPresent(list ->{
//                for(ShpgotApcCrtrDtlVO vo : shpgotApcCrtrDtlVoList){
//                    /** 상세 공통정보 셋팅 **/
//                    vo.setDelYn("N");
//                    vo.setSysFrstInptUserId(getUserId());
//                    vo.setSysFrstInptPrgrmId(getPrgrmId());
//                    vo.setSysLastChgUserId(getUserId());
//                    vo.setSysLastChgPrgrmId(getPrgrmId());
//                }
//            });

            if(Optional.ofNullable(shpgotApcCrtrVoList).map(list -> !list.isEmpty()).orElse(false)){
                for(ShpgotApcCrtrVO vo : shpgotApcCrtrVoList){
                    /** 공통정보 셋팅 **/
                    vo.setDelYn("N");
                    vo.setSysFrstInptUserId(getUserId());
                    vo.setSysFrstInptPrgrmId(getPrgrmId());
                    vo.setSysLastChgUserId(getUserId());
                    vo.setSysLastChgPrgrmId(getPrgrmId());
                }
                insertCnt = shpgotMngService.insertShpgotApcCrtr(shpgotApcCrtrVoList);
            }else if(Optional.ofNullable(shpgotApcCrtrDtlVoList).map(list -> !list.isEmpty()).orElse(false)){
                for(ShpgotApcCrtrDtlVO vo : shpgotApcCrtrDtlVoList){
                    /** 상세 공통정보 셋팅 **/
                    vo.setDelYn("N");
                    vo.setSysFrstInptUserId(getUserId());
                    vo.setSysFrstInptPrgrmId(getPrgrmId());
                    vo.setSysLastChgUserId(getUserId());
                    vo.setSysLastChgPrgrmId(getPrgrmId());
                }
                insertCnt = shpgotMngService.insertShpgotApcCrtrDtl(shpgotApcCrtrDtlVoList);
            }

        } catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/am/spmt/selectShpgotApcCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectShpgotApcCrtrList(@RequestBody ShpgotApcCrtrVO shpgotApcCrtrVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ShpgotApcCrtrVO> resultList = shpgotMngService.selectShpgotApcCrtrList(shpgotApcCrtrVO);
        resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/am/spmt/selectShpgotApcCrtrDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectShpgotApcCrtrDtlList(@RequestBody ShpgotApcCrtrVO shpgotApcCrtrVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ShpgotApcCrtrDtlVO> resultList = shpgotMngService.selectShpgotApcCrtrDtlList(shpgotApcCrtrVO);
        resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/am/spmt/selectShpgotRawMtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
        public ResponseEntity<HashMap<String, Object>> selectShpgotRawMtr(@RequestBody ShpgotApcRawMtrVO shpgotApcRawMtrVO, HttpServletRequest request) throws Exception {
            HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<ShpgotApcRawMtrVO> resultList = new ArrayList();
            try{
                resultList = shpgotMngService.selectShpgotRawMtr(shpgotApcRawMtrVO);

            }catch (Exception e) {
                return getErrorResponseEntity(e);
            } finally {
                HashMap<String, Object> rtnObj = setMenuComLog(request);
                if (rtnObj != null) {
                    return getErrorResponseEntity(rtnObj);
                }
            }
            resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);
            return getSuccessResponseEntity(resultMap);
        }
        @PostMapping(value = "/am/spmt/insertShpgotRawMtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
            public ResponseEntity<HashMap<String, Object>> insertShpgotRawMtr(@RequestBody List<ShpgotApcRawMtrVO> shpgotApcRawMtrVOList, HttpServletRequest request) throws Exception {
                HashMap<String, Object> resultMap = new HashMap<String, Object>();
                int insertCnt = 0;
                try{
                    for(ShpgotApcRawMtrVO vo : shpgotApcRawMtrVOList){
                        setCommonInfo(vo);
                    }
                    insertCnt = shpgotMngService.insertShpgotRawMtr(shpgotApcRawMtrVOList);
                }catch (Exception e) {
                    return getErrorResponseEntity(e);
                } finally {
                    HashMap<String, Object> rtnObj = setMenuComLog(request);
                    if (rtnObj != null) {
                        return getErrorResponseEntity(rtnObj);
                    }
                }
                resultMap.put(ComConstants.PROP_INSERTED_CNT,insertCnt);
                return getSuccessResponseEntity(resultMap);
            }
    @PostMapping(value = "/am/spmt/deleteShpgotRawMtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> deleteShpgotRawMtr(@RequestBody ShpgotApcRawMtrVO shpgotApcRawMtrVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        int deleteCnt = 0;
        try{
            setCommonInfo(shpgotApcRawMtrVO);
            deleteCnt = shpgotMngService.deleteShpgotRawMtr(shpgotApcRawMtrVO);
        }catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_DELETED_CNT,deleteCnt);
        return getSuccessResponseEntity(resultMap);
    }








        @PostMapping(value = "/am/spmt/deleteShpgotApcCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
            public ResponseEntity<HashMap<String, Object>> deleteShpgotApcCrtr(@RequestBody RequestData requestData, HttpServletRequest request) throws Exception {
                HashMap<String, Object> resultMap = new HashMap<String, Object>();
                int resultCnt = 0;
                try{
                    ShpgotApcCrtrVO shpgotApcCrtrVO = requestData.getShpgotApcCrtrVO();
                    resultCnt = shpgotMngService.deleteShpgotApcCrtr(shpgotApcCrtrVO);
                }catch (Exception e) {
                    return getErrorResponseEntity(e);
                } finally {
                    HashMap<String, Object> rtnObj = setMenuComLog(request);
                    if (rtnObj != null) {
                        return getErrorResponseEntity(rtnObj);
                    }
                }
                resultMap.put(ComConstants.PROP_DELETED_CNT, resultCnt);
                return getSuccessResponseEntity(resultMap); 
            }
        @PostMapping(value = "/am/spmt/deleteShpgotApcCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
            public ResponseEntity<HashMap<String, Object>> deleteShpgotApcCrtrDtl(@RequestBody ShpgotApcCrtrDtlVO shpgotApcCrtrDtlVO, HttpServletRequest request) throws Exception {
                HashMap<String, Object> resultMap = new HashMap<String, Object>();
                int resultCnt = 0;
                try{
                    resultCnt = shpgotMngService.deleteShpgotApcCrtrDtl(shpgotApcCrtrDtlVO);
                }catch (Exception e) {
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

    private <T> void setCommonInfo(T vo) {
        if (vo instanceof ShpgotApcCrtrVO) {
            ShpgotApcCrtrVO shpgotApcCrtrVO = (ShpgotApcCrtrVO) vo;
            shpgotApcCrtrVO.setDelYn("N");
            shpgotApcCrtrVO.setSysFrstInptUserId(getUserId());
            shpgotApcCrtrVO.setSysFrstInptPrgrmId(getPrgrmId());
            shpgotApcCrtrVO.setSysLastChgUserId(getUserId());
            shpgotApcCrtrVO.setSysLastChgPrgrmId(getPrgrmId());
        } else if (vo instanceof ShpgotApcCrtrDtlVO) {
            ShpgotApcCrtrDtlVO shpgotApcCrtrDtlVO = (ShpgotApcCrtrDtlVO) vo;
            shpgotApcCrtrDtlVO.setDelYn("N");
            shpgotApcCrtrDtlVO.setSysFrstInptUserId(getUserId());
            shpgotApcCrtrDtlVO.setSysFrstInptPrgrmId(getPrgrmId());
            shpgotApcCrtrDtlVO.setSysLastChgUserId(getUserId());
            shpgotApcCrtrDtlVO.setSysLastChgPrgrmId(getPrgrmId());
        } else if (vo instanceof ShpgotApcRawMtrVO) {
            ShpgotApcRawMtrVO shpgotApcRawMtrVO = (ShpgotApcRawMtrVO) vo;
            shpgotApcRawMtrVO.setDelYn("N");
            shpgotApcRawMtrVO.setSysFrstInptUserId(getUserId());
            shpgotApcRawMtrVO.setSysFrstInptPrgrmId(getPrgrmId());
            shpgotApcRawMtrVO.setSysLastChgUserId(getUserId());
            shpgotApcRawMtrVO.setSysLastChgPrgrmId(getPrgrmId());
        }
    }
}
