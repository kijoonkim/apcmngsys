package com.at.apcss.am.spmt.service.impl;

import com.at.apcss.am.spmt.mapper.ShpgotMngMapper;
import com.at.apcss.am.spmt.service.ShpgotMngService;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrDtlVO;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrVO;
import com.at.apcss.am.spmt.vo.ShpgotApcRawMtrVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

/**
 * @Class Name : ShpgotMngServiceImpl.java
 * @Description : 반품 기준 관리에 대한 Service 클래스
 * @author 손민성
 * @since 2025.01.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.04  손민성        최초 생성
 * </pre>
 */
@Service("shpgotMngService")
public class ShpgotMngServiceImpl extends BaseServiceImpl implements ShpgotMngService {

    @Autowired
    private ShpgotMngMapper shpgotMngMapper;

    @Override
    public int insertShpgotApcCrtr(List<ShpgotApcCrtrVO> shpgotApcCrtrVoList, List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList) throws Exception {
        int insertCnt = 0;
        insertCnt = shpgotMngMapper.insertShpgotApcCrtr(shpgotApcCrtrVoList);
        if(insertCnt < 0){
            throw new EgovBizException();
        }

        int dtlCnt = 0;
        try{
            dtlCnt = insertShpgotApcCrtrDtl(shpgotApcCrtrDtlVoList);
        }catch (Exception e){
            throw new EgovBizException(e.getMessage());
        }

        return insertCnt;
    }

    @Override
    public int insertShpgotApcCrtr(ShpgotApcCrtrVO shpgotApcCrtrVo) throws Exception {
        int insertCnt = 0;
        insertCnt = shpgotMngMapper.insertShpgotApcCrtrSingle(shpgotApcCrtrVo);
        if(insertCnt < 0){
            throw new EgovBizException();
        }
        return insertCnt;
    }

    @Override
    public int insertShpgotApcCrtr(List<ShpgotApcCrtrVO> shpgotApcCrtrVoList) throws Exception {
        int insertCnt = 0;
        insertCnt = shpgotMngMapper.insertShpgotApcCrtr(shpgotApcCrtrVoList);
        if(insertCnt < 0){
            throw new EgovBizException();
        }
        return insertCnt;
    }

    @Override
    public int insertShpgotApcCrtrDtl(List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVoList) throws Exception {
        return shpgotMngMapper.insertShpgotApcCrtrDtl(shpgotApcCrtrDtlVoList);
    }

    @Override
    public List<ShpgotApcCrtrVO> selectShpgotApcCrtrList(ShpgotApcCrtrVO shpgotApcCrtrVO) throws Exception {
        return shpgotMngMapper.selectShpgotApcCrtrList(shpgotApcCrtrVO);
    }

    @Override
    public List<ShpgotApcCrtrDtlVO> selectShpgotApcCrtrDtlList(ShpgotApcCrtrVO shpgotApcCrtrVO) throws Exception {
        return  shpgotMngMapper.selectShpgotApcCrtrDtlList(shpgotApcCrtrVO);
    }

    @Override
    public List<ShpgotApcRawMtrVO> selectShpgotRawMtr(ShpgotApcRawMtrVO shpgotApcRawMtrVO) throws Exception {
        return shpgotMngMapper.selectShpgotRawMtr(shpgotApcRawMtrVO);
    }
}
