package com.at.apcss.pd.pom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;

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

	public int insertPrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO);

	public int updatePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO);

	public int deletePrdcrOgnCurntMng(PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO) throws Exception;
}
