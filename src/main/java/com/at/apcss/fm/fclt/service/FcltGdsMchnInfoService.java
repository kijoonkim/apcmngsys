package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltGdsMchnInfoVO;


/**
 * 상품화설비현황 Service 인터페이스
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
public interface FcltGdsMchnInfoService {

	/**
	 * 상품화설비현황정보를 조회한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltGdsMchnInfoVO selectFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception;

	/**
	 * 상품화설비현황정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltGdsMchnInfoVO selectFcltGdsMchnInfo(String msgKey) throws Exception;

	/**
	 * 상품화설비현황 목록을 조회한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltGdsMchnInfoVO> selectFcltGdsMchnInfoList(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception;


	/**
	 * 상품화설비현황정보를 등록한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception;

	/**
	 * 상품화설비현황정보를 변경한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception;

	/**
	 * 상품화설비현황정보를 삭제한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO) throws Exception;

	/**
	 * 상품화설비현황 목록을 삭제한다.
	 * @param fcltGdsMchnInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltGdsMchnInfoList(List<FcltGdsMchnInfoVO> fcltGdsMchnInfoList) throws Exception;

}
