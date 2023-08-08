package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltDtaMngInfoVO;


/**
 * 스마트데이터화 Service 인터페이스
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
public interface FcltDtaMngInfoService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltDtaMngInfoVO selectFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltDtaMngInfoVO selectFcltDtaMngInfo(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltDtaMngInfoVO> selectFcltDtaMngInfoList(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltDtaMngInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltDtaMngInfoList(List<FcltDtaMngInfoVO> fcltDtaMngInfoList) throws Exception;

}
