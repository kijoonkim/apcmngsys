package com.at.apcss.pd.sprt.mapper;

import com.at.apcss.pd.sprt.vo.SprtBizClclnMngVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface SprtBizClclnMngMapper {

    /**
     * 산지조직지원 정산관리 목록 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtBizDtbnMngList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;
}
