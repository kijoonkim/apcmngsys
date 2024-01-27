package com.at.apcss.pd.pom.service;

import java.util.List;

import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.at.apcss.pd.pom.vo.TbEvFrmhsApoVO;


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
public interface PrdcrOgnCurntMngService {

	/**
	 * 정보를 조회한다.
	 * @param PrdcrOgnCurntMngVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrOgnCurntMngVO selectPrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;

	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;


	public int updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;



	//농가리스트 조회
	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;
	//농가 리스트 저장
	public int multiSavePrdcrOgnCurntMngDtlList(List<PrdcrOgnCurntMngVO> PrdcrOgnCurntMngVOList) throws Exception;
	//농가 저장
	public int insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;
	//농가 삭제
	public int deletePrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;


	//생산자조직
	public TbEvFrmhsApoVO selectTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

	public List<TbEvFrmhsApoVO> selectTbEvFrmhsApoList(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

	public int multiSaveTbEvFrmhsApoList(List<TbEvFrmhsApoVO> tbEvFrmhsApoVOList) throws Exception;

	public int insertTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

	public int deleteTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

	public int deleteTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

	public int updateTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;
	//생산자조직 적합여부 체크
	public int updateTbEvFrmhsApoStbltYn(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;
	//생산자조직 적합여부 체크
	public TbEvFrmhsApoVO selectTbEvFrmhsApoStbltYn(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

}
