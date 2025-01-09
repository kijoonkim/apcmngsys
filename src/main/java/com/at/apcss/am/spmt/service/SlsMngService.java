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
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public List<SlsMngVO> selectSlsUntprc(SlsMngVO slsMngVO)throws Exception;

	/**
	 * 매출단가삭제
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int deleteSlsUntprc(SlsMngVO slsMngVO)throws Exception;

	/**
	 * 매출단가변경
	 * @param SlsMngVO
	 * @return 
	 * @throws Exception
	 */
	public int updateSlsUntprc(List<SlsMngVO> slsMngVO)throws Exception;
	
	
	
}
