package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltPrcsNtslInfoVO;


/**
 * 스마트자동화 Service 인터페이스
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
public interface FcltPrcsNtslInfoService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltPrcsNtslInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltPrcsNtslInfoVO selectFcltPrcsNtslInfo(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltPrcsNtslInfoVO selectFcltPrcsNtslInfo(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltPrcsNtslInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltPrcsNtslInfoVO> selectFcltPrcsNtslInfoList(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltPrcsNtslInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltPrcsNtslInfo(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltPrcsNtslInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltPrcsNtslInfo(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltPrcsNtslInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltPrcsNtslInfo(FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltPrcsNtslInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltPrcsNtslInfoList(List<FcltPrcsNtslInfoVO> fcltPrcsNtslInfoList) throws Exception;

}
