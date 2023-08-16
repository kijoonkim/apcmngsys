package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;


/**
 * 개인정보이용동의에 대한 Service 인터페이스
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
public interface FcltOperInfoClctAgreInfoService {

	/**
	 * 개인정보이용동의정보를 조회한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltOperInfoClctAgreInfoVO selectFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception;

	/**
	 * 개인정보이용동의정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltOperInfoClctAgreInfoVO selectFcltOperInfoClctAgreInfo(String msgKey) throws Exception;

	/**
	 * 개인정보이용동의 목록을 조회한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltOperInfoClctAgreInfoVO> selectFcltOperInfoClctAgreInfoList(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception;


	/**
	 * 개인정보이용동의정보를 등록한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception;

	/**
	 * 개인정보이용동의정보를 변경한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception;

	/**
	 * 개인정보이용동의정보를 삭제한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO) throws Exception;

	/**
	 * 개인정보이용동의 목록을 삭제한다.
	 * @param fcltOperInfoClctAgreInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOperInfoClctAgreInfoList(List<FcltOperInfoClctAgreInfoVO> fcltOperInfoClctAgreInfoList) throws Exception;

}
