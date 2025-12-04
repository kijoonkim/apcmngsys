package com.at.apcss.pd.aom.mapper;

import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqMngVO;
import com.at.apcss.pd.pcom.vo.PruoPrgrsVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface PruoPrgrsMngMapper {
    /**
     * 생산유통통합조직 진척도 목록 조회
     * @param pruoPrgrsVO
     * @return
     * @throws Exception
     */
    public List<PruoPrgrsVO> selectPruoPrgrsList(PruoPrgrsVO pruoPrgrsVO) throws Exception;

    /**
     * 생산유통통합조직 진행관리 등록
     * @param prgrs
     * @return
     * @throws Exception
     */
    public void insertPruoPrgrsApo(PruoPrgrsVO prgrs) throws Exception;

    /**
     * 생산유통통합조직 진행관리 취소
     * @param prgrs
     * @return
     * @throws Exception
     */
    public void updatePruoPrgrsApoCncl(PruoPrgrsVO prgrs) throws Exception;

    public void insertPruoPrgrsApoWrt(PruoPrgrsVO pruoPrgrsVO) throws Exception;

    /**
     * 생산유통통합조직 법인체마감(TB_EV_APLY_MNG)
     * @param prgrs
     * @return
     * @throws Exception
     */
    public int updateCorpDdlnSeCd(PruoPrgrsVO prgrs) throws Exception;

    public PrdcrCrclOgnReqMngVO selectAplyMngInfo(PruoPrgrsVO prgrs) throws Exception;

    public PruoPrgrsVO selectPruoPrgrsApoDtl(PruoPrgrsVO pruoPrgrsVO) throws Exception;

    /**
     * 생산유통통합조직 실적 법인체 마감(TB_EV_APLY_MNG)
     * @param pruoPrgrsVO
     * @return
     * @throws Exception
     */
    public int updatePrfmncCorpDdlnYn(PruoPrgrsVO pruoPrgrsVO) throws Exception;
}
