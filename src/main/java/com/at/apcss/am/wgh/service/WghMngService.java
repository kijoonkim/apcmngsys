package com.at.apcss.am.wgh.service;

import com.at.apcss.am.wgh.vo.WghFcltVO;
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
}
