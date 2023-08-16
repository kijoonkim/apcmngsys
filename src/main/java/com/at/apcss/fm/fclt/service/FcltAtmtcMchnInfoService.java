package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltAtmtcMchnInfoVO;


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
public interface FcltAtmtcMchnInfoService {

	/**
	 * 스마트자동화정보를 조회한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltAtmtcMchnInfoVO selectFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception;

	/**
	 * 스마트자동화정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltAtmtcMchnInfoVO selectFcltAtmtcMchnInfo(String msgKey) throws Exception;

	/**
	 * 스마트자동화 목록을 조회한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltAtmtcMchnInfoVO> selectFcltAtmtcMchnInfoList(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception;


	/**
	 * 스마트자동화정보를 등록한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception;

	/**
	 * 스마트자동화정보를 변경한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception;

	/**
	 * 스마트자동화정보를 삭제한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO) throws Exception;

	/**
	 * 스마트자동화 목록을 삭제한다.
	 * @param fcltAtmtcMchnInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltAtmtcMchnInfoList(List<FcltAtmtcMchnInfoVO> fcltAtmtcMchnInfoList) throws Exception;

}
