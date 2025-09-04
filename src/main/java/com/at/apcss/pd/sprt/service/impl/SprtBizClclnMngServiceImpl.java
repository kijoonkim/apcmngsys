package com.at.apcss.pd.sprt.service.impl;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.pd.pcorm.mapper.SprtBizRegMngMapper;
import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.sprt.mapper.SprtBizClclnMngMapper;
import com.at.apcss.pd.sprt.service.SprtBizClclnMngService;
import com.at.apcss.pd.sprt.vo.SprtBizClclnDmndDocVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnDmndDtlVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnMngVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    @Override
    public HashMap<String, Object> insertClclnDDocReg(SprtBizClclnDmndDocVO sprtBizClclnDmndDocVO) throws Exception {

        String sprtBizYr = sprtBizClclnDmndDocVO.getSprtBizYr();
        String sprtBizCd = sprtBizClclnDmndDocVO.getSprtBizCd();
        String sprtOgnzId = sprtBizClclnDmndDocVO.getSprtOgnzId();
        int clclnSeq = sprtBizClclnDmndDocVO.getClclnSeq();

        if (!StringUtils.hasText(sprtBizYr)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizCd)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtOgnzId)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업조직아이디"); // {0}이/가 없습니다.
        }

        if (clclnSeq == 0) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산순서"); // {0}이/가 없습니다.
        }

        List<SprtBizClclnDmndDtlVO> clclnDmndList = sprtBizClclnDmndDocVO.getClclnDInfoList();

        if (clclnDmndList == null || clclnDmndList.isEmpty()) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산요청 대상");
        }

        List<SprtBizClclnDmndDtlVO> fileInfoList = sprtBizClclnDmndDocVO.getClclnFileInfoList();
        // SprtBizClclnDmndDtlVO.getSeq()를 기준으로 그룹핑
        Map<Integer, List<SprtBizClclnDmndDtlVO>> filesBySeq = fileInfoList.stream().collect(Collectors.groupingBy(SprtBizClclnDmndDtlVO::getSeq));

        // 정산요청
        for ( SprtBizClclnDmndDtlVO clclnDmnd : clclnDmndList ) {
            clclnDmnd.setSprtBizYr(sprtBizYr);
            clclnDmnd.setSprtBizCd(sprtBizCd);
            clclnDmnd.setSprtOgnzId(sprtOgnzId);
            clclnDmnd.setClclnSeq(clclnSeq);

            // 요청순서
            int maxDmndSeq = sprtBizClclnMngMapper.selectClclnDmndSeq(clclnDmnd);
            ++maxDmndSeq;

            clclnDmnd.setDmndSeq(maxDmndSeq);
            // 지원사업 정산요청
            // 조회
            SprtBizClclnDmndDtlVO clclnDmndVO = sprtBizClclnMngMapper.selectClclnDmnd(clclnDmnd);

            clclnDmnd.setSysFrstInptUserId(sprtBizClclnDmndDocVO.getSysFrstInptUserId());
            clclnDmnd.setSysFrstInptPrgrmId(sprtBizClclnDmndDocVO.getSysFrstInptPrgrmId());
            clclnDmnd.setSysLastChgUserId(sprtBizClclnDmndDocVO.getSysLastChgUserId());
            clclnDmnd.setSysLastChgPrgrmId(sprtBizClclnDmndDocVO.getSysLastChgPrgrmId());

            if ( clclnDmndVO == null ) {
                if ( 0 == sprtBizClclnMngMapper.insertClclnDmnd(clclnDmnd)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업정산요청 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
                }
            }

            int seq = clclnDmnd.getSeq(); // 정산요청과 요청문서를 맞추기위한 seq
            /** 파일이 있을 때만 **/
            if (!filesBySeq.isEmpty() && filesBySeq.get(seq) != null && !filesBySeq.get(seq).isEmpty()) {
                // 지원사업 정산요청문서

                List<SprtBizClclnDmndDtlVO> fileInfoBySeq = filesBySeq.get(seq);

                int docSeq = 0; // 문서순번
                for ( SprtBizClclnDmndDtlVO docVO :fileInfoBySeq) {
                    docSeq++;
                    docVO.setDmndSeq(maxDmndSeq); // 요청순번
                    docVO.setDocSeq(docSeq); // 문서순번

                    // 첨부파일일련번호
                    long atchflSn = sprtBizRegMngMapper.selectNewSqEvSprtBizAtchflSn();
                    docVO.setAtchFileSn(atchflSn);

                    docVO.setSprtBizYr(sprtBizYr);
                    docVO.setSprtBizCd(sprtBizCd);
                    docVO.setSprtOgnzId(sprtOgnzId);
                    docVO.setClclnSeq(clclnSeq);

                    docVO.setSysFrstInptUserId(sprtBizClclnDmndDocVO.getSysFrstInptUserId());
                    docVO.setSysFrstInptPrgrmId(sprtBizClclnDmndDocVO.getSysFrstInptPrgrmId());
                    docVO.setSysLastChgUserId(sprtBizClclnDmndDocVO.getSysLastChgUserId());
                    docVO.setSysLastChgPrgrmId(sprtBizClclnDmndDocVO.getSysLastChgPrgrmId());

                    SprtBizClclnDmndDtlVO clclnDmndDocInfo = sprtBizClclnMngMapper.selectClclnDmndDoc(docVO);
                    if (clclnDmndDocInfo == null) {
                        if (0 == sprtBizClclnMngMapper.insertClclnDmndDoc(docVO)){
                            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업정산요청문서 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
                        }

                        // 첨부파일저장
                        SprtBizRegFileVO fileVO = new SprtBizRegFileVO();
                        BeanUtils.copyProperties(docVO, fileVO);
                        fileVO.setAtchFileSn(atchflSn);

                        if ( 0 == sprtBizRegMngMapper.insertSprtAplyAtchfl(fileVO)){
                            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "정산증빙 첨부파일등록"))); // E0003	{0} 시 오류가 발생하였습니다.
                        }
                    }

                }
            }


        }

        return null;
    }

    @Override
    public List<SprtBizClclnMngVO> selectSprtClclnRsltList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception {
        return sprtBizClclnMngMapper.selectSprtClclnRsltList(sprtBizClclnMngVO);
    }

    @Override
    public HashMap<String, Object> updateClclnAprvAmt(List<SprtBizClclnMngVO> clclnUpdateList) throws Exception {

        for (SprtBizClclnMngVO clclnVO : clclnUpdateList) {
            String sprtBizYr = clclnVO.getSprtBizYr();
            String sprtBizCd = clclnVO.getSprtBizCd();
            String sprtOgnzId = clclnVO.getSprtOgnzId();
            int clclnSeq = clclnVO.getClclnSeq();

            if (!StringUtils.hasText(sprtBizYr)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
            }

            if (!StringUtils.hasText(sprtBizCd)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
            }

            if (!StringUtils.hasText(sprtOgnzId)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업조직아이디"); // {0}이/가 없습니다.
            }

            if (clclnSeq == 0) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산순서"); // {0}이/가 없습니다.
            }

            SprtBizClclnMngVO clclnInfo = sprtBizClclnMngMapper.selectSprtBizClcln(clclnVO);
            if (clclnInfo == null
                    || !StringUtils.hasText(clclnInfo.getSprtBizYr())
                    || !StringUtils.hasText(clclnInfo.getSprtBizCd())
                    || !StringUtils.hasText(clclnInfo.getSprtOgnzId())
                    || clclnInfo.getClclnSeq() == 0 ){
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업정산 등록 내용");
            }

            // update처리하는거 작성하기
            if ( 0 == sprtBizClclnMngMapper.updateClclnAprvAmt(clclnVO)) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "정산인정액 변경"))); // E0003	{0} 시 오류가 발생하였습니다.
            }
        }

        return null;
    }

    @Override
    public List<SprtBizClclnDmndDtlVO> selectClclnPrufList(SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO) throws Exception {
        return sprtBizClclnMngMapper.selectClclnPrufList(sprtBizClclnDmndDtlVO);
    }

    @Override
    public HashMap<String, Object> updateClclnPrufDoc(SprtBizClclnDmndDocVO sprtBizClclnDmndDocVO) throws Exception {

        String sprtBizYr = sprtBizClclnDmndDocVO.getSprtBizYr();
        String sprtBizCd = sprtBizClclnDmndDocVO.getSprtBizCd();
        String sprtOgnzId = sprtBizClclnDmndDocVO.getSprtOgnzId();
        int clclnSeq = sprtBizClclnDmndDocVO.getClclnSeq();

        if (!StringUtils.hasText(sprtBizYr)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizCd)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtOgnzId)) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업조직아이디"); // {0}이/가 없습니다.
        }

        if (clclnSeq == 0) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산순서"); // {0}이/가 없습니다.
        }

        List<SprtBizClclnDmndDtlVO> clclnDmndList = sprtBizClclnDmndDocVO.getClclnDInfoList();

        if (clclnDmndList == null || clclnDmndList.isEmpty()) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산요청 대상");
        }

        List<SprtBizClclnDmndDtlVO> fileInfoList = sprtBizClclnDmndDocVO.getClclnFileInfoList();
        // SprtBizClclnDmndDtlVO.getSeq()를 기준으로 그룹핑
        Map<Integer, List<SprtBizClclnDmndDtlVO>> filesByDmndSeq = fileInfoList.stream().collect(Collectors.groupingBy(SprtBizClclnDmndDtlVO::getDmndSeq));

        // 지원사업정산요청
        for ( SprtBizClclnDmndDtlVO clclnDmnd : clclnDmndList ) {
            clclnDmnd.setSprtBizYr(sprtBizYr);
            clclnDmnd.setSprtBizCd(sprtBizCd);
            clclnDmnd.setSprtOgnzId(sprtOgnzId);
            clclnDmnd.setClclnSeq(clclnSeq);

            int dmndSeq = clclnDmnd.getDmndSeq();

            if (clclnSeq == 0) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "요청순번"); // {0}이/가 없습니다.
            }

            // 정산요청 조회
            SprtBizClclnDmndDtlVO clclnDmndVO = sprtBizClclnMngMapper.selectClclnDmnd(clclnDmnd);
            if (clclnDmndVO == null) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND_TARGET_TODO, "정산요청 업데이트"); // W0003	{0}할 대상이 없습니다.
            }
            clclnDmnd.setSysLastChgUserId(sprtBizClclnDmndDocVO.getSysLastChgUserId());
            clclnDmnd.setSysLastChgPrgrmId(sprtBizClclnDmndDocVO.getSysLastChgPrgrmId());

            if ( 0 == sprtBizClclnMngMapper.updateClclnDmnd(clclnDmnd)) {
                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업정산요청 수정"))); // E0003	{0} 시 오류가 발생하였습니다.
            }

            /** 파일이 있을 때만 **/
            if (!filesByDmndSeq.isEmpty() && filesByDmndSeq.get(dmndSeq) != null && !filesByDmndSeq.get(dmndSeq).isEmpty()) {

                List<SprtBizClclnDmndDtlVO> fileInfoByDmndSeq = filesByDmndSeq.get(dmndSeq);

                int docSeq = sprtBizClclnMngMapper.selectDocSeq(clclnDmnd); // 문서순번
                if (!fileInfoByDmndSeq.isEmpty() && fileInfoByDmndSeq != null) {
                    for ( SprtBizClclnDmndDtlVO docVO :fileInfoByDmndSeq) {
                        ++docSeq;
                        docVO.setDmndSeq(dmndSeq); // 요청순번
                        docVO.setDocSeq(docSeq); // 문서순번

                        // 첨부파일일련번호
                        long atchflSn = sprtBizRegMngMapper.selectNewSqEvSprtBizAtchflSn();
                        docVO.setAtchFileSn(atchflSn);

                        docVO.setSprtBizYr(sprtBizYr);
                        docVO.setSprtBizCd(sprtBizCd);
                        docVO.setSprtOgnzId(sprtOgnzId);
                        docVO.setClclnSeq(clclnSeq);

                        docVO.setSysFrstInptUserId(sprtBizClclnDmndDocVO.getSysFrstInptUserId());
                        docVO.setSysFrstInptPrgrmId(sprtBizClclnDmndDocVO.getSysFrstInptPrgrmId());
                        docVO.setSysLastChgUserId(sprtBizClclnDmndDocVO.getSysLastChgUserId());
                        docVO.setSysLastChgPrgrmId(sprtBizClclnDmndDocVO.getSysLastChgPrgrmId());

                        SprtBizClclnDmndDtlVO clclnDmndDocInfo = sprtBizClclnMngMapper.selectClclnDmndDoc(docVO);
                        if (clclnDmndDocInfo == null) {
                            if (0 == sprtBizClclnMngMapper.insertClclnDmndDoc(docVO)){
                                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "지원사업정산요청문서 추가 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
                            }
                            // 첨부파일저장
                            SprtBizRegFileVO fileVO = new SprtBizRegFileVO();
                            BeanUtils.copyProperties(docVO, fileVO);
                            fileVO.setAtchFileSn(atchflSn);

                            if ( 0 == sprtBizRegMngMapper.insertSprtAplyAtchfl(fileVO)){
                                throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "정산증빙 첨부파일 추가 등록"))); // E0003	{0} 시 오류가 발생하였습니다.
                            }
                        }

                    }
                }

            }

        }

        return null;
    }

    @Override
    public HashMap<String, Object> deleteClclnPrufDoc(SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO) throws Exception {

        if (!StringUtils.hasText(sprtBizClclnDmndDtlVO.getSprtBizYr())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업연도"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizClclnDmndDtlVO.getSprtBizCd())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업코드"); // {0}이/가 없습니다.
        }

        if (!StringUtils.hasText(sprtBizClclnDmndDtlVO.getSprtOgnzId())) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업조직아이디"); // {0}이/가 없습니다.
        }

        if (sprtBizClclnDmndDtlVO.getClclnSeq() == 0) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "정산순서"); // {0}이/가 없습니다.
        }

        if (sprtBizClclnDmndDtlVO.getDmndSeq() == 0) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "요청순서"); // {0}이/가 없습니다.
        }

        SprtBizClclnDmndDtlVO dmndDocInfo = sprtBizClclnMngMapper.selectClclnDmndDoc(sprtBizClclnDmndDtlVO);

        if (dmndDocInfo == null) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "지원사업정산요청문서 등록 내용"); // W0005	{0}이/가 없습니다.
        }

        if ( 0 == sprtBizClclnMngMapper.deleteClclnPrufDoc(sprtBizClclnDmndDtlVO)) {
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "증빙서류 삭제"))); // E0003	{0} 시 오류가 발생하였습니다.
        }

        if ( 0 == sprtBizClclnMngMapper.deleteSprtAtchFile(sprtBizClclnDmndDtlVO)) {
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_PARAM_ONE, "첨부파일 삭제"))); // E0003	{0} 시 오류가 발생하였습니다.
        }

        return null;
    }

    @Override
    public SprtBizRegFileVO selectSprtClclnPrufAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception {
        return sprtBizClclnMngMapper.selectSprtClclnPrufAtchfl(sprtBizRegFileVO);
    }

    @Override
    public List<SprtBizClclnDmndDtlVO> selectSprtClclnPrufDocList(SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO) throws Exception {
        return sprtBizClclnMngMapper.selectSprtClclnPrufDocList(sprtBizClclnDmndDtlVO);
    }
}
