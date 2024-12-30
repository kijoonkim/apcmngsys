package com.at.apcss.pd.pcom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalNMngVO;

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
public interface PrdcrCrclOgnSpItmPurSalNMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrCrclOgnSpItmPurSalNMngVO selectPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO);

	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectPrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO);

	public int insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO);

	public List<ItemUoStbltYnVO> selectItemUoStbltYnList(ItemUoStbltYnVO ItemUoStbltYnVo);

	public int updateItemUoStbltYn(ItemUoStbltYnVO ItemUoStbltYnVo);

	public void updateItemUoStbltYnInit(ItemUoStbltYnVO ItemUoStbltYnVo);

	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectRawDataList(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalYMngVO);

	//20241212 개발서버 신규 화면 조회
	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectPrdcrCrclOgnSpItmPurSalNMngListNew(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO);
	//20241212 개발서버 신규 화면 등록
	public int insertPrdcrCrclOgnSpItmPurSalNMngNew(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO);
	//저장전 기존 데이터 삭제 처리
	public int updateDelYn(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO);
}
