package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

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
	 * @return
	 * @throws Exception
	 */
	public FcltOperInfoVO selectFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 운영자개요정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltOperInfoVO selectFcltOperInfo(String msgKey) throws Exception;

	/**
	 * 운영자개요 목록을 조회한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltOperInfoVO> selectFcltOperInfoList(FcltOperInfoVO fcltOperInfoVO) throws Exception;


	/**
	 * 운영자개요정보를 등록한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 운영자개요정보를 변경한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 운영자개요정보를 삭제한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 운영자개요 목록을 삭제한다.
	 * @param fcltOperInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOperInfoList(List<FcltOperInfoVO> fcltOperInfoList) throws Exception;

}
