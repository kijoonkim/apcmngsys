package com.at.apcss.pd.isom.service;

import java.util.List;

import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;
import com.at.apcss.pd.isom.vo.ItemStbltYnVO;


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
public interface InvShipOgnSpeczItmPurSalMngService {

	/**
	 * 정보를 조회한다.
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return
	 * @throws Exception
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	public int insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	public int updateInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	public int multiSaveInvShipOgnSpeczItmPurSalMngList(List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngVOList) throws Exception;

	public int deleteInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	public List<ItemStbltYnVO> selectItemStbltYnList(ItemStbltYnVO itemStbltYnVo) throws Exception;

	public int updateItemStbltYn(ItemStbltYnVO itemStbltYnVo) throws Exception;

	/**
	 * 출자출하조직 전문품목 매입매출 로우데이터를 조회 한다. 2024년
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 * @throws Exception
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 전문품목 매입매출 로우데이터를 조회 한다. 2025년
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 * @throws Exception
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList2025(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 전문품목 매입매출 rawdata 목록 조회
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return
	 * @throws Exception
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectIsoMajorItemPurchaseRawDataList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 전문품목 매입매출 목록 조회
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return
	 * @throws Exception
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectIsoMajorItemPurchaseList(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 전문품목 매입매출 조회 한다. 2025년
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 * @throws Exception
	 */
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngListNew(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 전문품목 매입매출 저장 한다. 2025년
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 * @throws Exception
	 */
	public int insertInvShipOgnSpeczItmPurSalMngNew(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;

	/**
	 * 출자출하조직 전문품목 매입매출 리스트를 저장 한다. 2025년
	 * @param invShipOgnSpeczItmPurSalMngVOList
	 * @return List<InvShipOgnSpeczItmPurSalMngVO>
	 * @throws Exception
	 */
	public int multiSaveInvShipOgnSpeczItmPurSalMngListNew(List<InvShipOgnSpeczItmPurSalMngVO> invShipOgnSpeczItmPurSalMngVOList) throws Exception;

	/**
	 * 임시저장 정보를 조회한다.
	 * @param invShipOgnSpeczItmPurSalMngVO
	 * @return InvShipOgnSpeczItmPurSalMngVO
	 * @throws Exception
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectTempSaveIsoPst(InvShipOgnSpeczItmPurSalMngVO invShipOgnSpeczItmPurSalMngVO) throws Exception;
}
