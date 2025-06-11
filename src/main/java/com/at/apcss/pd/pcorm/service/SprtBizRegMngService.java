package com.at.apcss.pd.pcorm.service;

import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegMngVO;

import java.util.HashMap;
import java.util.List;

public interface SprtBizRegMngService {

    /**
     * 산지조직지원신청관리 신청목록 조회
     * @param sprtBizRegMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizRegMngVO> selectApoSprtAplyList(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

    /**
     * 산지조직지원신청관리 저장
     * @param sprtBizRegMngList
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> updateSprtAplyList(List<SprtBizRegMngVO> sprtBizRegMngList) throws Exception;

    /**
     * 지원사업신청 파일 저장
     * @param sprtBizRegFile
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> insertSprtAplyFile(SprtBizRegFileVO sprtBizRegFile) throws Exception;

    /**
     * 지원사업신청 파일경로 조회
     * @param sprtBizRegMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizRegMngVO> selectSprtBizFilePath(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

    /**
     * 지원사업신청 팝업 - 확인/미확인 업데이트
     * @param sprtBizRegMngVO
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> updateSprtBizAplyDoc(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

    /**
     * 지원사업신청 팝업 - 파일정보조회
     * @param sprtBizRegFileVO
     * @return
     * @throws Exception
     */
    public SprtBizRegFileVO selectSprtBizAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;
}
