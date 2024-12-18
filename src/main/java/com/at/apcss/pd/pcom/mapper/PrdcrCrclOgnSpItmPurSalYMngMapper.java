package com.at.apcss.pd.pcom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalYMngVO;

/**
 * 게시판 Mapper 인터페이스
 * @author
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21          최초 생성
 * </pre>
 */
@Mapper
public interface PrdcrCrclOgnSpItmPurSalYMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrCrclOgnSpItmPurSalYMngVO selectPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO);

	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngList(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO);

	public int insertPrdcrCrclOgnSpItmPurSalYMng(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO);

	public List<ItemUoStbltYnVO> selectItemUoStbltYnList(ItemUoStbltYnVO ItemUoStbltYnVo);

	public int updateItemUoStbltYn(ItemUoStbltYnVO ItemUoStbltYnVo);

	public void updateItemUoStbltYnInit(ItemUoStbltYnVO ItemUoStbltYnVo);

	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectRawDataList(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO);

	/* 개발서버 신규 화면 조회 */
	public List<PrdcrCrclOgnSpItmPurSalYMngVO> selectPrdcrCrclOgnSpItmPurSalYMngListNew(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO);
	/* 개발서버 신규 화면 등록 */
	public int insertPrdcrCrclOgnSpItmPurSalYMngNew(PrdcrCrclOgnSpItmPurSalYMngVO PrdcrCrclOgnSpItmPurSalYMngVO);
	/* 개발서버 신규 화면 적합여부 */
	public List<ItemUoStbltYnVO> selectItemUoStbltYnListNew(ItemUoStbltYnVO ItemUoStbltYnVo);
}
