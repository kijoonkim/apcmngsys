package com.at.apcss.am.wgh.mapper;

import com.at.apcss.am.cmns.vo.CmnsFcltAtrbVO;
import com.at.apcss.am.cmns.vo.CmnsFcltDtlVO;
import com.at.apcss.am.cmns.vo.CmnsFcltVO;
import org.apache.ibatis.annotations.Select;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface WghInfoMapper {

    /**
     * 계량대 시설코드 발번
     * @param apcCd
     * @return
     * @throws Exception
     */
    @Select("SELECT FN_GET_ID_WGH_FCLT(#{apcCd}) FROM DUAL")
    String selectWghFcltCd(String apcCd) throws Exception;

    /**
     * 계량대 상세목록 조회
     * @param cmnsFcltAtrbVO
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT_ATRB
     */
    public List<CmnsFcltAtrbVO> selectWghInfoList(CmnsFcltAtrbVO cmnsFcltAtrbVO) throws Exception;
    /**
     * 계량대 목록 조회
     * @param cmnsFcltAtrbVO
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT_DTL
     */
    List<CmnsFcltDtlVO> selectWghDtlInfoList(CmnsFcltAtrbVO cmnsFcltAtrbVO) throws Exception;

    /**
     * 계량대 신규생성
     * @param cmnsFcltDtlVO
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT_DTL
     */
    int insertWghFcltDtl(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;


    /**
     * 계량대 신규생성
     * @param cmnsFcltVO
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT
     */
    int insertWghFclt(CmnsFcltVO cmnsFcltVO) throws Exception;

    /**
     * 계량대 상세속성 생성
     * @param cmnsFcltAtrbVoList
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT_ATRB
     */
    int insertWghFcltAtrb(List<CmnsFcltAtrbVO> cmnsFcltAtrbVoList) throws Exception;

    /**
     * 계량대 메인 grid 속성정보 조회
     * @param cmnsFcltDtlVO
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT
     */
    List<CmnsFcltVO> selectWghFcltInfo(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;

    /**
     * 계량대 하단 grid 상세속성정보 조회
     * @param cmnsFcltDtlVO
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT_ATRB
     */
    List<CmnsFcltDtlVO> selectWghFcltAtrbInfoList(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;

    /**
     * 계량대 목록 삭제
     * @param cmnsFcltDtlVO
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT,TB_OPRTNG_APC_FCLT_ATRB,TB_OPRTNG_APC_FCLT_DTL
     */
    int deleteWghInfo(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;
    int deleteWghAtrbInfo(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;
    int deleteWghDtlInfo(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;

    /**
     * 계량대 목록 수정
     * @param cmnsFcltDtlVO
     * @return
     * @throws Exception
     * @table TB_OPRTNG_APC_FCLT,TB_OPRTNG_APC_FCLT_ATRB,TB_OPRTNG_APC_FCLT_DTL
     */
    int updateWghFcltDtl(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;

    int updateWghFclt(CmnsFcltVO cmnsFcltVO) throws Exception;

    int updateWghFcltAtrb(CmnsFcltAtrbVO cmnsFcltAtrbVO) throws Exception;
}
