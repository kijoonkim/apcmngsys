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
    public List<SprtBizRsltInqVO> selectSprtBizOgnz(SprtBizRsltInqVO sprtBizRsltInqVO) throws Exception {

        List<SprtBizRsltInqVO> resultList = sprtBizRsltInqMapper.selectSprtBizOgnz(sprtBizRsltInqVO);

        return resultList;
    }

    @Override
    public int insertSprtBizRsltInqList(List<SprtBizRsltInqVO> sprtBizRsltInqVOList) throws Exception {

        int savedCnt = 0;

        for (SprtBizRsltInqVO sprtBizRsltInqVO : sprtBizRsltInqVOList) {

            String errCrno = sprtBizRsltInqVO.getErrCrno();
            String errBrno = sprtBizRsltInqVO.getErrBrno();
            String errSprtOgnzId = sprtBizRsltInqVO.getErrSprtOgnzId();
            String crno = sprtBizRsltInqVO.getCrno();

            // 법인 추가
            if("Y".equals(errCrno)) {
                logger.debug("Start : CALL SP_COM_CORP_ADD : {} ", sprtBizRsltInqVO);
                sprtBizRsltInqMapper.insertSpComCorpAdd(sprtBizRsltInqVO);
                logger.debug("End : CALL SP_COM_CORP_ADD");
            }

            // 사업자 추가
            if("Y".equals(errBrno)) {
                if(crno != null && !crno.isEmpty()) {
                    sprtBizRsltInqVO.setPsnSeCd("2");
                }else {
                    sprtBizRsltInqVO.setPsnSeCd("3");
                }
                logger.debug("Start : CALL SP_COM_BZMN_ADD : {} ", sprtBizRsltInqVO);
                sprtBizRsltInqMapper.insertSpComBzmnAdd(sprtBizRsltInqVO);
                logger.debug("End : CALL SP_COM_BZMN_ADD");
            }

            // 지원사업조직 ID 추가
            if("Y".equals(errSprtOgnzId)) {
                logger.debug("Start : CALL SP_COM_BZMN_ADD : {} ", sprtBizRsltInqVO);
                sprtBizRsltInqMapper.insertSpSprtGetBizOgnzId(sprtBizRsltInqVO);
                logger.debug("End : CALL SP_COM_BZMN_ADD");
            }

            logger.debug("Impl VOlist 값 : {}", sprtBizRsltInqVOList);
            savedCnt += sprtBizRsltInqMapper.insertSprtBizRsltInqList(sprtBizRsltInqVO);

        }
        return savedCnt;
    }

}

