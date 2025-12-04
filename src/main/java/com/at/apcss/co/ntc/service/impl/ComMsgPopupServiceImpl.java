package com.apcmngsys.apcss.co.ntc.service.impl;

import com.apcmngsys.apcss.co.ntc.mapper.ComMsgPopupMapper;
import com.apcmngsys.apcss.co.ntc.service.ComMsgPopupService;
import com.apcmngsys.apcss.co.ntc.vo.ComMsgPopupVO;
import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("comMsgPopupService")
public class ComMsgPopupServiceImpl extends BaseServiceImpl implements ComMsgPopupService {

    @Autowired
    private ComMsgPopupMapper comMsgPopupMapper;
    @Override
    public List<ComMsgPopupVO> selectMsgPopupList(ComMsgPopupVO comMsgPopupVO) throws Exception {
        return comMsgPopupMapper.selectMsgPopup(comMsgPopupVO);
    }

    @Override
    public int updateMsgPopup(ComMsgPopupVO comMsgPopupVO) throws Exception {
        return comMsgPopupMapper.updateMsgPopup(comMsgPopupVO);
    }
}
