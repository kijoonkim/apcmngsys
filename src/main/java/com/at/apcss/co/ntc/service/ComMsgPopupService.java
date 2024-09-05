package com.at.apcss.co.ntc.service;

import com.at.apcss.co.ntc.vo.ComMsgPopupVO;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.List;

public interface ComMsgPopupService {

    /**
     * 메시지정보를 조회한다.
     * @param comMsgPopupVO
     * @return
     * @throws Exception
     */
    public List<ComMsgPopupVO> selectMsgPopupList(ComMsgPopupVO comMsgPopupVO) throws Exception;

    /**
     * 메시지확인 처리.
     * @param comMsgPopupVO
     * @return
     * @throws Exception
     */
    int updateMsgPopup(ComMsgPopupVO comMsgPopupVO) throws Exception;
}
