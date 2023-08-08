package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltUnityMngInfoVO;


/**
 * 통합관리시스템 Service 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
public interface FcltUnityMngInfoService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltUnityMngInfoVO selectFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltUnityMngInfoVO selectFcltUnityMngInfo(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltUnityMngInfoVO> selectFcltUnityMngInfoList(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltUnityMngInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltUnityMngInfoList(List<FcltUnityMngInfoVO> fcltUnityMngInfoList) throws Exception;

}
