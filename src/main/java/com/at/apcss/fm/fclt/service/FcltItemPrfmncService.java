package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltItemPrfmncVO;


/**
 * 산지유통품목처리실적에 대한 Service 인터페이스
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
public interface FcltItemPrfmncService {

	/**
	 * 산지유통품목처리실적정보를 조회한다.
	 * @param fcltItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public FcltItemPrfmncVO selectFcltItemPrfmnc(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception;

	/**
	 * 산지유통품목처리실적정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltItemPrfmncVO selectFcltItemPrfmnc(String msgKey) throws Exception;

	/**
	 * 산지유통품목처리실적 목록을 조회한다.
	 * @param fcltItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltItemPrfmncVO> selectFcltItemPrfmncList(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception;


	/**
	 * 산지유통품목처리실적정보를 등록한다.
	 * @param fcltItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltItemPrfmnc(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception;

	/**
	 * 산지유통품목처리실적정보를 변경한다.
	 * @param fcltItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltItemPrfmnc(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception;

	/**
	 * 산지유통품목처리실적정보를 삭제한다.
	 * @param fcltItemPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltItemPrfmnc(FcltItemPrfmncVO fcltItemPrfmncVO) throws Exception;

	/**
	 * 산지유통품목처리실적 목록을 삭제한다.
	 * @param fcltItemPrfmncList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltItemPrfmncList(List<FcltItemPrfmncVO> fcltItemPrfmncList) throws Exception;

}
