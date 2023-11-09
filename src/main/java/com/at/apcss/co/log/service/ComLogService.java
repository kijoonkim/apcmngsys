package com.at.apcss.co.log.service;

import java.util.List;

import com.at.apcss.co.log.vo.ComLogVO;

public interface ComLogService {

	/**
	 * 접속 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectCntnHstryList(ComLogVO comLogVO) throws Exception;

	/**
	 * 화면열람 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectMenuHstryList(ComLogVO comLogVO) throws Exception;

	/**
	 * 송수신 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectTrsmHstryList(ComLogVO comLogVO) throws Exception;

	/**
	 * 배치실행 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectBatchHstryList(ComLogVO comLogVO) throws Exception;

	/**
	 * 원물재고 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectRawMtrHstryList(ComLogVO comLogVO) throws Exception;
	/**
	 * 선별재고 변경 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectSortHstryList(ComLogVO comLogVO) throws Exception;
	/**
	 * 상품재고 변경 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectGdsHstryList(ComLogVO comLogVO) throws Exception;
	/**
	 *
	 * 화면열람 이력정보를 생성한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception*/
	public void insertMenuHstry(ComLogVO comLogVO) throws Exception;
}
