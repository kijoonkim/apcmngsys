package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.CnptVO;
import com.at.apcss.am.cmns.vo.LgszMrktVO;

/**
 * 거래처정보 Service 인터페이스
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
public interface CnptService {

	/**
	 * 거래처정보 단건 조회
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public CnptVO selectCnpt(CnptVO cnptVO) throws Exception;

	/**
	 * 거래처정보 목록 조회
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public List<CnptVO> selectCnptList(CnptVO cnptVO) throws Exception;

	/**
	 * 거래처정보 등록
	 * @param cnptVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertCnptList(List<CnptVO> cnptList) throws Exception;


	/**
	 * 거래처정보 등록
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int insertCnpt(CnptVO cnptVO) throws Exception;

	/**
	 * 거래처정보 변경
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int updateCnpt(CnptVO cnptVO) throws Exception;

	/**
	 * 거래처정보 삭제
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCnpt(CnptVO cnptVO) throws Exception;

	/**
	 * 대형마켓 접속정보 조회
	 * @param apcCd
	 * @param lgszMrktCd
	 * @return
	 * @throws Exception
	 */
	public LgszMrktVO selectLgszMrkt(String apcCd, String lgszMrktCd) throws Exception;
	
	/**
	 * 대형마켓 접속정보 조회
	 * @param lgszMrktVO
	 * @return
	 * @throws Exception
	 */
	public LgszMrktVO selectLgszMrkt(LgszMrktVO lgszMrktVO) throws Exception;
	
	/**
	 * 대형마켓 목록 조회
	 * @param LgszMrktVO
	 * @return
	 * @throws Exception
	 */
	public List<LgszMrktVO> selectLgszMrktList(LgszMrktVO lgszMrktVO) throws Exception;

	/**
	 * 대형마트 변경
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int updateLgszMrkt(LgszMrktVO lgszMrktVO) throws Exception;

	/**
	 * 대형마켓 초기 등록
	 * @param List<LgszMrktVO>
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertLgszMrktList(List<LgszMrktVO> lgszMrktList) throws Exception;


	/**
	 * 거래처저장 및 대형마켓 저장
	 * @param List<LgszMrktVO>
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiCnptLgszMrktList(List<CnptVO> cnptList, List<LgszMrktVO> lgszMrktList) throws Exception;

}
