package com.at.apcss.am.spmt.service.impl;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.cmns.service.*;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.PltWrhsSpmtService;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.spmt.mapper.SpmtPrfmncMapper;
import com.at.apcss.am.spmt.service.SpmtMngService;
import com.at.apcss.am.spmt.vo.SpmtPrfmncComVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : SpmtMngServiceImpl.java
 * @Description : 출하관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2025.04.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.04.21  신정철        최초 생성
 * </pre>
 */
@Service("spmtMngService")
public class SpmtMngServiceImpl extends BaseServiceImpl implements SpmtMngService {

    @Autowired
    private SpmtPrfmncMapper spmtPrfmncMapper;

    // 재고서비스
    @Resource(name= "gdsInvntrService")
    private GdsInvntrService gdsInvntrService;

    // 업무별 발번
    @Resource(name= "cmnsTaskNoService")
    private CmnsTaskNoService cmnsTaskNoService;

    // 공통 유효성 확인
    @Resource(name = "cmnsValidationService")
    private CmnsValidationService cmnsValidationService;

    // 생산자정보 서비스
    @Resource(name= "prdcrService")
    private PrdcrService prdcrService;

    // 품종정보 서비스
    @Resource(name= "cmnsVrtyService")
    private CmnsVrtyService cmnsVrtyService;

    // 출하포장단위 서비스
    @Resource(name = "spmtPckgUnitService")
    private SpmtPckgUnitService spmtPckgUnitService;

    // 상품코드 서비스
    @Resource(name = "cmnsGdsService")
    private CmnsGdsService cmnsGdsService;

    //선별서비스
    @Resource(name= "sortInvntrService")
    private SortInvntrService sortInvntrService;

    // 팔레트 서비스
    @Resource(name = "pltWrhsSpmtService")
    private PltWrhsSpmtService pltWrhsSpmtService;

    // 공통코드 서비스
    @Resource(name="comCdService")
    private ComCdService comCdService;

    // APC 환경설정 서비스
    @Resource(name = "apcEvrmntStngService")
    private ApcEvrmntStngService apcEvrmntStngService;

    @Override
    public HashMap<String, Object> insertSpmtPrfmnc(SpmtPrfmncComVO spmtPrfmncComVO) throws Exception {

        HashMap<String, Object> rtnObj;     // 오류 return 객체

        String apcCd = spmtPrfmncComVO.getApcCd();
        String spmtYmd = spmtPrfmncComVO.getSpmtYmd();

        String wghno = spmtPrfmncComVO.getWghno();
        String vhclno = spmtPrfmncComVO.getVhclno();

        // 옵션항목에 따라 선택적 유효성 확인

        // 공통 VO 필수값
        String sysFrstInptUserId = spmtPrfmncComVO.getSysFrstInptPrgrmId();
        String sysFrstInptPrgrmId = spmtPrfmncComVO.getSysFrstInptPrgrmId();
        String sysLastChgUserId = spmtPrfmncComVO.getSysLastChgUserId();
        String sysLastChgPrgrmId = spmtPrfmncComVO.getSysLastChgPrgrmId();

        // 등록할 출하상세 목록 확인
        List<SpmtPrfmncVO> spmtPrfmncTempList = spmtPrfmncComVO.getSpmtPrfmncList();
        if (spmtPrfmncTempList == null || spmtPrfmncTempList.isEmpty()) {
            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하대상");
        }

        // 실제 처리(등록)할 출하상세 목록
        List<SpmtPrfmncVO> spmtPrfmncList = new ArrayList<>();

        // 포장번호가 있는 항목을 우선 처리하기 위해 loop 2회
        for ( SpmtPrfmncVO spmt : spmtPrfmncTempList ) {

            if (spmt.getSpmtQntt() <= 0) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하수량");
            }

            if (StringUtils.hasText(spmt.getPckgno()) && spmt.getPckgSn() > 0) {
                SpmtPrfmncVO copyVO = new SpmtPrfmncVO();
                BeanUtils.copyProperties(spmt, copyVO);
                spmtPrfmncList.add(copyVO);
            }
        }

        // 포장번호 없는 대상을 뒷쪽으로 배치
        if (spmtPrfmncTempList.size() > spmtPrfmncList.size()) {
            for ( SpmtPrfmncVO spmt : spmtPrfmncTempList ) {
                if (!StringUtils.hasText(spmt.getPckgno())) {
                    SpmtPrfmncVO copyVO = new SpmtPrfmncVO();
                    BeanUtils.copyProperties(spmt, copyVO);
                    spmtPrfmncList.add(copyVO);
                }
            }
        }

        // 기본코드 설정

        // 대표 코드 확인
        String defaultGdsSeCd = AmConstants.CON_GDS_SE_CD_DEFAULT;
        String defaultWrhsSeCd = AmConstants.CON_WRHS_SE_CD_DEFAULT;
        ComCdVO paramComCd = new ComCdVO();
        paramComCd.setApcCd(apcCd);
        paramComCd.setCdId(AmConstants.CON_APC_ATRB);
        paramComCd.setCdVl(AmConstants.CON_BSC_GDS_SE_CD);

        ComCdVO gdsSeCdVO = comCdService.selectComCdDtl(paramComCd);
        if (gdsSeCdVO != null
                && StringUtils.hasText(gdsSeCdVO.getCdVl())
                && StringUtils.hasText(gdsSeCdVO.getCdChrVl())
                && ComConstants.CON_YES.equals(gdsSeCdVO.getUseYn())
                && ComConstants.CON_NONE.equals(gdsSeCdVO.getDelYn())) {
            defaultGdsSeCd = gdsSeCdVO.getCdChrVl();
        }

        paramComCd.setCdVl(AmConstants.CON_BSC_WRHS_SE_CD);
        ComCdVO wrhsSeCdVO = comCdService.selectComCdDtl(paramComCd);
        if (wrhsSeCdVO != null
                && StringUtils.hasText(wrhsSeCdVO.getCdVl())
                && StringUtils.hasText(wrhsSeCdVO.getCdChrVl())
                && ComConstants.CON_YES.equals(wrhsSeCdVO.getUseYn())
                && ComConstants.CON_NONE.equals(wrhsSeCdVO.getDelYn())) {
            defaultWrhsSeCd = wrhsSeCdVO.getCdChrVl();
        }

        String invntrSttsCd = spmtPrfmncComVO.getInvntrSttsCd();
        boolean needsIgnoreInvntrQntt = AmConstants.CON_INVNTR_STTS_CD_CHNG_SPMT.equals(invntrSttsCd);

        // 출하강제처리 여부 : "Y"일 경우 마이너스 재고를 생성
        boolean allowsFrcdPrcs = ComConstants.CON_YES.equals(spmtPrfmncComVO.getSpmtFrcdPrcsYn());

        boolean needsPckg = ComConstants.CON_YES.equals(spmtPrfmncComVO.getNeedsPckgYn());

        // 상품재고 조회 임시 List (동일 제품 skip 용)
        List<GdsInvntrVO> gdsTempList = new ArrayList<>();

        // 재고 변경을 위한 list
        List<GdsInvntrVO> invntrList = new ArrayList<>();

        String newSortno = ComConstants.CON_BLANK;
        String newPckgno = ComConstants.CON_BLANK;
        int newSortSn = 0;
        int newPckgSn = 0;

        // 포장등록이 필요한 경우 선별재고 까지 생성
        if (needsIgnoreInvntrQntt || allowsFrcdPrcs) {
            newPckgno = cmnsTaskNoService.selectPckgno(apcCd, spmtYmd);
            if (needsPckg) {
                newSortno = cmnsTaskNoService.selectSortno(apcCd, spmtYmd);
            }
        }

        // 출하할 상품재고 배분
        for ( SpmtPrfmncVO spmt : spmtPrfmncList ) {

            int spmtQntt = spmt.getSpmtQntt();

            String itemCd = ComUtil.nullToEmpty(spmt.getItemCd());
            String vrtyCd = ComUtil.nullToEmpty(spmt.getVrtyCd());
            String spcfctCd = ComUtil.nullToEmpty(spmt.getSpcfctCd());

            String gdsGrd = ComUtil.nullToEmpty(spmt.getGdsGrd());
            String gdsCd = ComUtil.nullToEmpty(spmt.getGdsCd());

            String spmtPckgUnitCd = ComUtil.nullToEmpty(spmt.getSpmtPckgUnitCd());
            String warehouseSeCd = ComUtil.nullToEmpty(spmt.getWarehouseSeCd());

            String sortGrdCd = ComUtil.nullToEmpty(spmt.getSortGrdCd());
            String prdcrIdentno = ComUtil.nullToEmpty(spmt.getPrdcrIdentno());
            String aftrGrdCd = ComUtil.nullToEmpty(spmt.getAftrGrdCd());

            String prdcrCd = ComUtil.nullToEmpty(spmt.getPrdcrCd());

            String rmrk = spmt.getRmrk();

            long ntslAmt = spmt.getNtslAmt();
            String dudtYmd = spmt.getDudtYmd();

            double spmtWght = 0;

            SpmtPckgUnitVO pckgUnitParam = new SpmtPckgUnitVO();
            pckgUnitParam.setApcCd(apcCd);
            pckgUnitParam.setSpmtPckgUnitCd(spmtPckgUnitCd);

            // 출하포장단위로 스펙 조회
            SpmtPckgUnitVO spmtPckgUnitVO = spmtPckgUnitService.selectSpmtPckgUnit(pckgUnitParam);
            double spcfctWght = 0;

            if (spmtPckgUnitVO == null || !StringUtils.hasText(spmtPckgUnitVO.getSpmtPckgUnitCd())) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품조회결과");
            } else {
                spcfctWght = spmtPckgUnitVO.getSpcfctWght();
            }

            String pckgno = spmt.getPckgno();
            int pckgSn = spmt.getPckgSn();
            int spmtSn = spmt.getSpmtSn();

            if (StringUtils.hasText(pckgno) && pckgSn > 0) {    // 포장번호가 있는 경우
                GdsInvntrVO gdsParam = new GdsInvntrVO();
                gdsParam.setApcCd(apcCd);
                gdsParam.setPckgno(pckgno);
                gdsParam.setPckgSn(pckgSn);

                GdsInvntrVO orgnInv = gdsInvntrService.selectGdsInvntr(gdsParam);
                if (orgnInv == null
                        || ComConstants.CON_YES.equals(orgnInv.getDelYn())
                        || orgnInv.getInvntrQntt() < 0) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품재고");
                }

                if (!needsIgnoreInvntrQntt && orgnInv.getInvntrQntt() < spmtQntt) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
                }

                if (!spmtPckgUnitCd.equals(orgnInv.getSpmtPckgUnitCd())) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "출하상품||재고상품");
                }

                GdsInvntrVO gdsInv = new GdsInvntrVO();
                BeanUtils.copyProperties(spmtPrfmncComVO, gdsInv);
                BeanUtils.copyProperties(orgnInv, gdsInv,
                        ComConstants.PROP_SYS_FRST_INPT_DT,
                        ComConstants.PROP_SYS_FRST_INPT_USER_ID,
                        ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
                        ComConstants.PROP_SYS_LAST_CHG_DT,
                        ComConstants.PROP_SYS_LAST_CHG_USER_ID,
                        ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

                int invRmnQntt = orgnInv.getInvntrQntt();
                double invRmnWght = orgnInv.getInvntrWght();

                int qntt = 0;
                double wght = 0;

                if (invRmnQntt > spmtQntt) {
                    qntt = spmtQntt;
                } else {
                    qntt = invRmnQntt;
                }

                if (needsIgnoreInvntrQntt && qntt < spmtQntt) {
                    qntt = spmtQntt;
                    gdsInv.setInvntrSttsCd(invntrSttsCd);
                }

                wght = ComUtil.round(qntt * spcfctWght, 3);

                spmtQntt -= qntt;

                if (wght > invRmnWght) {	// && !needsIgnoreInvntrQntt) {
                    wght = invRmnWght;
                }

                gdsInv.setSpmtQntt(qntt);
                gdsInv.setSpmtWght(wght);

                invntrList.add(gdsInv);

                GdsInvntrVO gdsTempVO = new GdsInvntrVO();
                BeanUtils.copyProperties(orgnInv, gdsTempVO);

                gdsTempVO.setRmnQntt(invRmnQntt - qntt);
                gdsTempVO.setRmnWght(invRmnQntt - wght);
                gdsTempList.add(gdsTempVO);

            } else {
                GdsInvntrVO gdsParam = new GdsInvntrVO();
                gdsParam.setApcCd(apcCd);
                gdsParam.setItemCd(itemCd);
                gdsParam.setVrtyCd(vrtyCd);
                gdsParam.setSpcfctCd(spcfctCd);
                gdsParam.setGdsGrd(gdsGrd);
                gdsParam.setWarehouseSeCd(warehouseSeCd);
                gdsParam.setSpmtPckgUnitCd(spmtPckgUnitCd);


                List<GdsInvntrVO> gdsInvntrList = gdsInvntrService.selectSpmtGdsInvntrListBySpec(gdsParam);

                if (!gdsInvntrList.isEmpty()) {
                    int idx = -1;
                    for ( GdsInvntrVO orgnInv : gdsInvntrList ) {
                        idx++;
                        boolean isLastIndex = idx == gdsInvntrList.size() - 1;

                        if (spmtQntt <= 0) {
                            break;
                        }

                        if (!spmtPckgUnitCd.equals(orgnInv.getSpmtPckgUnitCd())) {
                            return ComUtil.getResultMap(ComConstants.MSGCD_NOT_EQUAL, "출하상품||재고상품");
                        }

                        vrtyCd = orgnInv.getVrtyCd();
                        spcfctCd = orgnInv.getSpcfctCd();

                        int invRmnQntt = orgnInv.getInvntrQntt();
                        double invRmnWght = orgnInv.getInvntrWght();

                        String gdsPckgno = ComUtil.nullToEmpty(orgnInv.getPckgno());
                        int gdsPckgSn = orgnInv.getPckgSn();

                        GdsInvntrVO gdsTempVO = null;

                        // 상품임시테이블에서 찾기
                        for ( GdsInvntrVO gdsTemp : gdsTempList ) {
                            if (gdsPckgno.equals(gdsTemp.getPckgno()) && gdsPckgSn == gdsTemp.getPckgSn()) {
                                invRmnQntt = gdsTemp.getRmnQntt();
                                invRmnWght = gdsTemp.getRmnWght();
                                gdsTempVO = gdsTemp;
                            }
                        }

                        boolean needsTempAdd = false;

                        if (gdsTempVO == null) {
                            gdsTempVO = new GdsInvntrVO();
                            BeanUtils.copyProperties(orgnInv, gdsTempVO);
                            needsTempAdd = true;
                        }

                        // 출하변경 시 마지막에 남은 잔량 처리
                        if (invRmnQntt <= 0 && !isLastIndex) {
                            continue;
                        }

                        if (!needsIgnoreInvntrQntt && invRmnQntt <= 0) {
                            continue;
                        }

                        GdsInvntrVO gdsInv = new GdsInvntrVO();
                        BeanUtils.copyProperties(spmtPrfmncComVO, gdsInv);
                        BeanUtils.copyProperties(orgnInv, gdsInv,
                                ComConstants.PROP_SYS_FRST_INPT_DT,
                                ComConstants.PROP_SYS_FRST_INPT_USER_ID,
                                ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
                                ComConstants.PROP_SYS_LAST_CHG_DT,
                                ComConstants.PROP_SYS_LAST_CHG_USER_ID,
                                ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

                        int qntt = 0;
                        double wght = 0;

                        if (invRmnQntt > spmtQntt) {
                            qntt = spmtQntt;
                        } else {
                            qntt = invRmnQntt;
                        }

                        // 출하변경 시 마지막에 남은 잔량 처리
                        if (needsIgnoreInvntrQntt && isLastIndex && qntt < spmtQntt) {
                            qntt = spmtQntt;
                            gdsInv.setInvntrSttsCd(invntrSttsCd);
                        }

                        wght = ComUtil.round(qntt * spcfctWght, 3);
                        spmtQntt -= qntt;

                        if (wght > invRmnWght) {	//  && !needsIgnoreInvntrQntt && isLastIndex) {
                            wght = invRmnWght;
                        }

                        gdsInv.setSpmtQntt(qntt);
                        gdsInv.setSpmtWght(wght);
                        gdsInv.setRmrk(rmrk);
                        gdsInv.setSpmtSn(spmtSn);

                        invntrList.add(gdsInv);

                        gdsTempVO.setRmnQntt(invRmnQntt - qntt);
                        gdsTempVO.setRmnWght(invRmnQntt - wght);

                        if (needsTempAdd) {
                            gdsTempList.add(gdsTempVO);
                        }
                    }
                }
            }

            // 재고 부족
            if (spmtQntt > 0) {
                if (!allowsFrcdPrcs) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "출하가능재고");
                }
            }

            if (!StringUtils.hasText(itemCd)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품목");
            }

            if (!StringUtils.hasText(spcfctCd)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "규격");
            }

            if (!StringUtils.hasText(gdsGrd)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품등급");
            }

            // 선별등록의 경우
            if (needsPckg && !StringUtils.hasText(sortGrdCd)) {
                return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별등급");
            }

            //순번 ++
            newSortSn++;
            newPckgSn++;

            if (!StringUtils.hasText(vrtyCd)) {
                // 품종코드 찾기
                CmnsVrtyVO vrtyParam = new CmnsVrtyVO();
                vrtyParam.setApcCd(apcCd);
                vrtyParam.setItemCd(itemCd);
                List<CmnsVrtyVO> vrtyList = cmnsVrtyService.selectApcVrtyList(vrtyParam);

                if (vrtyList == null || vrtyList.isEmpty()) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "품종정보");
                }
                if (vrtyList.size() > 1) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_TGT_EQUAL_GREATER_THAN, "품종||두개");
                }

                vrtyCd = vrtyList.get(0).getVrtyCd();
            }

            if (needsPckg) {
                if (!StringUtils.hasText(prdcrCd)
                        && StringUtils.hasText(prdcrIdentno)
                        && !prdcrIdentno.equals(ComConstants.CON_X)) {
                    PrdcrVO prdcrParam = new PrdcrVO();
                    prdcrParam.setApcCd(apcCd);
                    prdcrParam.setIdentno(prdcrIdentno);
                    PrdcrVO prdcrVO = prdcrService.selectPrdcrByIdentno(prdcrParam);
                    if (prdcrVO != null && StringUtils.hasText(prdcrVO.getPrdcrCd())) {
                        prdcrCd = prdcrVO.getPrdcrCd();
                    } else {
                        return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자정보");
                    }
                }
            }

            if (!StringUtils.hasText(spmtPckgUnitCd)) {

                SpmtPckgUnitVO spmtPckgUnitParam = new SpmtPckgUnitVO();
                spmtPckgUnitParam.setApcCd(apcCd);
                spmtPckgUnitParam.setItemCd(itemCd);
                spmtPckgUnitParam.setVrtyCd(vrtyCd);
                spmtPckgUnitParam.setSpcfctCd(spcfctCd);
                spmtPckgUnitParam.setGdsGrd(sortGrdCd);

                List<SpmtPckgUnitVO> specList = spmtPckgUnitService.selectSpmtPckgUnitListBySpec(spmtPckgUnitParam);
                if (specList == null || specList.isEmpty()) {
                    return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품정보");
                }

                spmtPckgUnitCd = specList.get(0).getSpmtPckgUnitCd();
                spcfctWght = specList.get(0).getSpcfctWght();
                //중량 계산
                spmtWght = spmtQntt * spcfctWght;

                gdsCd = ComConstants.CON_BLANK;
                //gdsCd
                if (!StringUtils.hasText(gdsCd) && StringUtils.hasText(spmtPckgUnitCd)){
                    CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
                    BeanUtils.copyProperties(spmtPckgUnitParam, cmnsGdsVO);
                    cmnsGdsVO.setSpmtPckgUnitCd(spmtPckgUnitCd);

                    rtnObj = cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
                    if(rtnObj != null){
                        throw new EgovBizException(getMessageForMap(rtnObj));
                    }
                    if (!StringUtils.hasText(cmnsGdsVO.getNewGdsCd())) {
                        throw new EgovBizException(
                                getMessageForMap(ComUtil.getResultMap("E0003", "상품코드 발번"))
                        );
                    }
                    gdsCd = cmnsGdsVO.getNewGdsCd();
                }
            }

            // FIXME 포장등록이 필요한 경우 선별재고 생성

            // 상품재고 생성
            GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
            gdsInvntrVO.setApcCd(apcCd);
            gdsInvntrVO.setPckgno(newPckgno);
            gdsInvntrVO.setPckgSn(newPckgSn);
            gdsInvntrVO.setPckgYmd(spmtYmd);
            gdsInvntrVO.setGdsSeCd(defaultGdsSeCd);
            gdsInvntrVO.setWrhsSeCd(defaultWrhsSeCd);
            gdsInvntrVO.setRprsPrdcrCd(prdcrCd);
            gdsInvntrVO.setItemCd(itemCd);
            gdsInvntrVO.setVrtyCd(vrtyCd);
            gdsInvntrVO.setSpcfctCd(spcfctCd);
            gdsInvntrVO.setGdsGrd(gdsGrd);
            gdsInvntrVO.setSpmtPckgUnitCd(spmtPckgUnitCd);
            gdsInvntrVO.setGdsCd(gdsCd);
            gdsInvntrVO.setPckgQntt(0);
            gdsInvntrVO.setPckgWght(0);
            gdsInvntrVO.setSpmtQntt(0);
            gdsInvntrVO.setSpmtWght(0);
            gdsInvntrVO.setInvntrQntt(0);
            gdsInvntrVO.setInvntrWght(0);
            gdsInvntrVO.setPckgSortno(newSortno);
            gdsInvntrVO.setPckgSortSn(newSortSn);
            gdsInvntrVO.setSpmtSn(spmtSn);
            gdsInvntrVO.setRmrk(rmrk);
            gdsInvntrVO.setSysFrstInptUserId(sysFrstInptUserId);
            gdsInvntrVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
            gdsInvntrVO.setSysLastChgUserId(sysLastChgUserId);
            gdsInvntrVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);

            HashMap<String, Object> gdsRtnObj;
            gdsRtnObj = gdsInvntrService.insertGdsInvntr(gdsInvntrVO);
            if (gdsRtnObj != null) {
                throw new EgovBizException(getMessageForMap(gdsRtnObj));
            }

            gdsInvntrVO.setSpmtQntt(spmtQntt);
            gdsInvntrVO.setSpmtWght(spmtWght);
            gdsInvntrVO.setInvntrSttsCd(AmConstants.CON_INVNTR_STTS_CD_SPMT_BELOW_ZERO);

            gdsInvntrVO.setNtslAmt(ntslAmt);
            gdsInvntrVO.setDudtYmd(dudtYmd);

            invntrList.add(gdsInvntrVO);
        }

        // 출하자 신고번호 추가
        String spmtPrsnDclrno = spmtPrfmncComVO.getSpmtPrsnDclrno();
        if (!StringUtils.hasText(spmtPrsnDclrno)) {
            ApcEvrmntStngVO apcVO = new ApcEvrmntStngVO();
            apcVO.setApcCd(apcCd);
            ApcEvrmntStngVO apcInfo = apcEvrmntStngService.selectApcEvrmntStng(apcVO);

            if (apcInfo != null) {
                spmtPrsnDclrno = apcInfo.getSpmtPrsnDclrNo();
                spmtPrfmncComVO.setSpmtPrsnDclrno(spmtPrsnDclrno);
            }
        }

        String spmtno = cmnsTaskNoService.selectSpmtno(apcCd, spmtYmd);
        spmtPrfmncComVO.setSpmtno(spmtno);

        // 출하공통
        SpmtPrfmncVO spmtCom = new SpmtPrfmncVO();
        BeanUtils.copyProperties(spmtPrfmncComVO, spmtCom);
        spmtPrfmncMapper.insertSpmtPrfmncCom(spmtCom);

        // 출하상세
        for ( GdsInvntrVO gds : invntrList ) {
            SpmtPrfmncVO spmtDtl = new SpmtPrfmncVO();
            BeanUtils.copyProperties(gds, spmtDtl);
            spmtDtl.setSpmtno(spmtno);
            spmtDtl.setPrdcrCd(gds.getRprsPrdcrCd());

            // 재고변경
            rtnObj = gdsInvntrService.updateGdsInvntrSpmtPrfmnc(gds);
            if (rtnObj != null) {
                throw new EgovBizException(getMessageForMap(rtnObj));
            }

            // 출하상세
            spmtPrfmncMapper.insertSpmtPrfmncDtl(spmtDtl);

        }

        // 팔레트 불출
        if (spmtCom.getBssInvntrQntt() > 0) {
            PltWrhsSpmtVO pltWrhsSpmtVO = new PltWrhsSpmtVO();
            pltWrhsSpmtVO.setSysFrstInptPrgrmId(spmtCom.getSysFrstInptPrgrmId());
            pltWrhsSpmtVO.setSysFrstInptUserId(spmtCom.getSysFrstInptUserId());
            pltWrhsSpmtVO.setSysLastChgPrgrmId(spmtCom.getSysLastChgPrgrmId());
            pltWrhsSpmtVO.setSysLastChgUserId(spmtCom.getSysLastChgUserId());
            pltWrhsSpmtVO.setApcCd(apcCd);
            pltWrhsSpmtVO.setQntt(spmtCom.getBssInvntrQntt());
            pltWrhsSpmtVO.setWrhsSpmtSeCd(AmConstants.CON_WRHS_SPMT_SE_CD_SPMT);
            pltWrhsSpmtVO.setPltBxCd(spmtCom.getPltBxCd());
            pltWrhsSpmtVO.setPltBxSeCd(AmConstants.CON_PLT_BX_SE_CD_PLT);
            pltWrhsSpmtVO.setJobYmd(spmtCom.getSpmtYmd());
            pltWrhsSpmtVO.setPrcsNo(spmtno);
            pltWrhsSpmtVO.setWrhsSpmtType(AmConstants.CON_WRHS_SPMT_TYPE_SPMT);

            rtnObj = pltWrhsSpmtService.insertPltWrhsSpmt(pltWrhsSpmtVO);
            if (rtnObj != null) {
                throw new EgovBizException(getMessageForMap(rtnObj));
            }
        }

        return null;
    }

    @Override
    public HashMap<String, Object> insertSpmtPrfmncWithList(List<SpmtPrfmncComVO> spmtPrfmncComList) throws Exception {

        HashMap<String, Object> rtnObj;
        for ( SpmtPrfmncComVO spmtPrfmncComVO : spmtPrfmncComList ) {
            rtnObj = insertSpmtPrfmnc(spmtPrfmncComVO);
            if (rtnObj != null) {
                throw new EgovBizException(getMessageForMap(rtnObj));
            }
        }

        return null;
    }
}
