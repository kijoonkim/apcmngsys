package com.at.apcss.pd.aom.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.aom.vo.GpcVO;
import com.at.apcss.pd.aom.vo.InvShipOgnReqMngVO;


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
public interface InvShipOgnReqMngService {

	/**
	 * 정보를 조회한다.
	 * @param InvShipOgnReqMngVO
	 * @return
	 * @throws Exception
	 */
	public InvShipOgnReqMngVO selectInvShipOgnReqMng(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception;

	public List<InvShipOgnReqMngVO> selectInvShipOgnReqMngList(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception;

	public int insertInvShipOgnReqMng(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception;

	public int updateInvShipOgnReqMng(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception;

	public int multiSaveInvShipOgnReqMngList(List<InvShipOgnReqMngVO> InvShipOgnReqMngVOList) throws Exception;

	public int deleteInvShipOgnReqMng(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception;

	public List<InvShipOgnReqMngVO> hiddenGrdIsoSelectList(InvShipOgnReqMngVO InvShipOgnReqMngVO) throws Exception;

	/**
	 * 품목 리스트를 조회한다.
	 * @param GpcVO
	 * @return List<GpcVO>
	 * @throws Exception
	 */
	public List<GpcVO> selectGpcList(GpcVO gpcVO) throws Exception;

	/**
	 * 품목 리스트를 등록한다.
	 * @param GpcVO
	 * @return int
	 * @throws Exception
	 */
	public int multiSaveGpcList(List<GpcVO> gpcVOList) throws Exception;

	/**
	 * 품목을 등록한다.
	 * @param GpcVO
	 * @return int
	 * @throws Exception
	 */
	public int insertGpc(GpcVO gpcVO) throws Exception;

	/**
	 * 품목을 삭제한다.
	 * @param GpcVO
	 * @return int
	 * @throws Exception
	 */
	public int deleteGpc(GpcVO gpcVO) throws Exception;

}
