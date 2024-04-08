package com.at.apcss.co.cd.service;

import java.util.HashMap;
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
	 * 공통코드 상세 목록 조회
	 * @param comCdVO
	 * @return
	 * @throws Exception
	 */
	public List<ComCdVO> selectApcRptList(ComCdVO comCdVO) throws Exception;

	
	
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
	 * 공통코드 삭제
	 * @param comCdVO
	 * @return deleted count
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteApcComCdDtl(ComCdVO comCdVO) throws Exception;

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
	 * @param List<ComCdVO>
	 * @return updated count
	 */
	public int multiSaveComCdList(List<ComCdVO> comCdList) throws Exception;

	/**
	 * 공통코드 상세 멀티 저장
	 * @param List<ComCdVO>
	 * @return updated count
	 */
	public int multiSaveComCdDtlList(List<ComCdVO> comCdList) throws Exception;

	/**
	 * 공통코드 & 공통코드 상세 멀티 저장
	 * @param ComCdVO
	 * @return updated count
	 */
	public int multiSaveComCdComCdDtlList(ComCdVO comCdVO) throws Exception;

	/**
	 * 공통코드 & 공통코드 상세 멀티 삭제
	 * @param ComCdVO
	 * @return updated count
	 */
	public int deleteComCdComCdDtlList(ComCdVO comCdVO) throws Exception;

	/**
	 * APC별 창고 & 설비 삭제 여부
	 * @param ComCdVO
	 * @return String
	 * @throws Exception
	 */
	public String apcCdComCdDtlDelible(ComCdVO comCdVO) throws Exception;
	
	/**
	 * APC기준정보 창고, 선별기, 포장기 업데이트
	 * @param ComCdVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateComApcStdInq(ComCdVO comCdVO) throws Exception;

	/**
	 * APC기준정보 창고 업데이트 리스트
	 * @param ComCdVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updateComWarehouseList(List<ComCdVO> comCdList) throws Exception;
	/**
	 * APC기준정보 선별기 업데이트 리스트
	 * @param ComCdVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updateComSortFcltList(List<ComCdVO> comCdList) throws Exception;
	/**
	 * APC기준정보 포장기 업데이트 리스트
	 * @param ComCdVO
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updateComPckgFcltList(List<ComCdVO> comCdList) throws Exception;


}
