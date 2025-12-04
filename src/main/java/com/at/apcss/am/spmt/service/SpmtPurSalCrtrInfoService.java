package com.apcmngsys.apcss.am.spmt.service;

import java.util.List;

import com.apcmngsys.apcss.am.spmt.vo.SpmtPurSalCrtrInfoVO;
import com.apcmngsys.apcss.am.tot.vo.TotMngVO;

public interface SpmtPurSalCrtrInfoService {
	
	/**
	 * 매출 정보조회
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtPurSalCrtrInfoVO> selectSpmtPusrSalCrtrInfoList(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO) throws Exception;

	
	/**
	 * 매출 상세정보조회
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<SpmtPurSalCrtrInfoVO> selectSpmtPusrSalCrtrInfoDtlList(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO) throws Exception;

	/**
	 * 매출기준정보등록
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertSlsCrtrInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO) throws Exception;
	
	/**
	 * 매출기준상세정보등록
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertSlsCrtrDtlInfo(List<SpmtPurSalCrtrInfoVO> slsDtlVOList) throws Exception;

	/**
	 * 매출기준정보삭제
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSpmtPurSalCrtrInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);

}
