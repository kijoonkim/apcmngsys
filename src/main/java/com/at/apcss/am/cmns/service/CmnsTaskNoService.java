package com.at.apcss.am.cmns.service;

import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;

/**
 * 업무 번호 Service 인터페이스
 * @author 신정철
 * @since 2023.07.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.21  신정철        최초 생성
 * </pre>
 */
public interface CmnsTaskNoService {

	/**
	 * 계량번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectWghno(String apcCd, String ymd) throws Exception;

	/**
	 * 입고번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectWrhsno(String apcCd, String ymd) throws Exception;

	/**
	 * 입고 처리(재처리) 번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectWrhsPrcsNo(String apcCd, String ymd) throws Exception;

	/**
	 * 입고계획번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectPlanno(String apcCd, String ymd) throws Exception;

	/**
	 * 선별번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectSortno(String apcCd, String ymd) throws Exception;

	/**
	 * 선별지시번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectSortCmndno(String apcCd, String ymd) throws Exception;

	/**
	 * 포장번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectPckgno(String apcCd, String ymd) throws Exception;

	/**
	 * 포장지시번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectPckgCmndno(String apcCd, String ymd) throws Exception;

	/**
	 * 출하번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectSpmtno(String apcCd, String ymd) throws Exception;

	/**
	 * 출하지시번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectSpmtCmndno(String apcCd, String ymd) throws Exception;

	/**
	 * 발주번호 발번
	 * @param apcCd
	 * @param ymd
	 * @return
	 * @throws Exception
	 */
	public String selectOutordrno(String apcCd, String ymd) throws Exception;

	/**
	 * 파레트번호 발번
	 * @param apcCd
	 * @param wrhsno
	 * @return
	 * @throws Exception
	 */
	public String selectFnGetPltNo(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;
}
