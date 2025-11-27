package com.at.apcss.pd.sprt.service;

import com.at.apcss.pd.sprt.vo.SprtBizRsltInqVO;

import java.util.List;

public interface SprtBizRsltInqService {

    /**
     * 산지조직지원사업 지원사업현황조회 목록 조회
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public List<SprtBizRsltInqVO> selectSprtBizRsltInqList(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;

    /**
     * 산지조직지원사업 지원사업현황조회 사업구분 조회
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public List<SprtBizRsltInqVO> selectSprtBizRsltInqSeCd(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;

    /**
     * 산지조직지원사업 지원사업현황조회 사업자정보 조회
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public List<SprtBizRsltInqVO> selectComCorpBzmn(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;

    /**
     * 산지조직지원사업 지원사업현황조회 법인정보 조회
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public List<SprtBizRsltInqVO> selectComCorp(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;

    /**
     * 산지조직지원사업 지원사업현황조회 올리기
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public int insertSprtBizRsltInqList(List<SprtBizRsltInqVO> sprtBizRsltInqVOList) throws Exception;

}
