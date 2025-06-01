package com.at.apcss.pd.isom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;
import com.at.apcss.pd.isom.vo.ItemStbltYnVO;

/**
 * 게시판 Mapper 인터페이스
 * @author
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
public interface InvShipOgnSpeczItmPurSalMngMapper {


	/**
	 *
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	public int insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	public List<ItemStbltYnVO> selectItemStbltYnList(ItemStbltYnVO itemStbltYnVo);

	public int updateItemStbltYn(ItemStbltYnVO itemStbltYnVo);

	public void updateItemStbltYnInit(ItemStbltYnVO itemStbltYnVo);

	/**
	 * 출자출하조직 전문품목 매입매출 로우데이터 조회 2024년
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 로우데이터 조회 2025년
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList2025(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 rawdata 목록 조회
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectIsoMajorItemPurchaseRawDataList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 목록 조회
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectIsoMajorItemPurchaseList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 조회 2025년
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngListNew(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 저장 2025년
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return int
	 */
	public int insertInvShipOgnSpeczItmPurSalMngNew(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 저장 전 기존 데이터 삭제 처리
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return int
	 */
	public int updateDelYn(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 총매입매출 임시저장 처리.
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return int
	 */
	public int updateTempSaveAps(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 전문품목 매입매출 임시저장 처리.
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return int
	 */
	public int updateTempSavePst(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);

	/**
	 * 임시저장 정보를 조회한다.
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return InvShipOgnSpeczItmPurSalMngVO
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectTempSaveIsoPst(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO);
}
