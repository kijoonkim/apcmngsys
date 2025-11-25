package com.at.apcss.pd.sprt.service.impl;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.sprt.mapper.SprtBizRsltInqMapper;
import com.at.apcss.pd.sprt.service.SprtBizRsltInqService;
import com.at.apcss.pd.sprt.vo.SprtBizRsltInqVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("sprtBizRsltInqService")
public class SprtBizRsltInqServiceImpl extends BaseServiceImpl implements SprtBizRsltInqService {

    @Autowired
    private SprtBizRsltInqMapper sprtBizRsltInqMapper;

    @Override
    public List<SprtBizRsltInqVO> selectSprtBizRsltInqList(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception {

        List<SprtBizRsltInqVO> resultList = sprtBizRsltInqMapper.selectSprtBizRsltInqList(sprtBizRsltInqVO);

        return resultList;
    }

    @Override
    public List<SprtBizRsltInqVO> selectSprtBizRsltInqSeCd(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception {

        List<SprtBizRsltInqVO> resultList = sprtBizRsltInqMapper.selectSprtBizRsltInqSeCd(sprtBizRsltInqVO);

        return resultList;
    }

    @Override
    public List<SprtBizRsltInqVO> selectComCorpBzmn(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception {

        List<SprtBizRsltInqVO> resultList = sprtBizRsltInqMapper.selectComCorpBzmn(sprtBizRsltInqVO);

        return resultList;
    }

    @Override
    public List<SprtBizRsltInqVO> selectComCorp(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception {

        List<SprtBizRsltInqVO> resultList = sprtBizRsltInqMapper.selectComCorp(sprtBizRsltInqVO);

        return resultList;
    }

    @Override
    public List<SprtBizRsltInqVO> insertSprtBizRsltInqList(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception {

        List<SprtBizRsltInqVO> resultList = sprtBizRsltInqMapper.insertSprtBizRsltInqList(sprtBizRsltInqVO);

        //sprtBizRsltInqMapper.insertSpComCorpAdd(sprtBizRsltInqVO);

        return resultList;
    }

}

