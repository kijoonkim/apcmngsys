package com.apcmngsys.apcss.co.link.service.impl;

import com.apcmngsys.apcss.co.link.mapper.ComLinkMapper;
import com.apcmngsys.apcss.co.link.service.ComLinkService;
import com.apcmngsys.apcss.co.link.vo.ComLnkgRptVO;
import com.apcmngsys.apcss.co.link.vo.ComPageLinkDtlVO;
import com.apcmngsys.apcss.co.link.vo.ComPageLinkVO;
import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;


@Service("comLinkService")
public class ComLinkServiceImpl extends BaseServiceImpl implements ComLinkService {

    @Autowired
    private ComLinkMapper comLinkMapper;

    @Override
    public ComPageLinkVO selectComPageLink(ComPageLinkVO comPageLinkVO) throws Exception {

        ComPageLinkVO resultVO = comLinkMapper.selectComPageLink(comPageLinkVO);

        if (resultVO != null && StringUtils.hasText(resultVO.getLinkUnqId())) {
            ComPageLinkDtlVO dtlVO = new ComPageLinkDtlVO();
            dtlVO.setLinkSn(resultVO.getLinkSn());
            dtlVO.setLinkUnqId(resultVO.getLinkUnqId());

            List<ComPageLinkDtlVO> dtlList = comLinkMapper.selectComPageLinkDtlList(dtlVO);
            resultVO.setDtlList(dtlList);
        }

        return resultVO;
    }

    @Override
    public ComPageLinkVO selectComPageLink(String linkUnqId) throws Exception {
        return null;
    }

    @Override
    public ComLnkgRptVO selectComLnkgRpt(ComLnkgRptVO comLnkgRptVO) throws Exception {

        ComLnkgRptVO resultVO = comLinkMapper.selectComLnkgRpt(comLnkgRptVO);

        return resultVO;
    }

    @Override
    public ComLnkgRptVO selectComLnkgRpt(String uuid) throws Exception {

        ComLnkgRptVO param = new ComLnkgRptVO();
        param.setLnkgUnqId(uuid);

        return selectComLnkgRpt(param);
    }

    @Override
    public HashMap<String, Object> insertComLnkgRpt(ComLnkgRptVO comLnkgRptVO) throws Exception {
        return null;
    }

    @Override
    public HashMap<String, Object> updateComLnkgRptExpry(ComLnkgRptVO comLnkgRptVO) throws Exception {
        return null;
    }
}
