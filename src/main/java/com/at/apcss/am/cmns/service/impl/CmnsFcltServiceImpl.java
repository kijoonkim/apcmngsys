package com.at.apcss.am.cmns.service.impl;

import com.at.apcss.am.cmns.service.CmnsFcltService;
import com.at.apcss.am.cmns.vo.CmnsFcltAtrbVO;
import com.at.apcss.am.cmns.vo.CmnsFcltDtlVO;
import com.at.apcss.am.cmns.vo.CmnsFcltVO;
import com.at.apcss.am.wgh.mapper.WghInfoMapper;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.logging.log4j.core.util.JsonUtils;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Service("wghInfoService")
public class CmnsFcltServiceImpl extends BaseServiceImpl implements CmnsFcltService {

    @Autowired
    private WghInfoMapper wghInfoMapper;
    @Override
    public List<CmnsFcltAtrbVO> selectWghInfoList(CmnsFcltAtrbVO cmnsFcltAtrbVO) throws Exception {
        return wghInfoMapper.selectWghInfoList(cmnsFcltAtrbVO);
    }

    @Override
    public List<CmnsFcltDtlVO> selectWghDtlInfoList(CmnsFcltAtrbVO cmnsFcltAtrbVO) throws Exception {
        return wghInfoMapper.selectWghDtlInfoList(cmnsFcltAtrbVO);
    }

    @Override
    public int insertWghInfo(CmnsFcltVO cmnsFcltVO, List<CmnsFcltAtrbVO> cmnsFcltAtrbVoList) throws Exception{
        int fcltAtrb = 0;
        /** 계량대 코드 발번 **/
        String fcltCd = wghInfoMapper.selectWghFcltCd(cmnsFcltVO.getApcCd());
        cmnsFcltVO.setFcltCd(fcltCd);

        /** 계량대 정보 생성 [FN_GET_ID_WGH_FCLT] **/
        int fcltResult = wghInfoMapper.insertWghFclt(cmnsFcltVO);
        if(fcltResult == 0){
            new EgovBizException("insert error");
        }

        if(!cmnsFcltAtrbVoList.isEmpty()){
            /** 계량대 코드 set **/
            for(CmnsFcltAtrbVO cmnsFcltAtrbVO : cmnsFcltAtrbVoList){
                cmnsFcltAtrbVO.setFcltCd(fcltCd);
            }

            /** 계량대 공통 정보 생성 **/
            CmnsFcltDtlVO cmnsFcltDtlVO = new CmnsFcltDtlVO();
            BeanUtils.copyProperties(cmnsFcltDtlVO,cmnsFcltVO);
            cmnsFcltDtlVO.setDtlIndctNm(cmnsFcltVO.getFcltNm());

            int result = wghInfoMapper.insertWghFcltDtl(cmnsFcltDtlVO);
            if(result < 0){
                new EgovBizException("insert error");
            }

            fcltAtrb = wghInfoMapper.insertWghFcltAtrb(cmnsFcltAtrbVoList);
            if(fcltAtrb != cmnsFcltAtrbVoList.size()){
                new EgovBizException("insert error");
            }
        }
        return fcltAtrb;
    }

    @Override
    public int updateWghInfo(CmnsFcltVO cmnsFcltVO, List<CmnsFcltAtrbVO> cmnsFcltAtrbVoList) throws Exception {

        /** 계량대 공통 정보 생성 **/
        CmnsFcltDtlVO cmnsFcltDtlVO = new CmnsFcltDtlVO();
        BeanUtils.copyProperties(cmnsFcltDtlVO,cmnsFcltVO);
        cmnsFcltDtlVO.setDtlIndctNm(cmnsFcltVO.getFcltNm());

        /** fclt get set **/
        String fcltCd = cmnsFcltVO.getFcltCd();

        /** 계량대 코드 set **/
        for(CmnsFcltAtrbVO cmnsFcltAtrbVO : cmnsFcltAtrbVoList){
            cmnsFcltAtrbVO.setFcltCd(fcltCd);
        }

        int result = wghInfoMapper.updateWghFcltDtl(cmnsFcltDtlVO);
        if(result == 0){
            new EgovBizException("update error");
        }

        /** 계량대 정보 생성 [FN_GET_ID_WGH_FCLT] **/
        int fcltResult = wghInfoMapper.updateWghFclt(cmnsFcltVO);
        if(fcltResult == 0){
            new EgovBizException("update error");
        }
        wghInfoMapper.deleteWghAtrbInfo(cmnsFcltDtlVO);
        int cnt = wghInfoMapper.insertWghFcltAtrb(cmnsFcltAtrbVoList);
        if(cnt != cmnsFcltAtrbVoList.size()){
            new EgovBizException("update error");
        }

        return result;
    }

    @Override
    public HashMap<String, Object> selectWghDtlInfo(HashMap<String, Object> resultMap, CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception {
        CmnsFcltVO resultVo;
        List<CmnsFcltAtrbVO> resultList;
        try{
            /** fclt main Table SELECT **/
            ObjectMapper mapper = new ObjectMapper();
            resultVo = wghInfoMapper.selectWghFcltInfo(cmnsFcltDtlVO);
            String resultJson = mapper.writeValueAsString(resultVo);
            resultMap.put(ComConstants.PROP_RESULT_JSON, resultJson);

            /** 계량대 상세속성 grid Data SELECT 없을수있음. **/
            resultList = wghInfoMapper.selectWghFcltAtrbInfoList(cmnsFcltDtlVO);
            resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        }catch (Exception e){
            new EgovBizException();
        }

        return resultMap;
    }

    @Override
    public int deleteWghInfo(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception {
        int wghCnt = wghInfoMapper.deleteWghInfo(cmnsFcltDtlVO);
        if(wghCnt <= 0){
            new EgovBizException();
        }
        int atrbCnt = wghInfoMapper.deleteWghAtrbInfo(cmnsFcltDtlVO);
        if(atrbCnt <= 0){
            new EgovBizException();
        }
        int dtlCnt = wghInfoMapper.deleteWghDtlInfo(cmnsFcltDtlVO);
        if(dtlCnt <= 0){
            new EgovBizException();
        }
        return wghCnt;
    }
}
















