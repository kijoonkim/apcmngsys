package com.at.apcss.am.wgh.mapper;

import com.at.apcss.am.wgh.vo.WghFcltDtlVO;
import com.at.apcss.am.wgh.vo.WghFcltVO;
import org.apache.ibatis.annotations.Select;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 계량실적 Mapper 인터페이스
 * @author 손민성
 * @since 2025.01.02
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.02  손민성        최초 생성
 * </pre>
 */
@Mapper
public interface WghFcltMapper {
    /**
     * 계량대 목록 삭제
     * @param wghFcltVO
     * @return int
     * @throws Exception
     */
    int deleteWghApcFclt(WghFcltVO wghFcltVO) throws Exception;
    /**
     * 계량대 상세목록 삭제
     * @param wghFcltDtlVO
     * @return int
     * @throws Exception
     */
    int deleteWghApcFcltDtl(WghFcltDtlVO wghFcltDtlVO) throws Exception;
    /**
     * 계량대 목록 등록
     * @param wghFcltVO
     * @return int
     * @throws Exception
     */
    int insertWghApcFclt(WghFcltVO wghFcltVO) throws Exception;
    /**
     * 계량대 상세목록 등록
     * @param wghFcltDtlVO
     * @return int
     * @throws Exception
     */
    int insertWghApcFcltDtl(WghFcltDtlVO wghFcltDtlVO) throws Exception;
    /**
     * 계량대 목록 FCLT_CD 발번
     * @param apcCd
     * @return int
     * @throws Exception
     */
    @Select("SELECT FN_GET_ID_WGH_FCLT(#{apcCd}) FROM DUAL")
    String selectWghFcltCd(String apcCd) throws Exception;
    /**
     * 계량대 목록 수정
     * @param wghFcltVO
     * @return int
     * @throws Exception
     */
    int updateWghApcFclt(WghFcltVO wghFcltVO) throws Exception;
    /**
     * 계량대 상세목록 수정
     * @param list
     * @return int
     * @throws Exception
     */
    int updateWghApcFcltDtl(List<WghFcltDtlVO> list) throws Exception;
}
