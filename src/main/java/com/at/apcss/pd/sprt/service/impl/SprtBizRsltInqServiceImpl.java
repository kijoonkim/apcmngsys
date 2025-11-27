package com.at.apcss.pd.sprt.service.impl;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
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
    public int insertSprtBizRsltInqList(List<SprtBizRsltInqVO> sprtBizRsltInqVOList) throws Exception {

        int savedCnt = 0;

        for (SprtBizRsltInqVO sprtBizRsltInqVO : sprtBizRsltInqVOList) {

            String errCrno = sprtBizRsltInqVO.getErrCrno();
            String errBrno = sprtBizRsltInqVO.getErrBrno();
            String crno = sprtBizRsltInqVO.getCrno();

            // 법인 추가
            if("Y".equals(errCrno)) {
                logger.debug("CALL SP_COM_CORP_ADD !");
                sprtBizRsltInqMapper.insertSpComCorpAdd(sprtBizRsltInqVO);
            }

            // 사업자 추가
            if("Y".equals(errBrno)) {
                if(!"".equals(crno) && crno != null) {
                    sprtBizRsltInqVO.setPsnSeCd("2");
                }else {
                    sprtBizRsltInqVO.setPsnSeCd("3");
                }
                logger.debug("CALL SP_COM_BZMN_ADD !");
                sprtBizRsltInqMapper.insertSpComBzmnAdd(sprtBizRsltInqVO);
            }

            logger.debug("Impl VOlist 값 : {}", sprtBizRsltInqVOList);
            sprtBizRsltInqMapper.insertSpComCorpAdd(sprtBizRsltInqVO);

            sprtBizRsltInqMapper.insertSprtBizRsltInqList(sprtBizRsltInqVO);

        }
        return savedCnt;
    }

}

