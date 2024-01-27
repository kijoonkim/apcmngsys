package com.at.apcss.pd.pom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;
import com.at.apcss.pd.pom.vo.TbEvFrmhsApoVO;

/**
 * 게시판 Mapper 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Mapper
public interface PrdcrOgnCurntMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrOgnCurntMngVO selectPrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO);

	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO);


	public int updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO);


	//농가리스트 조회
	public List<PrdcrOgnCurntMngVO> selectPrdcrOgnCurntMngDtlList(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO);
	//농가 저장
	public int insertPrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO);
	//농가 삭제
	public int deletePrdcrOgnCurntMngDtl(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;

	//생산자 조직
	public TbEvFrmhsApoVO selectTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO);

	public List<TbEvFrmhsApoVO> selectTbEvFrmhsApoList(TbEvFrmhsApoVO tbEvFrmhsApoVO);

	public int insertTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO);

	public int deleteTbEvFrmhsApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

	public int deleteTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

	public int updateTbEvFrmhsPrdctnEcSpmtSttnApo(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;
	//생산자조직 적합여부 체크
	public int updateTbEvFrmhsApoStbltYn(TbEvFrmhsApoVO tbEvFrmhsApoVO) throws Exception;

	public TbEvFrmhsApoVO selectTbEvFrmhsApoStbltYn(TbEvFrmhsApoVO tbEvFrmhsApoVO);
}
