package com.at.apcss.pd.sprt.service;

import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegMngVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnDmndDocVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnDmndDtlVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnMngVO;

import java.util.HashMap;
import java.util.List;

public interface SprtBizClclnMngService {

    /**
     * 산지조직지원 정산관리 목록 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtBizDtbnMngList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 정산관리 교부신청서 파일 저장
     * @param sprtBizRegFile
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertSprtDtbnAplyFile(SprtBizRegFileVO sprtBizRegFile) throws Exception;

    /**
     * 산지조직지원 정산관리 교부결정서 파일 저장
     * @param sprtBizRegFile
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertDtbnDcsnDocFile(SprtBizRegFileVO sprtBizRegFile) throws Exception;

    /**
     * 산지조직지원 정산관리 첨부파일 조회
     * @param sprtBizRegFileVO
     * @return
     * @throws Exception
     */
    public SprtBizRegFileVO selectSprtBizClclnAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;

    /**
     * 산지조직지원 정산관리 - 정산신청 목록조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtBizClclnAplyList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 정산관리 - 정산신청 정산요청서 파일 저장
     * @param sprtBizRegFile
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertSprtclclnAplyFile(SprtBizRegFileVO sprtBizRegFile) throws Exception;

    /**
     * 산지조직지원 정산관리 - 정산문서파일경로 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtClclnFilePath(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 정산관리 - 증빙코드 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtPrufCdList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 지원사업정산 팝업 - 파일정보조회
     * @param sprtBizRegFileVO
     * @return
     * @throws Exception
     */
    public SprtBizRegFileVO selectSprtClclnBizAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;

    /**
     * 지원사업정산문서 승인업데이트
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> updateSprtBizAplyDoc(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 정산증빙서류 파일등록
     * @param sprtBizClclnDmndDocVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertClclnDDocReg(SprtBizClclnDmndDocVO sprtBizClclnDmndDocVO) throws Exception;

    /**
     * 정산결과 목록 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtClclnRsltList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 정산결과 정산인정액 수정
     * @param clclnUpdateList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> updateClclnAprvAmt(List<SprtBizClclnMngVO> clclnUpdateList) throws Exception;

    /**
     * 정산신청 증빙조회
     * @param sprtBizClclnDmndDtlVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnDmndDtlVO> selectClclnPrufList(SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO) throws Exception;

    /**
     * 증빙서류내용 수정(내용/파일추가)
     * @param sprtBizClclnDmndDocVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> updateClclnPrufDoc(SprtBizClclnDmndDocVO sprtBizClclnDmndDocVO) throws Exception;

    /**
     * 증빙서류삭제
     * @param sprtBizClclnDmndDtlVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> deleteClclnPrufDoc(SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO) throws Exception;

    /**
     * 지원사업정산 증빙서류 팝업 - 파일정보조회
     * @param sprtBizRegFileVO
     * @return
     * @throws Exception
     */
    public SprtBizRegFileVO selectSprtClclnPrufAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;
}
