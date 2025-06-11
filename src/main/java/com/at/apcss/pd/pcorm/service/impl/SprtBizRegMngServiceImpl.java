package com.at.apcss.pd.pcorm.service.impl;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.pd.pcorm.mapper.SprtBizRegMngMapper;
import com.at.apcss.pd.pcorm.service.SprtBizRegMngService;
import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegMngVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;

@Service("sprtBizRegMngService")
public class SprtBizRegMngServiceImpl extends BaseServiceImpl implements SprtBizRegMngService {

    @Autowired
    private SprtBizRegMngMapper sprtBizRegMngMapper;

    @Override
    public List<SprtBizRegMngVO> selectApoSprtAplyList(SprtBizRegMngVO sprtBizRegMngVO) throws Exception {

        List<SprtBizRegMngVO> resultList = sprtBizRegMngMapper.selectApoSprtAplyList(sprtBizRegMngVO);

        return resultList;
    }

    @Override
    public HashMap<String, Object> updateSprtAplyList(List<SprtBizRegMngVO> sprtBizRegMngList) throws Exception {

        HashMap<String, Object> rtnObj = null;

        for (SprtBizRegMngVO sprtBizRegMngVO : sprtBizRegMngList) {

            String sprtBizYr = sprtBizRegMngVO.getYr();
            if (!StringUtils.hasText(sprtBizYr)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
            }

            sprtBizRegMngVO.setSprtBizYr(sprtBizYr);

            String sprtBizCd = sprtBizRegMngVO.getSprtBizCd();
            if (!StringUtils.hasText(sprtBizCd)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
            }

            // 지원사업 마스터 조회
            SprtBizRegMngVO sprtBizParamVO = new SprtBizRegMngVO();
            sprtBizParamVO.setSprtBizYr(sprtBizYr);
            sprtBizParamVO.setSprtBizCd(sprtBizCd);

            SprtBizRegMngVO sprtBizMstrInfo =  sprtBizRegMngMapper.selectSprtBizMstr(sprtBizParamVO);
            if (sprtBizMstrInfo == null
                    || !StringUtils.hasText(sprtBizMstrInfo.getSprtBizYr())
                    || !StringUtils.hasText(sprtBizMstrInfo.getSprtBizCd())
                    || !ComConstants.CON_NONE.equals(sprtBizMstrInfo.getDelYn())) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업등록내용");
            }

            // 지원사업조직
            sprtBizRegMngMapper.selectSpSprtBizOgnzId(sprtBizRegMngVO);
            if (StringUtils.hasText(sprtBizRegMngVO.getRtnCd())) {
                return ComUtil.getResultMap(sprtBizRegMngVO.getRtnCd(), sprtBizRegMngVO.getRtnMsg());
            }

            String sprtOgnzId = sprtBizRegMngVO.getRtnSprtOgnzId();
            if (!StringUtils.hasText(sprtOgnzId)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원조직아이디"); // {0}이/가 없습니다.
            }

            // 지원사업신청
            sprtBizRegMngVO.setSprtOgnzId(sprtOgnzId);
            SprtBizRegMngVO sprtBizAplyVO = sprtBizRegMngMapper.selectSprtBizAply(sprtBizRegMngVO);
            if (sprtBizAplyVO == null || !StringUtils.hasText(sprtBizAplyVO.getSprtBizYr()) || !StringUtils.hasText(sprtBizAplyVO.getSprtBizCd()) || !StringUtils.hasText(sprtBizAplyVO.getSprtOgnzId())) {
                // 추가
                sprtBizRegMngMapper.insertSprtBizAply(sprtBizRegMngVO);
            } else {
                // 업데이트
                sprtBizRegMngMapper.updateSprtBizAply(sprtBizRegMngVO);
            }

        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertSprtAplyFile(SprtBizRegFileVO sprtBizRegFile) throws Exception {

        String sprtOgnzId = sprtBizRegFile.getSprtOgnzId();
        if (!StringUtils.hasText(sprtOgnzId)) {
            // 조직아이디가 없을 떄

            if (!StringUtils.hasText(sprtBizRegFile.getSprtBizYr())) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
            }

            if (!StringUtils.hasText(sprtBizRegFile.getSprtBizYr())) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
            }

            // 지원사업 마스터 조회
            SprtBizRegMngVO sprtBizParamVO = new SprtBizRegMngVO();
            sprtBizParamVO.setSprtBizYr(sprtBizRegFile.getSprtBizYr());
            sprtBizParamVO.setSprtBizCd(sprtBizRegFile.getSprtBizCd());

            SprtBizRegMngVO sprtBizMstrInfo =  sprtBizRegMngMapper.selectSprtBizMstr(sprtBizParamVO);
            if (sprtBizMstrInfo == null
                    || !StringUtils.hasText(sprtBizMstrInfo.getSprtBizYr())
                    || !StringUtils.hasText(sprtBizMstrInfo.getSprtBizCd())
                    || !ComConstants.CON_NONE.equals(sprtBizMstrInfo.getDelYn())) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업등록내용");
            }
            

            SprtBizRegMngVO sprtBizRegMngVO = new SprtBizRegMngVO();

            sprtBizRegMngVO.setSysLastChgUserId(sprtBizRegFile.getSysLastChgUserId());
            sprtBizRegMngVO.setSysLastChgPrgrmId(sprtBizRegFile.getSysLastChgPrgrmId());
            sprtBizRegMngVO.setSprtBizYr(sprtBizRegFile.getSprtBizYr());
            sprtBizRegMngVO.setSprtBizCd(sprtBizRegFile.getSprtBizCd());
            sprtBizRegMngVO.setCrno(sprtBizRegFile.getCrno());
            sprtBizRegMngVO.setBrno(sprtBizRegFile.getBrno());
            sprtBizRegMngVO.setSysFrstInptUserId(sprtBizRegFile.getSysFrstInptUserId());
            sprtBizRegMngVO.setSysFrstInptPrgrmId(sprtBizRegFile.getSysFrstInptPrgrmId());

            // 지원사업조직
            sprtBizRegMngMapper.selectSpSprtBizOgnzId(sprtBizRegMngVO);
            if (StringUtils.hasText(sprtBizRegMngVO.getRtnCd())) {
                return ComUtil.getResultMap(sprtBizRegMngVO.getRtnCd(), sprtBizRegMngVO.getRtnMsg());
            }

            sprtOgnzId = sprtBizRegMngVO.getRtnSprtOgnzId();
            if (!StringUtils.hasText(sprtOgnzId)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원조직아이디"); // {0}이/가 없습니다.
            }

            // 지원사업신청
            sprtBizRegMngVO.setSprtOgnzId(sprtOgnzId);
            SprtBizRegMngVO sprtBizAplyVO = sprtBizRegMngMapper.selectSprtBizAply(sprtBizRegMngVO);
            if (sprtBizAplyVO == null || !StringUtils.hasText(sprtBizAplyVO.getSprtBizYr()) || !StringUtils.hasText(sprtBizAplyVO.getSprtBizCd()) || !StringUtils.hasText(sprtBizAplyVO.getSprtOgnzId())) {
                // 추가
                if (0 == sprtBizRegMngMapper.insertSprtBizAply(sprtBizRegMngVO)){
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업신청 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
                }
            } else {
                // 업데이트
                if (0 == sprtBizRegMngMapper.updateSprtBizAply(sprtBizRegMngVO)){
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업신청 수정"))); // E0003	{0} 시 오류가 발생하였습니다.
                }
            }

            sprtBizRegFile.setSprtOgnzId(sprtOgnzId);
        }

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

    @Override
    public List<SprtBizRegMngVO> selectSprtBizFilePath(SprtBizRegMngVO sprtBizRegMngVO) throws Exception {

        List<SprtBizRegMngVO> resultList = sprtBizRegMngMapper.selectSprtBizFilePath(sprtBizRegMngVO);

        return resultList;
    }

    @Override
    public HashMap<String, Object> updateSprtBizAplyDoc(SprtBizRegMngVO sprtBizRegMngVO) throws Exception {

        if (!StringUtils.hasText(sprtBizRegMngVO.getSprtBizYr())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizRegMngVO.getSprtBizCd())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizRegMngVO.getSprtOgnzId())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업조직아이디"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizRegMngVO.getAplyDocCd())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "신청문서코드"); // {0}이/가 없습니다.
        }

        SprtBizRegMngVO sprtBizAplyDocInfo = sprtBizRegMngMapper.selectSprtBizAplyDocForUpdate(sprtBizRegMngVO);

        if (sprtBizAplyDocInfo == null
                || !StringUtils.hasText(sprtBizAplyDocInfo.getSprtBizYr())
                || !StringUtils.hasText(sprtBizAplyDocInfo.getSprtBizCd())
                || !StringUtils.hasText(sprtBizAplyDocInfo.getSprtOgnzId())
                || !StringUtils.hasText(sprtBizAplyDocInfo.getAplyDocCd())
                || !ComConstants.CON_NONE.equals(sprtBizAplyDocInfo.getDelYn())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업신청문서등록내용");
        }

        if (0 == sprtBizRegMngMapper.updateSprtBizAplyDoc(sprtBizRegMngVO)){
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업신청문서 확인/미확인 업데이트"))); // E0003	{0} 시 오류가 발생하였습니다.
        }

        return null;
    }

    @Override
    public SprtBizRegFileVO selectSprtBizAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception {

        SprtBizRegFileVO result = sprtBizRegMngMapper.selectSprtBizAtchfl(sprtBizRegFileVO);

        return result;

    }
}
