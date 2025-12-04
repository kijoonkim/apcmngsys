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
     * 산지조직지원사업 지원사업현황조회 지원사업조직 조회
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public List<SprtBizRsltInqVO> selectSprtBizOgnz(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;

    /**
     * 산지조직지원사업 지원사업현황조회 올리기
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public int insertSprtBizRsltInqList(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;

    /**
     * 산지조직지원사업 지원사업현황조회 법인 신규 등록 (Call procedure)
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public int insertSpComCorpAdd(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;

    /**
     * 산지조직지원사업 지원사업현황조회 사업자 신규 등록 (Call procedure)
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public int insertSpComBzmnAdd(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;

    /**
     * 산지조직지원사업 지원사업현황조회 지원사업조직아이디 신규 등록 (Call procedure)
     * @param sprtBizRsltInqVO
     * @return
     * @throws Exception
     */
    public int insertSpSprtGetBizOgnzId(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception;




}