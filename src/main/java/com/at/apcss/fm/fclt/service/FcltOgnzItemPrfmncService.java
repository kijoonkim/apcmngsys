package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltOgnzItemPrfmncVO;


/**
 * 유통품목처리실적 Service 인터페이스
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
public interface FcltOgnzItemPrfmncService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltOgnzItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public FcltOgnzItemPrfmncVO selectFcltOgnzItemPrfmnc(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltOgnzItemPrfmncVO selectFcltOgnzItemPrfmnc(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltOgnzItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltOgnzItemPrfmncVO> selectFcltOgnzItemPrfmncList(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltOgnzItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltOgnzItemPrfmnc(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltOgnzItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltOgnzItemPrfmnc(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltOgnzItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOgnzItemPrfmnc(FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltOgnzItemPrfmncList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOgnzItemPrfmncList(List<FcltOgnzItemPrfmncVO> fcltOgnzItemPrfmncList) throws Exception;

}
