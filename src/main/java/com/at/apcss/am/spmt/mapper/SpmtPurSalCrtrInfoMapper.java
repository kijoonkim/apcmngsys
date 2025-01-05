package com.at.apcss.am.spmt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.spmt.vo.SpmtPurSalCrtrInfoVO;

@Mapper
public interface SpmtPurSalCrtrInfoMapper {

	/**
	 * 매출 기준정보를 조회한다.
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 */
	public List<SpmtPurSalCrtrInfoVO> selectSpmtPusrSalCrtrInfoList(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);
	
	/**
	 * 매출 정보상세를 조회한다.
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 */
	public List<SpmtPurSalCrtrInfoVO> selectSpmtPusrSalCrtrInfoDtlList(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);

	/**
	 * 매출기준정보등록
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 */
	public int insertSlsCrtrInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);

	/**
	 * 매출기준정보수정
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 */
	public int updateSlsCrtrInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);

	/**
	 * 매출기준상세정보등록
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 */
	public int insertSlsCrtrDtlInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);

	/**
	 * 매출기준상제정보수정
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 */
	public int updateSlsCrtrDtlInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);
	
	/**
	 * 매출기준정보삭제
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 */
	public int deleteSpmtPurSalCrtrInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);
	
	/**
	 * 매출기준상세정보삭제
	 * @param SpmtPurSalCrtrInfoVO
	 * @return
	 */
	public int deleteSpmtPurSalCrtrDtlInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO);
	
	
}
