package com.at.apcss.pd.isom.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;


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
public interface InvShipOgnPurSalMngService {

	/**
	 * 정보를 조회한다.
	 * @param InvShipOgnPurSalMngVO
	 * @return
	 * @throws Exception
	 */
	public InvShipOgnPurSalMngVO selectInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	public int insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	public int insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	public int insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	public int updateInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

	public int multiSaveInvShipOgnPurSalMngList01(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception;

	public int multiSaveInvShipOgnPurSalMngList02(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception;

	public int multiSaveInvShipOgnPurSalMngList03(List<InvShipOgnPurSalMngVO> InvShipOgnPurSalMngVOList) throws Exception;

	public int deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;

}
