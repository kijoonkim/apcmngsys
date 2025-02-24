package com.at.apcss.am.dscd.service;

import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.dscd.vo.DscdPrfmncVO;

import java.util.List;

public interface InvntrDscdService {

    /**
     * 폐기 등록 - 재고 목록 조회 (원물)
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectRawMtrInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception;


    /**
     * 폐기 등록 - 재고 목록 조회 (선별)
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectSortInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 등록 - 재고 목록 조회 (상품)
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectGdsInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 등록 - 폐기 등록 목록 추가
     * @param dscdRegList
     * @return
     * @throws Exception
     */
    public int insertDscdRegList(List<DscdPrfmncVO> dscdRegList) throws Exception;

    /**
     * 폐기 실적 조회- 폐기 실적 목록 조회
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectDscdPrfmncList(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회- 폐기 실적 삭제
     * @param dscdPrfmncList
     * @return
     * @throws Exception
     */
    public int deleteDscdPrfmnc(List<DscdPrfmncVO> dscdPrfmncList) throws Exception;

    /**
     * 폐기 상세 관리 - 폐기 원인 코드 조회
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectDscdCsCd(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 상세 관리 - 폐기 사유 코드 조회
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectDscdBadCd(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 상세 관리 - 폐기원인/사유 변경
     * @param dscdPrfmncList
     * @return
     * @throws Exception
     */
    public int updateDscdPrfmncDtl(List<DscdPrfmncVO> dscdPrfmncList) throws Exception;
}
