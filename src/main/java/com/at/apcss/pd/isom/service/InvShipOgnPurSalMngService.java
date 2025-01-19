package com.at.apcss.pd.isom.service;

import java.util.List;

import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface InvShipOgnPurSalMngService {

	/**
	 * 출자출하조직 총 매입 매출 정보를 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return InvShipOgnPurSalMngVO
	 * @throws Exception
	 */
	public InvShipOgnPurSalMngVO selectInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 * @throws Exception
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출의 매입 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 * @throws Exception
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngPrchsList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출의 매출 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 * @throws Exception
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngSlsList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 총 매입 매출의 매입 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 * @throws Exception
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngPrchsListNew(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출의 매출 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 * @throws Exception
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngSlsListNew(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 총 매입 매출 의 매입현황을 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출 의 매출현황-취급실적을 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출 의 매출현황-통합조직 출하실적을 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 * @throws Exception
	 */
	public int insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출 의 매입현황 리스트를 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveInvShipOgnPurSalMngList01(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출 의 매출현황-취급실적 리스트를 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveInvShipOgnPurSalMngList02(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception;
	/**
	 * 출자출하조직 총 매입 매출 의 매출현황-통합조직 출하실적 리스트를 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveInvShipOgnPurSalMngList03(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception;

	public int deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	public List<InvShipOgnPurSalMngVO> selectRawDataList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 총 매입 매출 임시저장 정보를 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return InvShipOgnPurSalMngVO
	 * @throws Exception
	 */
	public InvShipOgnPurSalMngVO selectTempSaveIsoAps(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

}
