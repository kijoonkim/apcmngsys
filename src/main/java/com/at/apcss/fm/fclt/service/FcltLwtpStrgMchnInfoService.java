package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnInfoVO;


/**
 * 공통메시지 Service 인터페이스
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
public interface FcltLwtpStrgMchnInfoService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltLwtpStrgMchnInfoVO selectFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltLwtpStrgMchnInfoVO selectFcltLwtpStrgMchnInfo(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltLwtpStrgMchnInfoVO> selectFcltLwtpStrgMchnInfoList(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltLwtpStrgMchnInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltLwtpStrgMchnInfoList(List<FcltLwtpStrgMchnInfoVO> fcltLwtpStrgMchnInfoList) throws Exception;

}
