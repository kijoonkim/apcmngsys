package com.at.apcss.am.dscd.service.impl;

import com.at.apcss.am.dscd.mapper.DscdCrtrMapper;
import com.at.apcss.am.dscd.mapper.InvntrDscdMapper;
import com.at.apcss.am.dscd.service.InvntrDscdService;
import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.dscd.vo.DscdPrfmncVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("invntrDscdService")
public class InvntrDscdServiceImpl extends BaseServiceImpl implements InvntrDscdService {

    @Autowired
    private InvntrDscdMapper invntrDscdMapper;

    @Override
    public List<DscdPrfmncVO> selectRawMtrInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception {
        List<DscdPrfmncVO> resultList = invntrDscdMapper.selectRawMtrInvntrList(dscdPrfmncVO);
        return resultList;
    }

    @Override
    public List<DscdPrfmncVO> selectSortInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception {
        List<DscdPrfmncVO> resultList = invntrDscdMapper.selectSortInvntrList(dscdPrfmncVO);
        return resultList;
    }

    @Override
    public List<DscdPrfmncVO> selectGdsInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception {
        List<DscdPrfmncVO> resultList = invntrDscdMapper.selectGdsInvntrList(dscdPrfmncVO);
        return resultList;
    }


    @Override
    public int insertDscdRegList(List<DscdPrfmncVO> dscdRegList) throws Exception {
        int insertDscdRegCnt = 0;

        for(DscdPrfmncVO dscdPrfmncVO : dscdRegList){
            String invntrSeCd = dscdPrfmncVO.getInvntrSeCd();
            if(invntrSeCd.equals("1")){
                int invntrQntt = dscdPrfmncVO.getInvntrQntt(); //입고수량
                double invntrWght = dscdPrfmncVO.getInvntrWght(); //입고중량

                int dscdQntt = dscdPrfmncVO.getDscdQntt();//폐기수량
                double dscdWght = dscdPrfmncVO.getDscdWght();//폐기 중량

                int prvPrcsQntt = dscdPrfmncVO.getPrcsQntt();//처리수량
                double prvPrcsWght = dscdPrfmncVO.getPrcsWght();//처리중량


                dscdPrfmncVO.setInvntrQntt(invntrQntt - dscdQntt);
                dscdPrfmncVO.setInvntrWght(invntrWght - dscdWght);
                dscdPrfmncVO.setPrcsQntt(prvPrcsQntt + dscdQntt);
                dscdPrfmncVO.setPrcsWght(prvPrcsWght + dscdWght);

                int updateRawInvntrCnt = invntrDscdMapper.updateRawInvntr(dscdPrfmncVO);
                if(updateRawInvntrCnt < 0){
                    throw new EgovBizException();
                }
            } else if (invntrSeCd.equals("2")) {
                int invntrQntt = dscdPrfmncVO.getInvntrQntt(); //입고수량
                double invntrWght = dscdPrfmncVO.getInvntrWght(); //입고중량

                int dscdQntt = dscdPrfmncVO.getDscdQntt();//폐기수량
                double dscdWght = dscdPrfmncVO.getDscdWght();//폐기 중량

                dscdPrfmncVO.setInvntrQntt(invntrQntt - dscdQntt);
                dscdPrfmncVO.setInvntrWght(invntrWght - dscdWght);
                int updateSortInvntrCnt = invntrDscdMapper.updateSortInvntrCnt(dscdPrfmncVO);
                if(updateSortInvntrCnt < 0 ){
                    throw new EgovBizException();
                }
            } else if (invntrSeCd.equals("3")) {
                int invntrQntt = dscdPrfmncVO.getInvntrQntt(); //입고수량
                double invntrWght = dscdPrfmncVO.getInvntrWght(); //입고중량

                int dscdQntt = dscdPrfmncVO.getDscdQntt();//폐기수량
                double dscdWght = dscdPrfmncVO.getDscdWght();//폐기 중량

                dscdPrfmncVO.setInvntrQntt(invntrQntt - dscdQntt);
                dscdPrfmncVO.setInvntrWght(invntrWght - dscdWght);
                int updateGdsInvntrCnt = invntrDscdMapper.updateGdsInvntrCnt(dscdPrfmncVO);
                if(updateGdsInvntrCnt < 0 ){
                    throw new EgovBizException();
                }
            }

            insertDscdRegCnt = invntrDscdMapper.insertDscdRegList(dscdPrfmncVO);
            if(insertDscdRegCnt < 0){
                throw new EgovBizException();
            }
        }
        return insertDscdRegCnt;
    }

    @Override
    public List<DscdPrfmncVO> selectDscdPrfmncList(DscdPrfmncVO dscdPrfmncVO) throws Exception {
        List<DscdPrfmncVO> resultList = invntrDscdMapper.selectDscdPrfmncList(dscdPrfmncVO);
        return resultList;
    }

    @Override
    public int deleteDscdPrfmnc(List<DscdPrfmncVO> dscdPrfmncList) throws Exception {
        int resultCnt = 0;
        for(DscdPrfmncVO dscdPrfmncVO : dscdPrfmncList){
            String invntrSeCd = dscdPrfmncVO.getInvntrSeCd();
            if(invntrSeCd.equals("1")){
                DscdPrfmncVO selectRawMtrInvntr = invntrDscdMapper.selectRawMtrInvntr(dscdPrfmncVO);
                dscdPrfmncVO.setInvntrQntt(selectRawMtrInvntr.getInvntrQntt()+dscdPrfmncVO.getDscdQntt());
                dscdPrfmncVO.setInvntrWght(selectRawMtrInvntr.getInvntrWght()+dscdPrfmncVO.getDscdWght());
                int updatePrfmncRawInvntr = invntrDscdMapper.updatePrfmncRawInvntr(dscdPrfmncVO);
                if(updatePrfmncRawInvntr < 0){
                    throw new EgovBizException();
                }
                resultCnt = invntrDscdMapper.deleteDscdPrfmnc(dscdPrfmncVO);
            } else if (invntrSeCd.equals("2")) {
                DscdPrfmncVO selectSortInvntr = invntrDscdMapper.selectSortInvntr(dscdPrfmncVO);
                dscdPrfmncVO.setInvntrQntt(selectSortInvntr.getInvntrQntt()+dscdPrfmncVO.getDscdQntt());
                dscdPrfmncVO.setInvntrWght(selectSortInvntr.getInvntrWght()+dscdPrfmncVO.getDscdWght());
                int updatePrfmncSortInvntr = invntrDscdMapper.updatePrfmncSortInvntr(dscdPrfmncVO);
                if(updatePrfmncSortInvntr < 0){
                    throw new EgovBizException();
                }
                resultCnt = invntrDscdMapper.deleteDscdPrfmnc(dscdPrfmncVO);
            } else if(invntrSeCd.equals("3")){
                DscdPrfmncVO selectGdsInvntr = invntrDscdMapper.selectGdsInvntr(dscdPrfmncVO);
                dscdPrfmncVO.setInvntrQntt(selectGdsInvntr.getInvntrQntt()+dscdPrfmncVO.getDscdQntt());
                dscdPrfmncVO.setInvntrWght(selectGdsInvntr.getInvntrWght()+dscdPrfmncVO.getDscdWght());
                int updatePrfmncGdsInvntr = invntrDscdMapper.updatePrfmncGdsInvntr(dscdPrfmncVO);
                if(updatePrfmncGdsInvntr < 0){
                    throw new EgovBizException();
                }
                resultCnt = invntrDscdMapper.deleteDscdPrfmnc(dscdPrfmncVO);
            }
            if(resultCnt < 0){
                throw new EgovBizException();
            }
        }
        return resultCnt;
    }




}
