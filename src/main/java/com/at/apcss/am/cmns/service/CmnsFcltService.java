package com.at.apcss.am.cmns.service;

import com.at.apcss.am.cmns.vo.CmnsFcltAtrbVO;
import com.at.apcss.am.cmns.vo.CmnsFcltDtlVO;
import com.at.apcss.am.cmns.vo.CmnsFcltVO;

import java.util.HashMap;
import java.util.List;

public interface CmnsFcltService {

    /**
     * 계량대 상세 목록 조회
     * @param cmnsFcltAtrbVO
     * @return
     * @throws Exception
     */
    public List<CmnsFcltAtrbVO> selectWghInfoList(CmnsFcltAtrbVO cmnsFcltAtrbVO) throws Exception;

    /**
     * 계량대 목록 신규생성
     * @param cmnsFcltVO,cmnsFcltAtrbVoList
     * @return
     * @throws Exception
     */
    int insertWghInfo(CmnsFcltVO cmnsFcltVO, List<CmnsFcltAtrbVO> cmnsFcltAtrbVoList) throws Exception;

    /**
     * 계량대 목록 update
     * @param cmnsFcltVO,cmnsFcltDtlVoList
     * @return
     * @throws Exception
     */
    int updateWghInfo(CmnsFcltVO cmnsFcltVO, List<CmnsFcltAtrbVO> cmnsFcltDtlVoList) throws Exception;

    /**
     * 계량대 목록 상세정보 List 조회
     * @param cmnsFcltAtrbVO
     * @return
     * @throws Exception
     */
    List<CmnsFcltDtlVO> selectWghDtlInfoList(CmnsFcltAtrbVO cmnsFcltAtrbVO) throws Exception;

    /**
     * 계량대 목록 click Evn 상세 select
     * @param resultMap,cmnsFcltDtlVO
     * @return
     * @throws Exception
     */
    HashMap<String, Object> selectWghDtlInfo(HashMap<String, Object> resultMap, CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;

    /**
     * 계량대 목록 삭제
     * @param cmnsFcltDtlVO
     * @return
     * @throws Exception
     */
    int deleteWghInfo(CmnsFcltDtlVO cmnsFcltDtlVO) throws Exception;
}
