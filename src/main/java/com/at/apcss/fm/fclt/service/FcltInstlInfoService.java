package com.at.apcss.fm.fclt.service;

import java.util.List;

import com.at.apcss.fm.fclt.vo.FcltInstlInfoVO;


/**
 * 시설설치보완 Service 인터페이스
 * @author
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21          최초 생성
 * </pre>
 */
public interface FcltInstlInfoService {

	/**
	 * 시설설치보완정보를 조회한다.
	 * @param fcltInstlInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltInstlInfoVO selectFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception;

	/**
	 * 시설설치보완정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltInstlInfoVO selectFcltInstlInfo(String msgKey) throws Exception;

	/**
	 * 시설설치보완 목록을 조회한다.
	 * @param fcltInstlInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltInstlInfoVO> selectFcltInstlInfoList(FcltInstlInfoVO fcltInstlInfoVO) throws Exception;

	/**
	 * 시설설치보완정보를 등록한다.
	 * @param fcltInstlInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception;

	/**
	 * 시설설치보완정보를 변경한다.
	 * @param fcltInstlInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception;

	/**
	 * 시설설치보완정보를 삭제한다.
	 * @param fcltInstlInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception;

	/**
	 * 시설설치보완 목록을 삭제한다.
	 * @param fcltInstlInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltInstlInfoList(List<FcltInstlInfoVO> fcltInstlInfoList) throws Exception;


	/**
	 * 로우데이터를 조회한다.
	 * @param fcltInstlInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltInstlInfoVO> selectFcltInstlInfoRawDataList(FcltInstlInfoVO fcltInstlInfoVO) throws Exception;

	/**
	 * 시설설치보완정보를 변경한다.
	 * @param fcltInstlInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltInstlInfoPrgrs(FcltInstlInfoVO fcltInstlInfoVO) throws Exception;

}
