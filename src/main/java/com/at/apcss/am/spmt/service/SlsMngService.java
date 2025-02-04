package com.at.apcss.am.spmt.service;

import java.util.List;

import com.at.apcss.am.spmt.vo.SlsMngVO;

public interface SlsMngService {

	/**
	 * 매출실적조회
	 * @param SlsMngVO
	 * @return SlsMngVO
	 * @throws Exception
	 */
	public List<SlsMngVO> selectSlsPrfmnc(SlsMngVO slsMngVO) throws Exception;

	/**
	 * 매출실적삭제
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int deleteSlsPrfmnc(List<SlsMngVO> slsMngVO)throws Exception;

	/**
	 * 매출실적수정
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int updateSlsPrfmnc(List<SlsMngVO> slsMngVO)throws Exception;
	
	/**
	 * 매출단가조회
	 * @param slsMngVO
	 * @return 
	 * @throws Exception
	 */
	public List<SlsMngVO> selectSlsUntprc(SlsMngVO slsMngVO)throws Exception;



	/**
	 * 매출단가상세조회
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
    public List<SlsMngVO> selectSlsUntprcDtl(SlsMngVO slsMngVO) throws Exception;

	/**
	 * 매출단가 변경
	 * @param slsUntprcList
	 * @return
	 * @throws Exception
	 */
	public int updateSlsUntprcReg(List<SlsMngVO> slsUntprcList) throws Exception;

	/**
	 * 매출단가 삭제
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSlsUntprc (SlsMngVO slsMngVO) throws Exception;

	/**
	 * 매출 기준 조회
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
    public List<SlsMngVO> selectSlsCrtr(SlsMngVO slsMngVO) throws Exception;

	/**
	 * 매출 기준 상세 조회
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
	public List<SlsMngVO> selectSlsCrtrDtl(SlsMngVO slsMngVO)throws Exception;

	/**
	 * 매출 기준 등록
	 * @param slsCrtrList
	 * @return
	 * @throws Exception
	 */
	public int insertSlsCrtr(List<SlsMngVO> slsCrtrList)throws Exception;

	/**
	 * 매출 기준 상세 등록
	 * @param slsCrtrDtlList
	 * @return
	 * @throws Exception
	 */
	public int insertSlsCrtrDtl(List<SlsMngVO> slsCrtrDtlList) throws Exception;

	/**
	 * 매출 기준 삭제
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSlsCrtr(SlsMngVO slsMngVO) throws Exception;

	/**
	 * 매출 기준 상세 삭제
	 * @param slsMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSlsCrtrDtl(SlsMngVO slsMngVO) throws Exception;
}
