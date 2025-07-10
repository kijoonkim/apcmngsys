package com.at.apcss.pd.sprt.service.impl;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.pd.pcorm.mapper.SprtBizRegMngMapper;
import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.sprt.mapper.SprtBizClclnMngMapper;
import com.at.apcss.pd.sprt.service.SprtBizClclnMngService;
import com.at.apcss.pd.sprt.vo.SprtBizClclnMngVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("sprtBizClclnMngService")
public class SprtBizClclnMngServiceImpl extends BaseServiceImpl implements SprtBizClclnMngService {

    @Autowired
    private SprtBizClclnMngMapper sprtBizClclnMngMapper;

    @Autowired
    private SprtBizRegMngMapper sprtBizRegMngMapper;

    @Override
    public List<SprtBizClclnMngVO> selectSprtBizDtbnMngList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {

        List<SprtBizClclnMngVO> resultList = sprtBizClclnMngMapper.selectSprtBizDtbnMngList(sprtBizClclnMngVO);

        return resultList;
    }

    @Override
    public HashMap<String, Object>  insertSprtDtbnAplyFile(SprtBizRegFileVO sprtBizRegFile) throws Exception {

        SprtBizRegFileVO sprtBizAplyDocInfo = sprtBizRegMngMapper.selectSprtBizAplyDoc(sprtBizRegFile);
        long atchflSn = sprtBizRegMngMapper.selectNewSqEvSprtBizAtchflSn();

        sprtBizRegFile.setAtchFileSn(atchflSn);

        // 지원사업신청문서
        if (sprtBizAplyDocInfo == null) {
            // 추가
            if (0 == sprtBizRegMngMapper.insertSprtAplyDoc(sprtBizRegFile)){
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "신청문서 신규 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        } else {
            // 업데이트
            if (ComConstants.CON_NONE.equals(sprtBizAplyDocInfo.getAprvYn())) {
                sprtBizRegFile.setChgYn(ComConstants.CON_YES);
            } else if (ComConstants.CON_YES.equals(sprtBizAplyDocInfo.getAprvYn())) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "이미 확인된 서류"))); // W0009	{0}이/가 있습니다.
            }

            if (0 == sprtBizRegMngMapper.updateSprtAplyDoc(sprtBizRegFile)){
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "신청문서 업데이트"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        }

        // 지원사업첨부파일
        if ( 0 == sprtBizRegMngMapper.insertSprtAplyAtchfl(sprtBizRegFile)){
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업 첨부파일등록"))); // E0003	{0} 시 오류가 발생하였습니다.
        }

        return null;
    }
}
