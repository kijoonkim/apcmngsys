package com.at.apcss.pd.isom.service;

import java.util.List;

import com.at.apcss.pd.isom.vo.InvShipOgnGenalTblMngVO;


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
public interface InvShipOgnGenalTblMngService {

	/**
	 * 정보를 조회한다.
	 * @param invShipOgnGenalTblMngVO
	 * @return InvShipOgnGenalTblMngVO
	 * @throws Exception
	 */
	public InvShipOgnGenalTblMngVO selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngIsoList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	public int updateStbltYn(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectRawDataList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	/**
	 * 통합조직 총괄표 목록 조회
	 * @param invShipOgnGenalTblMngVO
	 * @return
	 * @throws Exception
	 */
	public List<InvShipOgnGenalTblMngVO> selectUoPrchsSlsSummaryList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngListNew(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	/**
	 * 출자출하조직총괄표 목록조회
	 * @param invShipOgnGenalTblMngVO
	 * @return
	 * @throws Exception
	 */
	public List<InvShipOgnGenalTblMngVO> selectIsoPrchsSlsSummaryList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectRawDataList2025(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;
	
	public List<InvShipOgnGenalTblMngVO> selectIsoPrchsSlsRawdataList(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectIsoClsfTot(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	/**
	 * 조치사항을 저장한다.
	 * @param invShipOgnGenalTblMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateItemIsoActnMttr(InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO) throws Exception;

	/**
	 * 조치사항을 저장한다.
	 * @param List<InvShipOgnGenalTblMngVO>
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveItemIsoActnMttr(List<InvShipOgnGenalTblMngVO> InvShipOgnGenalTblMngVOList) throws Exception;
}
