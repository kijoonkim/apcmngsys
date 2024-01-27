package com.at.apcss.pd.pcom.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnSpItmPurSalNMngMapper;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalNMngService;
import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalNMngVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("PrdcrCrclOgnSpItmPurSalNMngService")
public class PrdcrCrclOgnSpItmPurSalNMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnSpItmPurSalNMngService{

	@Autowired
	private PrdcrCrclOgnSpItmPurSalNMngMapper PrdcrCrclOgnSpItmPurSalNMngMapper;

	@Override
	public PrdcrCrclOgnSpItmPurSalNMngVO selectPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {

		PrdcrCrclOgnSpItmPurSalNMngVO resultVO = PrdcrCrclOgnSpItmPurSalNMngMapper.selectPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnSpItmPurSalNMngVO> selectPrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {

		List<PrdcrCrclOgnSpItmPurSalNMngVO> resultList = PrdcrCrclOgnSpItmPurSalNMngMapper.selectPrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVO);
		return resultList;
	}

	@Override
	public int insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {

		int insertedCnt = PrdcrCrclOgnSpItmPurSalNMngMapper.insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {

		int updatedCnt = 0;

		return updatedCnt;
	}

	@Override
	public int deletePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO) throws Exception {
		return 0;
	}

	@Override
	public int multiSavePrdcrCrclOgnSpItmPurSalNMngList(List<PrdcrCrclOgnSpItmPurSalNMngVO> PrdcrCrclOgnSpItmPurSalNMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//통합조직 사업자번호
		for (PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO : PrdcrCrclOgnSpItmPurSalNMngVOList) {
			yrVal = PrdcrCrclOgnSpItmPurSalNMngVO.getYr();
			brnoVal = PrdcrCrclOgnSpItmPurSalNMngVO.getBrno();
			if(ComConstants.ROW_STS_INSERT.equals(PrdcrCrclOgnSpItmPurSalNMngVO.getRowSts())) {
				savedCnt += insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(PrdcrCrclOgnSpItmPurSalNMngVO.getRowSts())) {
				savedCnt += updatePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);
			}
		}
		int stbltYnUpdateCnt = 0;
		//전문품목 매입 매출 저장 완료 후 적합여부 체크
		if(yrVal != null && !yrVal.equals("")
			&& brnoVal != null && !brnoVal.equals("")){
			List<ItemUoStbltYnVO> resultVoList = new ArrayList<>();
			ItemUoStbltYnVO ItemStbltYnVo = new ItemUoStbltYnVO();

			ItemStbltYnVo.setYr(yrVal);
			ItemStbltYnVo.setBrno(brnoVal);
			resultVoList = selectItemUoStbltYnList(ItemStbltYnVo);
			//조회 결과가 있을 경우에만 업데이트
			if(resultVoList != null) {
				for (ItemUoStbltYnVO resultVo : resultVoList) {
					stbltYnUpdateCnt += updateItemUoStbltYn(resultVo);
				}
			}
		}
		return savedCnt;
	}

	//품목별 적합여부 리스트
		@Override
		public List<ItemUoStbltYnVO> selectItemUoStbltYnList(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception {

			List<ItemUoStbltYnVO> resultList = PrdcrCrclOgnSpItmPurSalNMngMapper.selectItemUoStbltYnList(ItemUoStbltYnVo);
			return resultList;
		}
		//적합여부 업데이트
		@Override
		public int updateItemUoStbltYn(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception {

			int insertedCnt = PrdcrCrclOgnSpItmPurSalNMngMapper.updateItemUoStbltYn(ItemUoStbltYnVo);

			return insertedCnt;
		}
}
