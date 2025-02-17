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
	 * @param InvShipOgnGenalTblMngVO
	 * @return InvShipOgnGenalTblMngVO
	 */
	public InvShipOgnGenalTblMngVO selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO);

	/**
	 * 총괄표 리스트를 조회 한다
	 * @param InvShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO);

	/**
	 * 총괄표 출자출하 리스트를 조회 한다
	 * @param InvShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngIsoList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO);

	/**
	 * 총괄표를 저장 한다
	 * @param InvShipOgnGenalTblMngVO
	 * @return int
	 */
	public int updateStbltYn(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO);

	/**
	 * 로우데이터를 조회 한다
	 * @param InvShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectRawDataList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO);

	/**
	 * 총괄표 리스트를 조회 한다
	 * @param InvShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngListNew(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO);

	/**
	 * 로우데이터를 조회 한다 2025년
	 * @param InvShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectRawDataList2025(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO);

	/**
	 * 부류별 합계를 조회 한다
	 * @param InvShipOgnGenalTblMngVO
	 * @return List<InvShipOgnGenalTblMngVO>
	 */
	public List<InvShipOgnGenalTblMngVO> selectIsoClsfTot(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO);

}
