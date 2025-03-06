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
	 * @param InvShipOgnGenalTblMngVO
	 * @return InvShipOgnGenalTblMngVO
	 * @throws Exception
	 */
	public InvShipOgnGenalTblMngVO selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngIsoList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public int updateStbltYn(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectRawDataList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngListNew(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectRawDataList2025(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectIsoClsfTot(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	/**
	 * 조치사항을 저장한다.
	 * @param InvShipOgnGenalTblMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateItemIsoActnMttr(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	/**
	 * 조치사항을 저장한다.
	 * @param List<InvShipOgnGenalTblMngVO>
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveItemIsoActnMttr(List<InvShipOgnGenalTblMngVO> InvShipOgnGenalTblMngVOList) throws Exception;
}
