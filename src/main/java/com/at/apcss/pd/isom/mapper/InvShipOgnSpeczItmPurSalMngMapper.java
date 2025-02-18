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
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	public int insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	public List<ItemStbltYnVO> selectItemStbltYnList(ItemStbltYnVO ItemStbltYnVo);

	public int updateItemStbltYn(ItemStbltYnVO ItemStbltYnVo);

	public void updateItemStbltYnInit(ItemStbltYnVO ItemStbltYnVo);

	/**
	 * 출자출하조직 전문품목 매입매출 로우데이터 조회 2024년
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 로우데이터 조회 2025년
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList2025(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 조회 2025년
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngListNew(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 저장 2025년
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return int
	 */
	public int insertInvShipOgnSpeczItmPurSalMngNew(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	/**
	 * 출자출하조직 전문품목 매입매출 저장 전 기존 데이터 삭제 처리
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return int
	 */
	public int updateDelYn(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	/**
	 * 총매입매출 임시저장 처리.
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return int
	 */
	public int updateTempSaveAps(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	/**
	 * 전문품목 매입매출 임시저장 처리.
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return int
	 */
	public int updateTempSavePst(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	/**
	 * 임시저장 정보를 조회한다.
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return InvShipOgnSpeczItmPurSalMngVO
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectTempSaveIsoPst(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);
}
