package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltSortMchnOperInfoVO;


/**
 * 선별기운영기간 Service 인터페이스
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
public interface FcltSortMchnOperInfoService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltSortMchnOperInfoVO selectFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltSortMchnOperInfoVO selectFcltSortMchnOperInfo(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltSortMchnOperInfoVO> selectFcltSortMchnOperInfoList(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltSortMchnOperInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltSortMchnOperInfoList(List<FcltSortMchnOperInfoVO> fcltSortMchnOperInfoList) throws Exception;

}
