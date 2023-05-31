package com.at.apcss.co.cd.service;

import java.util.List;

import com.at.apcss.co.cd.vo.ComCdVO;

public interface ComCdService {

	/**
	 * 공통코드 정보 조회
	 * @param comCdVO
	 * @return
	 */
	public ComCdVO selectComCd(ComCdVO comCdVO) throws Exception;

	/**
	 * 공통코드 목록 조회
	 * @param comCdVO
	 * @return
	 * @throws Exception
	 */
	public List<ComCdVO> selectComCdList(ComCdVO comCdVO) throws Exception;
	
	/**
	 * 공통코드 상세 목록 조회
	 * @param comCdVO
	 * @return
	 * @throws Exception
	 */
	public List<ComCdVO> selectComCdDtlList(ComCdVO comCdVO) throws Exception;

	/**
	 * 공통코드 등록
	 * @param comCdVO
	 * @return inserted count
	 * @throws Exception
	 */
	public int insertComCd(ComCdVO comCdVO) throws Exception;
	
	/**
	 * 공통코드 변경
	 * @param comCdVO
	 * @return updated count
	 * @throws Exception
	 */
	public int updateComCd(ComCdVO comCdVO) throws Exception;
	
	/**
	 * 공통코드 삭제
	 * @param comCdVO
	 * @return deleted count
	 * @throws Exception
	 */
	public int deleteComCd(ComCdVO comCdVO) throws Exception;
	
	/**
	 * 공통코드 상세 등록
	 * @param comCdVO
	 * @return inserted count
	 * @throws Exception
	 */
	public int insertComCdDtl(ComCdVO comCdVO) throws Exception;
	
	/**
	 * 공통코드 상세 변경
	 * @param comCdVO
	 * @return updated count
	 * @throws Exception
	 */
	public int updateComCdDtl(ComCdVO comCdVO) throws Exception;
	
	/**
	 * 공통코드 상세 삭제
	 * @param comCdVO
	 * @return deleted count
	 * @throws Exception
	 */
	public int deleteComCdDtl(ComCdVO comCdVO) throws Exception;
	
}
