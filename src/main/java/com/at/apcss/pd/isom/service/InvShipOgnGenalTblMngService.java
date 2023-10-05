package com.at.apcss.pd.isom.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
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
	 * @return
	 * @throws Exception
	 */
	public InvShipOgnGenalTblMngVO selectInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public List<InvShipOgnGenalTblMngVO> selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public int insertInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public int updateInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

	public int multiSaveInvShipOgnGenalTblMngList(List<InvShipOgnGenalTblMngVO> InvShipOgnGenalTblMngVOList) throws Exception;

	public int deleteInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO) throws Exception;

}
