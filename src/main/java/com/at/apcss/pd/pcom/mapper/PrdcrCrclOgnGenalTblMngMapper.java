package com.at.apcss.pd.pcom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.isom.vo.ItemStbltYnVO;
import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnGenalTblMngVO;
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
public interface PrdcrCrclOgnGenalTblMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrCrclOgnGenalTblMngVO selectPrdcrCrclOgnGenalTblMng(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);

	public List<ItemUoStbltYnVO> selectPrdcrCrclOgnGenalTblMngList(ItemUoStbltYnVO ItemUoStbltYnVo);

	public List<PrdcrCrclOgnGenalTblMngVO> selectPrdcrCrclOgnGenalTblMngUoList(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);

	public int updateStbltYn(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);

	public int updatePrfmncCorpDdlnYn(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);


	/**
	 * 총괄표 로우데이터
	 * @param ItemUoStbltYnVO
	 * @return List<ItemUoStbltYnVO>
	 * @throws Exception
	 */
	public List<ItemUoStbltYnVO> selectRawDataList(ItemUoStbltYnVO ItemUoStbltYnVo);

	public int updateItemUoActnMttr(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);

	/**
	 * 생산자조직 세부정보 업데이트
	 * @param PrdcrCrclOgnGenalTblMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateFrmhsItem(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);
	/**
	 * 전문품목 매입매출 세부정보 업데이트
	 * @param PrdcrCrclOgnGenalTblMngVO
	 * @return int
	 * @throws Exception
	 */
	public int updateUoIsoItem(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);

	/**
	 * 생산자조직 리스트 조회.
	 * @param PrdcrCrclOgnGenalTblMngVO
	 * @return List<ItemUoStbltYnVO>
	 * @throws Exception
	 */
	public List<TbEvFrmhsApoVO> selectFrmhsStbltYnList(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);

	/**
	 * 출자출하조직 리스트 조회.
	 * @param PrdcrCrclOgnGenalTblMngVO
	 * @return List<ItemUoStbltYnVO>
	 * @throws Exception
	 */
	public List<ItemStbltYnVO> selectIsoStbltYnList(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);

	/**
	 * 통합조직 리스트 조회.
	 * @param PrdcrCrclOgnGenalTblMngVO
	 * @return List<ItemUoStbltYnVO>
	 * @throws Exception
	 */
	public List<ItemUoStbltYnVO> selectUoStbltYnList(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);

	/**
	 * 부류별 합계
	 * @param PrdcrCrclOgnGenalTblMngVO
	 * @return List<PrdcrCrclOgnGenalTblMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnGenalTblMngVO> selectIsoClsfTot(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO);
}
