package com.at.apcss.pd.isom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.isom.vo.InvShipOgnGenalTblMngVO;

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
public interface InvShipOgnGenalTblMngMapper {


	/**
	 * 총괄표를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return InvShipOgnGenalTblMngVO
	 */
	public InvShipOgnGenalTblMngVO selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);

	/**
	 * 총괄표 리스트를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);

	/**
	 * 총괄표 출자출하 리스트를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngIsoList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);

	/**
	 * 총괄표를 저장 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return int
	 */
	public int updateStbltYn(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);

	/**
	 * 로우데이터를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectRawDataList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);


	/**
	 * 출자출하조직 구 총괄표 로우데이터를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectInvstSpmtOgnzOvsTableRawDataList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);

	/**
	 * 출자출하조직 구 총괄표 로우데이터를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectInvstOldSpmtOgnzOvsTableRawDataList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);


	/**
	 * 사업자에 대한 총괄표 데이터를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectIsoPrchsSlsSummaryList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);


	/**
	 * 총괄표 리스트를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectUoPrchsSlsSummaryList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);


	/**
	 * 총괄표 리스트를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngListNew(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);


	/**
	 * 출자출하조직 총괄표 rawdata 목록을 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectIsoPrchsSlsRawdataList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);


	/**
	 * 로우데이터를 조회 한다 2025년
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectRawDataList2025(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);

	/**
	 * 부류별 합계를 조회 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectIsoClsfTot(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);

	/**
	 * 조치사항을 저장 한다
	 * @param invShipOgnGenalTblMngVO
	 * @return int
	 */
	public int updateItemIsoActnMttr(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO);

}
