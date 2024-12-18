package com.at.apcss.am.wgh.service.impl;

import com.at.apcss.am.wgh.mapper.WghPrfmncMapper;
import com.at.apcss.am.wgh.service.WghMngService;
import com.at.apcss.am.wgh.vo.WghFcltVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("wghMngService")
public class WghMngServiceImpl implements WghMngService {

    @Resource(name = "wghPrfmncMapper")
    private WghPrfmncMapper wghPrfmncMapper;

    @Override
    public List<WghFcltVO> selectWghFclt(WghFcltVO wghFcltVO) throws Exception {
        return wghPrfmncMapper.selectWghFclt(wghFcltVO);
    }
}
