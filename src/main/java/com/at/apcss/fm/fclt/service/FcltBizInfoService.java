package com.at.apcss.fm.fclt.service;

import java.util.List;

import com.at.apcss.fm.fclt.vo.FcltItemVO;
import com.at.apcss.fm.fclt.vo.FcltBizInfoVO;


/**
 * 지원사업 Service 인터페이스
 * @author 임준완
 * @since 2024.07.30
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.30  임준완        최초 생성
 * </pre>
 */
public interface FcltBizInfoService {

	/**
	 * 지원사업정보를 조회한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public FcltBizInfoVO selectFcltBizInfo(FcltBizInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 지원사업정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltBizInfoVO selectFcltBizInfo(String msgKey) throws Exception;

	/**
	 * 지원사업 목록을 조회한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltBizInfoVO> selectFcltBizInfoList(FcltBizInfoVO fcltOperInfoVO) throws Exception;


	/**
	 * 지원사업정보를 등록한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltBizInfo(FcltBizInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 지원사업정보를 변경한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltBizInfo(FcltBizInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 지원사업정보를 삭제한다.
	 * @param fcltOperInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltBizInfo(FcltBizInfoVO fcltOperInfoVO) throws Exception;

	/**
	 * 지원사업 목록을 삭제한다.
	 * @param fcltOperInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltBizInfoList(List<FcltBizInfoVO> fcltOperInfoList) throws Exception;


}
