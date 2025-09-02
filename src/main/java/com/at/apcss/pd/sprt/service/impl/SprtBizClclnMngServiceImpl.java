package com.at.apcss.pd.sprt.service.impl;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.pd.pcorm.mapper.SprtBizRegMngMapper;
import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegMngVO;
import com.at.apcss.pd.sprt.mapper.SprtBizClclnMngMapper;
import com.at.apcss.pd.sprt.service.SprtBizClclnMngService;
import com.at.apcss.pd.sprt.vo.SprtBizClclnMngVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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

    @Override
    public HashMap<String, Object> insertDtbnDcsnDocFile(SprtBizRegFileVO sprtBizRegFile) throws Exception {

        String sprtBizYr = sprtBizRegFile.getSprtBizYr();
        String sprtBizCd = sprtBizRegFile.getSprtBizCd();
        String sprtOgnzId = sprtBizRegFile.getSprtOgnzId();

        if (!StringUtils.hasText(sprtBizYr)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizCd)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtOgnzId)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업조직아이디"); // {0}이/가 없습니다.
        }

        if (sprtBizRegFile.getDocSeq() == 0) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "문서순번"); // {0}이/가 없습니다.
        }

        SprtBizClclnMngVO sprtBizClclnMngVO = new SprtBizClclnMngVO();

        sprtBizClclnMngVO.setSprtBizYr(sprtBizYr);
        sprtBizClclnMngVO.setSprtBizCd(sprtBizCd);
        sprtBizClclnMngVO.setSprtOgnzId(sprtOgnzId);
        sprtBizClclnMngVO.setClclnSeq(sprtBizRegFile.getClclnSeq());
        sprtBizClclnMngVO.setDocSeq(sprtBizRegFile.getDocSeq());


        SprtBizClclnMngVO sprtBizClclnDocInfo= sprtBizClclnMngMapper.selectSprtBizClclnDoc(sprtBizClclnMngVO);

        long atchflSn = sprtBizRegMngMapper.selectNewSqEvSprtBizAtchflSn();

        sprtBizClclnMngVO.setDocKnd("CLCLN_APRV");
        sprtBizClclnMngVO.setDocCd("DTBN_DCSN");
        sprtBizClclnMngVO.setAtchFileSn(atchflSn);
        sprtBizClclnMngVO.setSysFrstInptUserId(sprtBizRegFile.getSysFrstInptUserId());
        sprtBizClclnMngVO.setSysFrstInptPrgrmId(sprtBizRegFile.getSysFrstInptPrgrmId());
        sprtBizClclnMngVO.setSysLastChgUserId(sprtBizRegFile.getSysLastChgUserId());
        sprtBizClclnMngVO.setSysLastChgPrgrmId(sprtBizRegFile.getSysLastChgPrgrmId());

        // 지원사업정산문서
        if (sprtBizClclnDocInfo == null || !StringUtils.hasText(sprtBizClclnDocInfo.getSprtBizYr()) || !StringUtils.hasText(sprtBizClclnDocInfo.getSprtBizCd()) || !StringUtils.hasText(sprtBizClclnDocInfo.getSprtOgnzId())) {
            // 추가
            if (0 == sprtBizClclnMngMapper.insertSprtBizClclnDoc(sprtBizClclnMngVO)) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "교부결정서 신규 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        } else {
            // 업데이트
            if (0 == sprtBizClclnMngMapper.updateSprtBizClclnDoc(sprtBizClclnMngVO)) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "교부결정서 업데이트"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        }

        // 첨부파일저장
        sprtBizRegFile.setAtchFileSn(atchflSn);
        if ( 0 == sprtBizRegMngMapper.insertSprtAplyAtchfl(sprtBizRegFile)){
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "교부결정서 첨부파일등록"))); // E0003	{0} 시 오류가 발생하였습니다.
        }

        return null;
    }

    @Override
    public SprtBizRegFileVO selectSprtBizClclnAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception {

        return sprtBizClclnMngMapper.selectSprtBizClclnAtchfl(sprtBizRegFileVO);

    }

    @Override
    public List<SprtBizClclnMngVO> selectSprtBizClclnAplyList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {
        return sprtBizClclnMngMapper.selectSprtBizClclnAplyList(sprtBizClclnMngVO);
    }

    @Override
    public HashMap<String, Object> insertSprtclclnAplyFile(SprtBizRegFileVO sprtBizRegFile) throws Exception {

        String sprtBizYr = sprtBizRegFile.getSprtBizYr();
        String sprtBizCd = sprtBizRegFile.getSprtBizCd();
        String sprtOgnzId = sprtBizRegFile.getSprtOgnzId();

        if (!StringUtils.hasText(sprtBizYr)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizCd)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtOgnzId)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업조직아이디"); // {0}이/가 없습니다.
        }

        if (sprtBizRegFile.getDocSeq() == 0) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "문서순번"); // {0}이/가 없습니다.
        }

        SprtBizClclnMngVO sprtBizClclnMngVO = new SprtBizClclnMngVO();

        sprtBizClclnMngVO.setSprtBizYr(sprtBizYr);
        sprtBizClclnMngVO.setSprtBizCd(sprtBizCd);
        sprtBizClclnMngVO.setSprtOgnzId(sprtOgnzId);
        sprtBizClclnMngVO.setClclnSeq(sprtBizRegFile.getClclnSeq());
        sprtBizClclnMngVO.setDocSeq(sprtBizRegFile.getDocSeq());

        // 지원사업정산
        SprtBizClclnMngVO sprtBizClclnInfo = sprtBizClclnMngMapper.selectSprtBizClcln(sprtBizClclnMngVO);

        sprtBizClclnMngVO.setDocKnd("CLCLN_APLY");
        sprtBizClclnMngVO.setDocCd(sprtBizRegFile.getAplyDocCd());
        sprtBizClclnMngVO.setSysFrstInptUserId(sprtBizRegFile.getSysFrstInptUserId());
        sprtBizClclnMngVO.setSysFrstInptPrgrmId(sprtBizRegFile.getSysFrstInptPrgrmId());
        sprtBizClclnMngVO.setSysLastChgUserId(sprtBizRegFile.getSysLastChgUserId());
        sprtBizClclnMngVO.setSysLastChgPrgrmId(sprtBizRegFile.getSysLastChgPrgrmId());

        if (sprtBizClclnInfo == null || !StringUtils.hasText(sprtBizClclnInfo.getSprtBizYr()) || !StringUtils.hasText(sprtBizClclnInfo.getSprtBizCd()) || !StringUtils.hasText(sprtBizClclnInfo.getSprtOgnzId())) {
            if (0 == sprtBizClclnMngMapper.insertSprtBizClcln(sprtBizClclnMngVO)) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업정산 신규 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        }

        // 지원사업정산문서
        SprtBizClclnMngVO sprtBizClclnDocInfo= sprtBizClclnMngMapper.selectSprtBizClclnDoc(sprtBizClclnMngVO);

        long atchflSn = sprtBizRegMngMapper.selectNewSqEvSprtBizAtchflSn();

        sprtBizClclnMngVO.setAtchFileSn(atchflSn);

        // 지원사업정산문서
        if (sprtBizClclnDocInfo == null || !StringUtils.hasText(sprtBizClclnDocInfo.getSprtBizYr()) || !StringUtils.hasText(sprtBizClclnDocInfo.getSprtBizCd()) || !StringUtils.hasText(sprtBizClclnDocInfo.getSprtOgnzId())) {
            // 추가
            if (0 == sprtBizClclnMngMapper.insertSprtBizClclnDoc(sprtBizClclnMngVO)) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "정산요청서 신규 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        } else {
            if (ComConstants.CON_NONE.equals(sprtBizClclnDocInfo.getAprvYn())) {
                sprtBizClclnMngVO.setChgYn(ComConstants.CON_YES);
            } else if (ComConstants.CON_YES.equals(sprtBizClclnDocInfo.getAprvYn())) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_TARGET_EXIST, "이미 확인된 서류"))); // W0009	{0}이/가 있습니다.
            }
            // 업데이트
            if (0 == sprtBizClclnMngMapper.updateSprtBizClclnDoc(sprtBizClclnMngVO)) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "정산요청서 업데이트"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        }

        // 첨부파일저장
        sprtBizRegFile.setAtchFileSn(atchflSn);
        if ( 0 == sprtBizRegMngMapper.insertSprtAplyAtchfl(sprtBizRegFile)){
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "교부결정서 첨부파일등록"))); // E0003	{0} 시 오류가 발생하였습니다.
        }

        return null;
    }

    @Override
    public List<SprtBizClclnMngVO> selectSprtClclnFilePath(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {

        return sprtBizClclnMngMapper.selectSprtClclnFilePath(sprtBizClclnMngVO);
    }

    @Override
    public List<SprtBizClclnMngVO> selectSprtPrufCdList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {
        return sprtBizClclnMngMapper.selectSprtPrufCdList(sprtBizClclnMngVO);
    }

    @Override
    public SprtBizRegFileVO selectSprtClclnBizAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception {
        return sprtBizClclnMngMapper.selectSprtClclnBizAtchfl(sprtBizRegFileVO);
    }

    @Override
    public HashMap<String, Object> updateSprtBizAplyDoc(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {

        if (!StringUtils.hasText(sprtBizClclnMngVO.getSprtBizYr())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizClclnMngVO.getSprtBizCd())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizClclnMngVO.getSprtOgnzId())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업조직아이디"); // {0}이/가 없습니다.
        }

        if (sprtBizClclnMngVO.getClclnSeq() == 0) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산순서"); // {0}이/가 없습니다.
        }

        if (sprtBizClclnMngVO.getDocSeq() == 0) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "문서순서"); // {0}이/가 없습니다.
        }

        SprtBizClclnMngVO sprtClclnDocInfo = sprtBizClclnMngMapper.selectSprtBizClclnDoc(sprtBizClclnMngVO);

        if (sprtClclnDocInfo == null
                || !StringUtils.hasText(sprtClclnDocInfo.getSprtBizYr())
                || !StringUtils.hasText(sprtClclnDocInfo.getSprtBizCd())
                || !StringUtils.hasText(sprtClclnDocInfo.getSprtOgnzId())
                || sprtClclnDocInfo.getClclnSeq() == 0
                || sprtClclnDocInfo.getDocSeq() == 0
                || !ComConstants.CON_NONE.equals(sprtClclnDocInfo.getDelYn())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산신청문서등록내용");
        }

        if (0 == sprtBizClclnMngMapper.updateSprtClclnDoc(sprtBizClclnMngVO)){
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업신청문서 확인/미확인 업데이트"))); // E0003	{0} 시 오류가 발생하였습니다.
        }

        return null;
    }
}
