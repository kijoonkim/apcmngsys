package com.apcmngsys.apcss.pd.pcom.service.impl;

import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;
import com.apcmngsys.apcss.pd.pcom.mapper.PruoMngMapper;
import com.apcmngsys.apcss.pd.pcom.service.PruoMngService;
import com.apcmngsys.apcss.pd.pcom.vo.PruoMstVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("pruoMngService")
public class PruoMngServiceImpl extends BaseServiceImpl implements PruoMngService {

    @Autowired
    private PruoMngMapper pruoMngMapper;

    @Override
    public PruoMstVO selectPruoRegMst(PruoMstVO pruoMstVO) throws Exception {
        return pruoMngMapper.selectPruoRegMst(pruoMstVO);
    }

    @Override
    public List<PruoMstVO> selectPruoRegMstList(PruoMstVO pruoMstVO) throws Exception {
        return pruoMngMapper.selectPruoRegMstList(pruoMstVO);
    }
}
