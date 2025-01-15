package com.at.apcss.am.spmt.service.impl;

import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.spmt.mapper.ShpgotMngMapper;
import com.at.apcss.am.spmt.service.ShpgotMngService;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrDtlVO;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrVO;
import com.at.apcss.am.spmt.vo.ShpgotApcRawMtrVO;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.HashMap;
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

    @Resource(name = "rawMtrInvntrService")
    private RawMtrInvntrService rawMtrInvntrService;

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

    @Override
    public int deleteShpgotApcCrtr(ShpgotApcCrtrVO shpgotApcCrtrVO) throws Exception {
        int resultCnt = 0;
        resultCnt = shpgotMngMapper.deleteShpgotApcCrtr(shpgotApcCrtrVO);
        if(resultCnt < 0){
            throw new EgovBizException();
        }
        ShpgotApcCrtrDtlVO shpgotApcCrtrDtlVO = new ShpgotApcCrtrDtlVO();

        BeanUtils.copyProperties(shpgotApcCrtrVO,shpgotApcCrtrDtlVO);
        shpgotMngMapper.deleteShpgotApcCrtrDtl(shpgotApcCrtrDtlVO);

        return resultCnt;
    }

    @Override
    public int deleteShpgotApcCrtrDtl(ShpgotApcCrtrDtlVO shpgotApcCrtrDtlVO) throws Exception {
        return shpgotMngMapper.deleteShpgotApcCrtrDtl(shpgotApcCrtrDtlVO);
    }

    @Override
    public int insertShpgotRawMtr(List<ShpgotApcRawMtrVO> shpgotApcRawMtrVOList) throws Exception {
        int insertCnt = 0;
        insertCnt = shpgotMngMapper.insertShpgotRawMtr(shpgotApcRawMtrVOList);
        if(insertCnt <= 0){
            throw new EgovBizException();
        }
        /** 재고 마이너스 **/
        String wrhsno = shpgotApcRawMtrVOList.get(0).getWrhsno();
        String apcCd = shpgotApcRawMtrVOList.get(0).getApcCd();
        String frstInptUserId = shpgotApcRawMtrVOList.get(0).getSysFrstInptUserId();
        String frstInptPrgrmId = shpgotApcRawMtrVOList.get(0).getSysFrstInptPrgrmId();
        String lastChgUserId = shpgotApcRawMtrVOList.get(0).getSysLastChgUserId();
        String lastChgPrgrmId = shpgotApcRawMtrVOList.get(0).getSysLastChgPrgrmId();

        /** 원물 입고 내역 조회 **/
        List<RawMtrInvntrVO> resultList;
        RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
        rawMtrInvntrVO.setApcCd(apcCd);
        rawMtrInvntrVO.setWrhsno(wrhsno);

        resultList = rawMtrInvntrService.selectRawMtrInvntrList(rawMtrInvntrVO);
        /** 입고실적 pk => apcCd, wrhsno 다중건 > exception **/
        if(resultList.size() > 1){
            throw new EgovBizException();
        }

        /** 반품 등록 생성의 토탈 수량, 중량 **/
        int totalShpgotQntt = 0;
        int totalShpgotWght = 0;
        for(ShpgotApcRawMtrVO vo : shpgotApcRawMtrVOList){
           totalShpgotQntt += vo.getShpgotQntt();
           totalShpgotWght += vo.getShpgotWght();
        }
        RawMtrInvntrVO updateVo = resultList.get(0);
        updateVo.setInvntrQntt(updateVo.getInvntrQntt() - totalShpgotQntt);
        updateVo.setInvntrWght(updateVo.getInvntrWght() - totalShpgotWght);
        updateVo.setSysFrstInptUserId(frstInptUserId);
        updateVo.setSysFrstInptPrgrmId(frstInptPrgrmId);
        updateVo.setSysLastChgUserId(lastChgUserId);
        updateVo.setSysLastChgPrgrmId(lastChgPrgrmId);

        int updateCnt = rawMtrInvntrService.updateRawMtrInvntr(updateVo);
        if(updateCnt < 0 ){
            throw new EgovBizException();
        }

        return insertCnt;
    }

    @Override
    public int deleteShpgotRawMtr(ShpgotApcRawMtrVO shpgotApcRawMtrVO) throws Exception {
        int deleteCnt = 0;
        deleteCnt = shpgotMngMapper.deleteShpgotRawMtr(shpgotApcRawMtrVO);
        if(deleteCnt <= 0){
            throw new EgovBizException();
        }
        /** 재고 플러스 **/
        String wrhsno = shpgotApcRawMtrVO.getWrhsno();
        String apcCd = shpgotApcRawMtrVO.getApcCd();
        String frstInptUserId = shpgotApcRawMtrVO.getSysFrstInptUserId();
        String frstInptPrgrmId = shpgotApcRawMtrVO.getSysFrstInptPrgrmId();
        String lastChgUserId = shpgotApcRawMtrVO.getSysLastChgUserId();
        String lastChgPrgrmId = shpgotApcRawMtrVO.getSysLastChgPrgrmId();

        /** 원물 입고 내역 조회 **/
        List<RawMtrInvntrVO> resultList;
        RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
        rawMtrInvntrVO.setApcCd(apcCd);
        rawMtrInvntrVO.setWrhsno(wrhsno);

        resultList = rawMtrInvntrService.selectRawMtrInvntrList(rawMtrInvntrVO);
        /** 입고실적 pk => apcCd, wrhsno 다중건 > exception **/
        if(resultList.size() > 1){
            throw new EgovBizException();
        }

        /** 반품 등록 생성의 토탈 수량, 중량 **/
        int totalShpgotQntt = shpgotApcRawMtrVO.getShpgotQntt();
        double totalShpgotWght = shpgotApcRawMtrVO.getShpgotWght();

        RawMtrInvntrVO updateVo = resultList.get(0);
        updateVo.setInvntrQntt(updateVo.getInvntrQntt() + totalShpgotQntt);
        updateVo.setInvntrWght(updateVo.getInvntrWght() + totalShpgotWght);
        updateVo.setSysFrstInptUserId(frstInptUserId);
        updateVo.setSysFrstInptPrgrmId(frstInptPrgrmId);
        updateVo.setSysLastChgUserId(lastChgUserId);
        updateVo.setSysLastChgPrgrmId(lastChgPrgrmId);

        int updateCnt = rawMtrInvntrService.updateRawMtrInvntr(updateVo);
        if(updateCnt < 0 ){
            throw new EgovBizException();
        }

        return deleteCnt;
    }
}
