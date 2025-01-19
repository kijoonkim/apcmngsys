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
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return
	 * @throws Exception
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;

	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;

	public int insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;

	public int updateInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;

	public int multiSaveInvShipOgnSpeczItmPurSalMngList(List<InvShipOgnSpeczItmPurSalMngVO> InvShipOgnSpeczItmPurSalMngVOList) throws Exception;

	public int deleteInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;

	public List<ItemStbltYnVO> selectItemStbltYnList(ItemStbltYnVO ItemStbltYnVo) throws Exception;

	public int updateItemStbltYn(ItemStbltYnVO ItemStbltYnVo) throws Exception;

	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;

	//20241212 개발서버 신규 화면 조회
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngListNew(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;
	//20241212 개발서버 신규 화면 등록
	public int insertInvShipOgnSpeczItmPurSalMngNew(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;
	//20241212 개발서버 신규 화면 등록
	public int multiSaveInvShipOgnSpeczItmPurSalMngListNew(List<InvShipOgnSpeczItmPurSalMngVO> InvShipOgnSpeczItmPurSalMngVOList) throws Exception;

	/**
	 * 임시저장 정보를 조회한다.
	 * @param InvShipOgnSpeczItmPurSalMngVO
	 * @return InvShipOgnSpeczItmPurSalMngVO
	 * @throws Exception
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectTempSaveIsoPst(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception;
}
