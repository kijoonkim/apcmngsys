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
	 * 공통코드 상세 정보 조회
	 * @param comCdVO
	 * @return
	 * @throws Exception
	 */
	public ComCdVO selectComCdDtl(ComCdVO comCdVO) throws Exception;

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

	/**
	 * 콤보박스 공통코드 리스트
	 * @param comCdVO
	 * @return List<ComCdVO>
	 * @throws Exception
	 */
	public List<ComCdVO> selectComBoCdDtlList(ComCdVO comCdVO) throws Exception;

	/**
	 * 공통코드 중복 체크
	 * @param comCdVO
	 * @return result
	 * @throws Exception
	 */
	public int duplicateCheckCdId(ComCdVO comCdVO) throws Exception;

	/**
	 * 공통코드 상세 중복 체크
	 * @param comCdVO
	 * @return result
	 * @throws Exception
	 */
	public int duplicateCheckCdIdDtl(ComCdVO comCdVO) throws Exception;

	/**
	 * 공통코드 상세 사용유무 변경
	 * @param comCdVO
	 * @return updated count
	 */
	public int updateComCdDtlDelYn(ComCdVO comCdVO) throws Exception;

	/**
	 * 공통코드 상세 사용유무 전체변경
	 * @param comCdVO
	 * @return updated count
	 */
	public int comCdDtlDelYnAll(ComCdVO comCdVO) throws Exception;

	/**
	 * APC별 설비 목록 조회
	 * @param ComCdVO
	 * @return List<ComCdVO>
	 * @throws Exception
	 */
	public List<ComCdVO> selectFcltList(ComCdVO comCdVO) throws Exception;

	/**
	 * 공통코드 멀티 저장
	 * @param comCdList
	 * @return updated count
	 */
	public int multiSaveComCdList(List<ComCdVO> comCdList) throws Exception;
	
	/**
	 * 공통코드 상세 멀티 저장
	 * @param comCdList
	 * @return updated count
	 */
	public int multiSaveComCdDtlList(List<ComCdVO> comCdList) throws Exception;

}
