package com.at.apcss.am.wgh.service.impl;

import com.at.apcss.am.wgh.mapper.WghPrfmncMapper;
import com.at.apcss.am.wgh.mapper.WghFcltMapper;
import com.at.apcss.am.wgh.service.WghMngService;
import com.at.apcss.am.wgh.vo.WghFcltDtlVO;
import com.at.apcss.am.wgh.vo.WghFcltVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;
@Service("wghMngService")
public class WghMngServiceImpl implements WghMngService {

    @Resource(name = "wghPrfmncMapper")
    private WghPrfmncMapper wghPrfmncMapper;

    @Resource(name = "wghFcltMapper")
    private WghFcltMapper wghFcltMapper;

    @Override
    public List<WghFcltVO> selectWghFclt(WghFcltVO wghFcltVO) throws Exception {
        return wghPrfmncMapper.selectWghFclt(wghFcltVO);
    }

    @Override
    public int deleteWghApcFclt(WghFcltVO wghFcltVO) throws Exception {
        int wghCnt =  wghFcltMapper.deleteWghApcFclt(wghFcltVO);
        if(wghCnt <= 0){
            throw new EgovBizException();
        }
        List<WghFcltDtlVO> list = wghFcltVO.getWghFcltDtlVO();
        int dtlCnt = 0;

        for(WghFcltDtlVO vo : list){
            dtlCnt += deleteWghApcFcltDtl(vo);
        }
        if(dtlCnt <= 0){
            throw new EgovBizException();
        }
        return wghCnt;
    }

    @Override
    public int deleteWghApcFcltDtl(WghFcltDtlVO wghFcltDtlVO) throws Exception {
        int dtlCnt = wghFcltMapper.deleteWghApcFcltDtl(wghFcltDtlVO);
        if(dtlCnt <= 0){
            throw new EgovBizException();
        }
        return dtlCnt;
    }

    @Override
    public int insertWghApcFclt(WghFcltVO wghFcltVO) throws Exception {
        String fcltCd = wghFcltVO.getFcltCd();
        if(!StringUtils.hasText(fcltCd)){
            fcltCd =  wghFcltMapper.selectWghFcltCd(wghFcltVO.getApcCd());
            wghFcltVO.setFcltCd(fcltCd);
        }
        int wghCnt = wghFcltMapper.insertWghApcFclt(wghFcltVO);
        if(wghCnt <= 0){
            throw new EgovBizException();
        }
        List<WghFcltDtlVO> dtlList = wghFcltVO.getWghFcltDtlVO();
        int wghDtlCnt = 0;
        for(WghFcltDtlVO vo : dtlList){
            vo.setFcltCd(fcltCd);
            wghDtlCnt += insertWghApcFcltDtl(vo);
        }
        return wghCnt;
    }

    @Override
    public int insertWghApcFcltDtl(WghFcltDtlVO wghFcltDtlVO) throws Exception {
        int dtlCnt = wghFcltMapper.insertWghApcFcltDtl(wghFcltDtlVO);
        if(dtlCnt <= 0){
            throw new EgovBizException();
        }
        return dtlCnt;
    }

    @Override
    public int updateWghApcFclt(WghFcltVO wghFcltVO) throws Exception {
        int wghCnt = wghFcltMapper.updateWghApcFclt(wghFcltVO);
        if(wghCnt <= 0){
            throw new EgovBizException();
        }
        List<WghFcltDtlVO> list = wghFcltVO.getWghFcltDtlVO();
        int dtlCnt = wghFcltMapper.updateWghApcFcltDtl(list);
        if(dtlCnt <= 0){
            throw new EgovBizException();
        }
        return wghCnt;
    }

}
