package com.at.apcss.pd.sprt.service;

import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
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
}
