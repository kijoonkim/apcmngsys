package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltOperHfInfoVO;


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
public interface FcltOperHfInfoService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltOperHfInfoVO selectFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltOperHfInfoVO selectFcltOperHfInfo(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltOperHfInfoVO> selectFcltOperHfInfoList(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltOperHfInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOperHfInfoList(List<FcltOperHfInfoVO> fcltOperHfInfoList) throws Exception;

}
