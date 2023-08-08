package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltOgnzPrcsPrfmncVO;


/**
 * 유통조직처리실적 Service 인터페이스
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
public interface FcltOgnzPrcsPrfmncService {

	/**
	 * 메시지정보를 조회한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public FcltOgnzPrcsPrfmncVO selectFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltOgnzPrcsPrfmncVO selectFcltOgnzPrcsPrfmnc(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltOgnzPrcsPrfmncVO> selectFcltOgnzPrcsPrfmncList(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param fcltOgnzPrcsPrfmncList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltOgnzPrcsPrfmncList(List<FcltOgnzPrcsPrfmncVO> fcltOgnzPrcsPrfmncList) throws Exception;

}
