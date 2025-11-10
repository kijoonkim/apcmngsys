package com.at.apcss.pd.sprt.mapper;

import com.at.apcss.pd.sprt.vo.SprtBizRsltInqVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface SprtBizRsltInqMapper {

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

}