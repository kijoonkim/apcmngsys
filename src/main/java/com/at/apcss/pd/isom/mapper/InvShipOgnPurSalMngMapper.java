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
	 * @param InvShipOgnPurSalMngVO
	 * @return InvShipOgnPurSalMngVO
	 */
	public InvShipOgnPurSalMngVO selectInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매입 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngPrchsList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매출 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngSlsList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총 매입 매출 의 매입 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngPrchsListNew(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매출 리스트을 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return List<InvShipOgnPurSalMngVO>
	 */
	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngSlsListNew(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총 매입 매출 의 매입현황을 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 */
	public int insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매출현황-취급실적을 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 */
	public int insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);
	/**
	 * 출자출하조직 총 매입 매출 의 매출현황-통합조직 출하실적을 저장한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 */
	public int insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	public int deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	public List<InvShipOgnPurSalMngVO> selectRawDataList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총매입매출 입시저장
	 * @param InvShipOgnPurSalMngVO
	 * @return int
	 */
	public int updateTempSaveIsoAps(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	/**
	 * 출자출하조직 총 매입 매출 임시저장 정보
	 * @param InvShipOgnPurSalMngVO
	 * @return InvShipOgnPurSalMngVO
	 */
	public InvShipOgnPurSalMngVO selectTempSaveIsoAps(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);
}
