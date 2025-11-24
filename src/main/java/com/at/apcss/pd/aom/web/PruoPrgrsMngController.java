package com.at.apcss.pd.aom.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.LoginVO;
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;
import com.at.apcss.pd.aom.service.PruoPrgrsMngService;
import com.at.apcss.pd.aom.vo.InvShipOgnReqMngVO;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;
import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;
import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;
import com.at.apcss.pd.pcom.vo.*;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.at.apcss.pd.pom.vo.TbEvFrmhsApoVO;
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
 * @Class Name : PruoPrgrsMngController.java
 * @Description : 생산유통통합조직 진척도 Controller 클래스
 * @author
 * @since 2025.10.29
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  	----------  ---------------------------
 * 2025.10.29	유민지       최초 생성
 * </pre>
 */
@Controller
public class PruoPrgrsMngController extends BaseController {

    @Resource(name="pruoPrgrsMngService")
    private PruoPrgrsMngService pruoPrgrsMngService;

    @PostMapping(value = "/pd/aom/selectPruoPrgrsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectPruoPrgrsList (@RequestBody PruoPrgrsVO pruoPrgrsVO, HttpServletRequest request) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String,Object>();
        List<PruoPrgrsVO> resultList = new ArrayList<>();

        try {
            resultList = pruoPrgrsMngService.selectPruoPrgrsList(pruoPrgrsVO);
        }  catch (Exception e) {
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

    @PostMapping(value = "/pd/aom/insertPruoPrgrsApoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoPrgrsApoList(@RequestBody List<PruoPrgrsVO> pruoPrgrsList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for ( PruoPrgrsVO pruoPrgrsVO : pruoPrgrsList ) {
                pruoPrgrsVO.setSysFrstInptUserId(getUserId());
                pruoPrgrsVO.setSysFrstInptPrgrmId(getPrgrmId());
                pruoPrgrsVO.setSysLastChgUserId(getUserId());
                pruoPrgrsVO.setSysLastChgPrgrmId(getPrgrmId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoPrgrsApoList(pruoPrgrsList);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/updatePruoPrgrsApoCnclList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> updatePruoPrgrsApoCnclList(@RequestBody List<PruoPrgrsVO> pruoPrgrsList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for ( PruoPrgrsVO pruoPrgrsVO : pruoPrgrsList ) {
                pruoPrgrsVO.setSysFrstInptUserId(getUserId());
                pruoPrgrsVO.setSysFrstInptPrgrmId(getPrgrmId());
                pruoPrgrsVO.setSysLastChgUserId(getUserId());
                pruoPrgrsVO.setSysLastChgPrgrmId(getPrgrmId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.updatePruoPrgrsApoCnclList(pruoPrgrsList);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/selectPruoPrgrsApoDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectPruoPrgrsApoDtl(@RequestBody PruoPrgrsVO pruoPrgrsVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        PruoPrgrsVO prgrsInfo = new PruoPrgrsVO();

        pruoPrgrsVO.setSysLastChgPrgrmId(getPrgrmId());

        try {
             prgrsInfo = pruoPrgrsMngService.selectPruoPrgrsApoDtl(pruoPrgrsVO);
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        resultMap.put(ComConstants.PROP_RESULT_MAP, prgrsInfo);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPruoPrgrsApoDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoPrgrsApoDtl(@RequestBody PruoPrgrsVO pruoPrgrsVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            pruoPrgrsVO.setSysFrstInptUserId(getUserId());
            pruoPrgrsVO.setSysFrstInptPrgrmId(getPrgrmId());
            pruoPrgrsVO.setSysLastChgUserId(getUserId());
            pruoPrgrsVO.setSysLastChgPrgrmId(getPrgrmId());
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoPrgrsApoWrt(pruoPrgrsVO);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertIsoNtslDlgtSlsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertIsoNtslDlgtSlsPrfmnc(@RequestBody List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        for (InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO : invShipOgnSpeczItmPurSalMngList) {
            invShipOgnSpeczItmPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
            invShipOgnSpeczItmPurSalMngVO.setSysFrstInptUserId(getUserId());
            invShipOgnSpeczItmPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
            invShipOgnSpeczItmPurSalMngVO.setSysLastChgUserId(getUserId());
        }

        try {
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertIsoNtslDlgtSlsPrfmnc(invShipOgnSpeczItmPurSalMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }


        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertIsoTotPrchPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertIsoTotPrchPrfmnc(@RequestBody List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        for (InvShipOgnPurSalMngVO invShipOgnPurSalMngVO : invShipOgnPurSalMngList) {
            invShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
            invShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
            invShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
            invShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
        }

        try {
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertIsoTotPrchPrfmnc(invShipOgnPurSalMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }


        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertIsoTotSlsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertIsoTotSlsPrfmnc(@RequestBody List<InvShipOgnPurSalMngVO> invShipOgnPurSalMngList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        for (InvShipOgnPurSalMngVO invShipOgnPurSalMngVO : invShipOgnPurSalMngList) {
            invShipOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
            invShipOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
            invShipOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
            invShipOgnPurSalMngVO.setSysLastChgUserId(getUserId());
        }

        try {
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertIsoTotSlsPrfmnc(invShipOgnPurSalMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }


        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPruoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoReg(@RequestBody PrdcrCrclOgnReqMngVO prdcrCrclOgnReqMngVO, HttpServletRequest request) throws Exception{

        HashMap<String, Object> resultMap = new HashMap<String,Object>();

        prdcrCrclOgnReqMngVO.setSysFrstInptUserId(getUserId());
        prdcrCrclOgnReqMngVO.setSysFrstInptPrgrmId(getPrgrmId());
        prdcrCrclOgnReqMngVO.setSysLastChgUserId(getUserId());
        prdcrCrclOgnReqMngVO.setSysLastChgPrgrmId(getPrgrmId());

        try {
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoReg(prdcrCrclOgnReqMngVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            } else {
                LoginVO sessionLoginVo =(LoginVO) request.getSession().getAttribute("loginVO");
                String apoSe = sessionLoginVo.getApoSe();
                String mbrTypeCd = sessionLoginVo.getMbrTypeCd();
                if(apoSe == null && "1".equals(mbrTypeCd)) {
                    sessionLoginVo.setApoSe("1");
                    request.getSession().setAttribute("loginVO", sessionLoginVo);
                }
            }
        }  catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertIsoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertIsoReg(@RequestBody InvShipOgnReqMngVO invShipOgnReqMngVO, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        invShipOgnReqMngVO.setSysFrstInptUserId(getUserId());
        invShipOgnReqMngVO.setSysFrstInptPrgrmId(getPrgrmId());
        invShipOgnReqMngVO.setSysLastChgUserId(getUserId());
        invShipOgnReqMngVO.setSysLastChgPrgrmId(getPrgrmId());

        int insertedCnt = 0;

        try {
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertIsoReg(invShipOgnReqMngVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            } else {
                LoginVO sessionLoginVo =(LoginVO) request.getSession().getAttribute("loginVO");
                String apoSe = sessionLoginVo.getApoSe();
                String mbrTypeCd = sessionLoginVo.getMbrTypeCd();
                if(apoSe == null && "1".equals(mbrTypeCd)) {
                    sessionLoginVo.setApoSe("2");
                    request.getSession().setAttribute("loginVO", sessionLoginVo);
                }
            }

        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPrdcrOgnzList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPrdcrOgnzList(@RequestBody List<TbEvFrmhsApoVO> tbEvFrmhsApoVOList, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        int savedCnt = 0;
        try {
            for (TbEvFrmhsApoVO tbEvFrmhsApoVO : tbEvFrmhsApoVOList) {
                tbEvFrmhsApoVO.setSysFrstInptPrgrmId(getPrgrmId());
                tbEvFrmhsApoVO.setSysFrstInptUserId(getUserId());
                tbEvFrmhsApoVO.setSysLastChgPrgrmId(getPrgrmId());
                tbEvFrmhsApoVO.setSysLastChgUserId(getUserId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPrdcrOgnzList(tbEvFrmhsApoVOList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertFrmhsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertFrmhsList(@RequestBody List<PrdcrOgnCurntMngVO> prdcrOgnCurntMngList, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        int savedCnt = 0;
        try {
            for (PrdcrOgnCurntMngVO prdcrOgnCurntMngVO : prdcrOgnCurntMngList) {
                prdcrOgnCurntMngVO.setSysFrstInptPrgrmId(getPrgrmId());
                prdcrOgnCurntMngVO.setSysFrstInptUserId(getUserId());
                prdcrOgnCurntMngVO.setSysLastChgPrgrmId(getPrgrmId());
                prdcrOgnCurntMngVO.setSysLastChgUserId(getUserId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertFrmhsList(prdcrOgnCurntMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPruoNtslDlgtSlsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoNtslDlgtSlsPrfmnc(@RequestBody List<PrdcrCrclOgnSpItmPurSalYMngVO> prdcrCrclOgnSpItmPurSalYMngList, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for (PrdcrCrclOgnSpItmPurSalYMngVO prdcrCrclOgnSpItmPurSalYMngVO : prdcrCrclOgnSpItmPurSalYMngList) {
                prdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptPrgrmId(getPrgrmId());
                prdcrCrclOgnSpItmPurSalYMngVO.setSysFrstInptUserId(getUserId());
                prdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgPrgrmId(getPrgrmId());
                prdcrCrclOgnSpItmPurSalYMngVO.setSysLastChgUserId(getUserId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoNtslDlgtSlsPrfmnc(prdcrCrclOgnSpItmPurSalYMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPruoNtslDlgtSlsPrfmncIsoN.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoNtslDlgtSlsPrfmncIsoN(@RequestBody List<PrdcrCrclOgnSpItmPurSalNMngVO> prdcrCrclOgnSpItmPurSalNMngList, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for (PrdcrCrclOgnSpItmPurSalNMngVO prdcrCrclOgnSpItmPurSalNMngVO : prdcrCrclOgnSpItmPurSalNMngList) {
                prdcrCrclOgnSpItmPurSalNMngVO.setSysFrstInptPrgrmId(getPrgrmId());
                prdcrCrclOgnSpItmPurSalNMngVO.setSysFrstInptUserId(getUserId());
                prdcrCrclOgnSpItmPurSalNMngVO.setSysLastChgPrgrmId(getPrgrmId());
                prdcrCrclOgnSpItmPurSalNMngVO.setSysLastChgUserId(getUserId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoNtslDlgtSlsPrfmncIsoN(prdcrCrclOgnSpItmPurSalNMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPruoTotalPrch.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoTotalPrch(@RequestBody List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for (PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngList) {
                prdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
                prdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
                prdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
                prdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoTotalPrch(prdcrCrclOgnPurSalMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPruoTotalSls.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoTotalSls(@RequestBody List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for (PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngList) {
                prdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
                prdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
                prdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
                prdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoTotalSls(prdcrCrclOgnPurSalMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPruoTotalSpmtPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoTotalSpmtPrfmnc(@RequestBody List<PrdcrCrclOgnPurSalMngVO> prdcrCrclOgnPurSalMngList, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for (PrdcrCrclOgnPurSalMngVO prdcrCrclOgnPurSalMngVO : prdcrCrclOgnPurSalMngList) {
                prdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
                prdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
                prdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
                prdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoTotalSpmtPrfmnc(prdcrCrclOgnPurSalMngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertWhlslMrktNtslTrgt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertWhlslMrktNtslTrgt(@RequestBody PrdcrCrclOgnOnlnWhlslMrktVO prdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            prdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptPrgrmId(getPrgrmId());
            prdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptUserId(getUserId());
            prdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgPrgrmId(getPrgrmId());
            prdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgUserId(getUserId());

            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertWhlslMrktNtslTrgt(prdcrCrclOgnOnlnWhlslMrktVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertOnlnWhlslMrktSpmtPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertOnlnWhlslMrktSpmtPrfmnc(@RequestBody List<PrdcrCrclOgnOnlnWhlslMrktVO> prdcrCrclOgnOnlnWhlslMrktList, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            for (PrdcrCrclOgnOnlnWhlslMrktVO prdcrCrclOgnOnlnWhlslMrktVO : prdcrCrclOgnOnlnWhlslMrktList) {
                prdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptPrgrmId(getPrgrmId());
                prdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptUserId(getUserId());
                prdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgPrgrmId(getPrgrmId());
                prdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgUserId(getUserId());
            }
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertOnlnWhlslMrktSpmtPrfmnc(prdcrCrclOgnOnlnWhlslMrktList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value = "/pd/aom/insertPruoPrgrsApo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertPruoPrgrsApo(@RequestBody PruoPrgrsVO pruoPrgrsVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            pruoPrgrsVO.setSysFrstInptUserId(getUserId());
            pruoPrgrsVO.setSysFrstInptPrgrmId(getPrgrmId());
            pruoPrgrsVO.setSysLastChgUserId(getUserId());
            pruoPrgrsVO.setSysLastChgPrgrmId(getPrgrmId());
            HashMap<String, Object> rtnObj = pruoPrgrsMngService.insertPruoPrgrsApo(pruoPrgrsVO);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }
}
