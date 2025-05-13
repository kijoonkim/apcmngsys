package com.at.apcss.fm.fclt.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.fm.fclt.vo.FcltApcVO;
import com.at.apcss.fm.fclt.vo.FcltItemVO;
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;


/**
 * 운영자개요 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
public interface FcltOperInfoService {

	/**
	 * 운영자개요정보를 조회한다.
	 * @param fcltOperInfoVO
	 * @return FcltOperInfoVO
	 * @throws Exception
	 */
	public FcltOperInfoVO selectFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 운영자개요정보를 조회한다.
	 * @param msgKey
	 * @return FcltOperInfoVO
	 * @throws Exception
	 */
	public FcltOperInfoVO selectFcltOperInfo(String msgKey) throws Exception;

	/**
	 * 운영자개요 목록을 조회한다.
	 * @param fcltOperInfoVO
	 * @return List<FcltOperInfoVO>
	 * @throws Exception
	 */
	public List<FcltOperInfoVO> selectFcltOperInfoList(FcltOperInfoVO fcltOperInfoVO) throws Exception;


	/**
	 * 운영자개요정보를 등록한다.
	 * @param fcltOperInfoVO
	 * @return int
	 * @throws Exception
	 */
	public int insertFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * APC전수조사 - 1.운영자개요 : 등록
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	HashMap<String, Object> insertOperOgnz(FcltOperInfoVO fcltOperInfoVO) throws Exception;



	/**
	 * 운영자개요정보를 변경한다.
	 * @param fcltOperInfoVO
	 * @return int
	 * @throws Exception
	 */
	public int updateFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 운영자개요정보를 삭제한다.
	 * @param fcltOperInfoVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 운영자개요 목록을 삭제한다.
	 * @param fcltOperInfoList
	 * @return int
	 * @throws Exception
	 */
	public int deleteFcltOperInfoList(List<FcltOperInfoVO> fcltOperInfoList) throws Exception;

	/**
	 * 운영자개요 품목목록을 조회한다.
	 * @param fcltItemVO
	 * @return List<FcltItemVO>
	 * @throws Exception
	 */
	public List<FcltItemVO> selectFcltOperInfoItemList(FcltItemVO fcltItemVO) throws Exception;

	/**
	 * 운영자개요 품목을 삭제한다
	 * @param fcltItemVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteItem(FcltItemVO fcltItemVO) throws Exception;

	/**
	 * APC 목록을 조회한다.
	 * @param fcltApcVO
	 * @return List<FcltApcVO>
	 * @throws Exception
	 */
	public List<FcltApcVO> selectApcList(FcltApcVO fcltApcVO) throws Exception;

	/**
	 * 운영자개요 로우데이터를 조회한다.
	 * @param fcltApcVO
	 * @return List<FcltApcVO>
	 * @throws Exception
	 */
	public List<FcltApcVO> selectFcltOperInfoRawDataList(FcltApcVO fcltApcVO) throws Exception;

	/**
	 * 선택가능한 APC 목록을 조회한다.
	 * @param fcltApcVO
	 * @return List<FcltApcVO>
	 * @throws Exception
	 */
	public List<FcltApcVO> selectUserApcList(FcltApcVO fcltApcVO) throws Exception;

	/**
	 * 유저정보를 조회한다.
	 * @param fcltApcVO
	 * @return FcltOperInfoVO
	 */
	public FcltOperInfoVO selectUserInfo(FcltOperInfoVO fcltApcVO) throws Exception;

}
