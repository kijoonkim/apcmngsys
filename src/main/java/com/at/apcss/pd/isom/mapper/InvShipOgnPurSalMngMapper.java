package com.at.apcss.pd.isom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;

/**
 * 게시판 Mapper 인터페이스
 * @author 정연두
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
@Mapper
public interface InvShipOgnPurSalMngMapper {


	/**
	 * 출자출하조직 총 매입 매출을 조회한다.
	 * @param invShipOgnPurSalMngVO
	 * @return InvShipOgnPurSalMngVO
	 */
	public InvShipOgnPurSalMngVO selectInvShipOgnPurSalMng(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 리스트을 조회한다.
	 * @param invShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매입 리스트을 조회한다.
	 * @param invShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngPrchsList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매출 리스트을 조회한다.
	 * @param invShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngSlsList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총 매입 매출 의 매입 리스트을 조회한다.
	 * @param invShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngPrchsListNew(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매출 리스트을 조회한다.
	 * @param invShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngSlsListNew(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총 매입 매출 의 매입현황을 저장한다.
	 * @param invShipOgnPurSalMngVO
	 * @return int
	 */
	public int insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매출현황-취급실적을 저장한다.
	 * @param invShipOgnPurSalMngVO
	 * @return int
	 */
	public int insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매출현황-통합조직 출하실적을 저장한다.
	 * @param invShipOgnPurSalMngVO
	 * @return int
	 */
	public int insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	public int deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 총매입매출 로우데이터를 조회 한다.2024년
	 * @param invShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectRawDataList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총매입매출 로우데이터를 조회 한다.2025년
	 * @param invShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectRawDataList2025(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총매입매출 입시저장
	 * @param invShipOgnPurSalMngVO
	 * @return int
	 */
	public int updateTempSaveIsoAps(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총 매입 매출 임시저장 정보
	 * @param invShipOgnPurSalMngVO
	 * @return InvShipOgnPurSalMngVO
	 */
	public InvShipOgnPurSalMngVO selectTempSaveIsoAps(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	/**
	 *
	 * @param invShipOgnPurSalMngVO
	 * @return
	 */
	public List<InvShipOgnPurSalMngVO> selectIsoTotalPurchaseSaleRawDataList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	/**
	 *
	 * @param invShipOgnPurSalMngVO
	 * @return
	 */
	public List<InvShipOgnPurSalMngVO> selectIsoTotalPurchaseSaleList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

	/**
	 *
	 * @param invShipOgnPurSalMngVO
	 * @return
	 */
	public List<InvShipOgnPurSalMngVO> selectIsoTotalSaleList(InvShipOgnPurSalMngVO invShipOgnPurSalMngVO);

}
