package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnOperInfoVO;


/**
 * 저온저장고운영기간의 Service 인터페이스
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
public interface FcltLwtpStrgMchnOperInfoService {

	/**
	 * 저온저장고운영기간정보를 조회한다.
	 * @param fcltLwtpStrgMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltLwtpStrgMchnOperInfoVO selectFcltLwtpStrgMchnOperInfo(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception;

	/**
	 * 저온저장고운영기간정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltLwtpStrgMchnOperInfoVO selectFcltLwtpStrgMchnOperInfo(String msgKey) throws Exception;

	/**
	 * 저온저장고운영기간 목록을 조회한다.
	 * @param fcltLwtpStrgMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltLwtpStrgMchnOperInfoVO> selectFcltLwtpStrgMchnOperInfoList(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception;


	/**
	 * 저온저장고운영기간정보를 등록한다.
	 * @param fcltLwtpStrgMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltLwtpStrgMchnOperInfo(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception;

	/**
	 * 저온저장고운영기간정보를 변경한다.
	 * @param fcltLwtpStrgMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltLwtpStrgMchnOperInfo(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception;

	/**
	 * 저온저장고운영기간정보를 삭제한다.
	 * @param fcltLwtpStrgMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltLwtpStrgMchnOperInfo(FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO) throws Exception;

	/**
	 * 저온저장고운영기간 목록을 삭제한다.
	 * @param fcltLwtpStrgMchnOperInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltLwtpStrgMchnOperInfoList(List<FcltLwtpStrgMchnOperInfoVO> fcltLwtpStrgMchnOperInfoList) throws Exception;

}
