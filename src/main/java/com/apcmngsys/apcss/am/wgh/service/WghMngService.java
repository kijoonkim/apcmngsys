package com.apcmngsys.apcss.am.wgh.service;

import com.apcmngsys.apcss.am.wgh.vo.WghFcltDtlVO;
import com.apcmngsys.apcss.am.wgh.vo.WghFcltVO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface WghMngService {
    /**
     * 계량대 목록 조회
     * @param wghFcltVO
     * @return
     * @throws Exception
     */
    List<WghFcltVO> selectWghFclt(WghFcltVO wghFcltVO) throws Exception;
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
     * 계량대 상세목록 수정
     * @param wghFcltVO
     * @return int
     * @throws Exception
     */
    int updateWghApcFclt(WghFcltVO wghFcltVO) throws Exception;
}
