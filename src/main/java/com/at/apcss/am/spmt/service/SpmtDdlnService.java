package com.at.apcss.am.spmt.service;

import java.util.HashMap;
import java.util.List;



/**
 * 생산속보 Service 인터페이스
 * @author 박승진
 * @since 2024.11.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.20  박승진        최초 생성
 * </pre>
 */
public interface SpmtDdlnService {

	/**
	 * 당일작업단가 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 작업내용 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectInvntrSttnOneList(HashMap<String,Object> spmtVO) throws Exception;


	/**
	 * 시황분석 등록
	 *
	 * @param List<HashMap<String,Object>>
	 * @return
	 * @throws Exception
	 */
	public int insertMrktAnlsList(List<HashMap<String,Object>> spmtVO) throws Exception;

	/**
	 * 작업내용 등록
	 *
	 * @param List<HashMap<String,Object>>
	 * @return
	 * @throws Exception
	 */
	public int insertJobCnList(List<HashMap<String,Object>> spmtVO) throws Exception;


	/**
	 * 당일작업단가 등록
	 *
	 * @param List<HashMap<String,Object>>
	 * @return
	 * @throws Exception
	 */
	public int insertDhtyJobList(List<HashMap<String,Object>> spmtVO) throws Exception;

	/**
	 * 재고현황1 등록
	 *
	 * @param List<HashMap<String,Object>>
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrSttn1(List<HashMap<String,Object>> spmtVO) throws Exception;



	/**
	 * 재고현황2 등록
	 *
	 * @param List<HashMap<String,Object>>
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrSttn2(List<HashMap<String,Object>> spmtVO) throws Exception;

	/**
	 * 재고현황2 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectInvntrSttnTwoList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 입고현황 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectWrhsSttnList(HashMap<String,Object> spmtVO) throws Exception;


	/**
	 * 입고현황 등록
	 *
	 * @param List<HashMap<String,Object>>
	 * @return
	 * @throws Exception
	 */
	public int insertWrhsSttn(List<HashMap<String,Object>> spmtVO) throws Exception;

	/**
	 * 당일작업단가 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 작업내용 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrOne(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황2 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteInvntrTwo(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 입고현황 삭제
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int deleteWrhsSttnList(HashMap<String,Object> spmtVO) throws Exception;




}
