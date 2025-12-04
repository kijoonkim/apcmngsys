package com.apcmngsys.apcss.am.clcln.service.impl;

import com.apcmngsys.apcss.am.clcln.mapper.ClclnRsltMapper;
import com.apcmngsys.apcss.am.clcln.mapper.ClclnSortMapper;
import com.apcmngsys.apcss.am.clcln.service.ClclnSortService;
import com.apcmngsys.apcss.am.clcln.vo.ClclnDtlVO;
import com.apcmngsys.apcss.am.clcln.vo.ClclnMstrVO;
import com.apcmngsys.apcss.co.constants.ComConstants;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service("clclnSortService")
public class ClclnSortServiceImpl implements ClclnSortService {

    @Autowired
    private ClclnSortMapper clclnSortMapper;

    /**
     * 선별 정산 저장
     * @param mstrList,dtlList
     * @return
     * @throws Exception
     */
    @Override
    public int insertSortClcln(List<ClclnMstrVO> mstrList, List<ClclnDtlVO> dtlList) throws Exception {
        int mstrCnt = 0;
        int dtlCnt = 0;
        try{
            mstrCnt = clclnSortMapper.insertSortClclnMstr(mstrList);
            if(mstrCnt == 0){
                throw new EgovBizException();
            }
            dtlCnt = clclnSortMapper.insertSortClclnDtl(dtlList);
            if(dtlCnt == 0){
                throw new EgovBizException();
            }
        }catch (Exception e){
            throw new EgovBizException(ComConstants.RESULT_MESSAGE_DEFAULT, e);
        }
        return mstrCnt;
    }

    /**
     * 선별 정산 결과조회
     * @param clclnMstrVO
     * @return List<ClclnDtlVO>
     * @throws Exception
     */
    @Override
    public List<HashMap<String, Object>> selectSortClclnList(ClclnMstrVO clclnMstrVO) throws Exception {
        List<HashMap<String, Object>> resultList = new ArrayList<>();
        try{
            resultList = clclnSortMapper.selectSortClclnList(clclnMstrVO);
        }catch (Exception e){
            throw new EgovBizException(ComConstants.RESULT_MESSAGE_DEFAULT, e);
        }
        return resultList;
    }
}
