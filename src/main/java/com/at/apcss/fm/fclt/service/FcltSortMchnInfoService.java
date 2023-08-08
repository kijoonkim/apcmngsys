package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltSortMchnInfoVO;


/**
 * 선별기현황 Service 인터페이스
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
public interface FcltSortMchnInfoService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltSortMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltSortMchnInfoVO selectFcltSortMchnInfo(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltSortMchnInfoVO selectFcltSortMchnInfo(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltSortMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltSortMchnInfoVO> selectFcltSortMchnInfoList(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltSortMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltSortMchnInfo(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltSortMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltSortMchnInfo(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltSortMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltSortMchnInfo(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltSortMchnInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltSortMchnInfoList(List<FcltSortMchnInfoVO> fcltSortMchnInfoList) throws Exception;

}
