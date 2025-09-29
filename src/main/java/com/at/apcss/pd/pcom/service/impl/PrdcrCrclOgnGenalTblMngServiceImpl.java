package com.at.apcss.pd.pcom.service.impl;

import java.util.List;

import com.at.apcss.co.constants.ComConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcom.mapper.PrdcrCrclOgnGenalTblMngMapper;
import com.at.apcss.pd.isom.mapper.InvShipOgnSpeczItmPurSalMngMapper;
import com.at.apcss.pd.isom.vo.ItemStbltYnVO;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnGenalTblMngService;
import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnGenalTblMngVO;
import com.at.apcss.pd.pom.mapper.PrdcrOgnCurntMngMapper;
import com.at.apcss.pd.pom.vo.TbEvFrmhsApoVO;


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
@Service("prdcrCrclOgnGenalTblMngService")
public class PrdcrCrclOgnGenalTblMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnGenalTblMngService{

	@Autowired
	private PrdcrCrclOgnGenalTblMngMapper prdcrCrclOgnGenalTblMngMapper;

	@Autowired
	private InvShipOgnSpeczItmPurSalMngMapper invShipOgnSpeczItmPurSalMngMapper;

	@Autowired
	private PrdcrOgnCurntMngMapper prdcrOgnCurntMngMapper;

	@Override
	public PrdcrCrclOgnGenalTblMngVO selectPrdcrCrclOgnGenalTblMng(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMng(prdcrCrclOgnGenalTblMngVO);
	}

	@Override
	public List<PrdcrCrclOgnGenalTblMngVO> selectPrdcrCrclOgnGenalTblMngUoList(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngUoList(prdcrCrclOgnGenalTblMngVO);
	}

	@Override
	public List<ItemUoStbltYnVO> selectPrdcrCrclOgnGenalTblMngList(ItemUoStbltYnVO itemUoStbltYnVo) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngList(itemUoStbltYnVo);
	}

	@Override
	public int updateStbltYn(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.updateStbltYn(prdcrCrclOgnGenalTblMngVO);
	}

	@Override
	public int updatePrfmncCorpDdlnYn(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.updatePrfmncCorpDdlnYn(prdcrCrclOgnGenalTblMngVO);
	}

	@Override
	public List<ItemUoStbltYnVO> selectRawDataList(ItemUoStbltYnVO itemUoStbltYnVo) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectRawDataList(itemUoStbltYnVo);
	}
	@Override
	public List<ItemUoStbltYnVO> selectRawDataList2025(ItemUoStbltYnVO itemUoStbltYnVo) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectRawDataList2025(itemUoStbltYnVo);
	}

	@Override
	public int updateItemUoActnMttr(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.updateItemUoActnMttr(prdcrCrclOgnGenalTblMngVO);
	}

	@Override
	public int multiSaveItemUoActnMttr(List<PrdcrCrclOgnGenalTblMngVO> prdcrCrclOgnGenalTblMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO : prdcrCrclOgnGenalTblMngVOList) {
			savedCnt += updateItemUoActnMttr(prdcrCrclOgnGenalTblMngVO);
		}
		return savedCnt;
	}

	@Override
	public int updateFrmhsItem(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.updateFrmhsItem(prdcrCrclOgnGenalTblMngVO);
	}

	@Override
	public int updateUoIsoItem(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.updateUoIsoItem(prdcrCrclOgnGenalTblMngVO);
	}


	@Override
	public int updateAllFrmhsStbltYn (PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		List<TbEvFrmhsApoVO> frmhsList = prdcrCrclOgnGenalTblMngMapper.selectFrmhsStbltYnList(prdcrCrclOgnGenalTblMngVO);
		int updatedCnt = 0;
		for (TbEvFrmhsApoVO frmhsValue : frmhsList) {

			TbEvFrmhsApoVO resultVO = prdcrOgnCurntMngMapper.selectTbEvFrmhsApoStbltYn(frmhsValue);

			if (resultVO != null) {
				updatedCnt += prdcrOgnCurntMngMapper.updateTbEvFrmhsApoStbltYn(resultVO);
			}
		}
		return updatedCnt;
	}

	@Override
	public int updateAllIsoStbltYn(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {

		List<ItemStbltYnVO> frmhsList = prdcrCrclOgnGenalTblMngMapper.selectIsoStbltYnList(prdcrCrclOgnGenalTblMngVO);

		int updatedCnt = 0;
		for (ItemStbltYnVO uoValue : frmhsList) {
			List<ItemStbltYnVO> resultList = invShipOgnSpeczItmPurSalMngMapper.selectItemStbltYnList(uoValue);
			for (ItemStbltYnVO itemStbltYnVO : resultList) {
				if(itemStbltYnVO != null) {

					//itemStbltYnVO.setSysLastChgUserId(userId);
					//itemStbltYnVO.setSysLastChgPrgrmId(prgrmId);

					invShipOgnSpeczItmPurSalMngMapper.updateItemStbltYnInit(itemStbltYnVO);
					if(itemStbltYnVO.getItemCd() != null && !itemStbltYnVO.getItemCd().equals("")) {
						updatedCnt += invShipOgnSpeczItmPurSalMngMapper.updateItemStbltYn(itemStbltYnVO);
					}
				}
			}
		}
		return updatedCnt;
	}

	@Override
	public int updateAllUoStbltYn(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		String userId = prdcrCrclOgnGenalTblMngVO.getSysLastChgUserId();
		String prgrmId = prdcrCrclOgnGenalTblMngVO.getSysLastChgPrgrmId();
		List<ItemUoStbltYnVO> uoList = prdcrCrclOgnGenalTblMngMapper.selectUoStbltYnList(prdcrCrclOgnGenalTblMngVO);
		int updatedCnt = 0;
		for (ItemUoStbltYnVO uoValue : uoList) {
			List<ItemUoStbltYnVO> resultList = prdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngList(uoValue);
			for (ItemUoStbltYnVO itemUoStbltYnValue : resultList) {
				PrdcrCrclOgnGenalTblMngVO uoItemValue = new PrdcrCrclOgnGenalTblMngVO();
				uoItemValue.setSysLastChgUserId(userId);
				uoItemValue.setSysLastChgPrgrmId(prgrmId);
				uoItemValue.setItemCd(itemUoStbltYnValue.getItemCd());
				uoItemValue.setBrno(itemUoStbltYnValue.getBrno());
				uoItemValue.setYr(itemUoStbltYnValue.getYr());
				uoItemValue.setStbltYn(itemUoStbltYnValue.getStbltYn());
				if (itemUoStbltYnValue.getItemCd() != null && !itemUoStbltYnValue.getItemCd().equals("")) {
					updatedCnt += updateStbltYn(uoItemValue);
				}
			}
		}
		return updatedCnt;
	}

	@Override
	public List<PrdcrCrclOgnGenalTblMngVO> selectUoClsfTot(PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectUoClsfTot(prdcrCrclOgnGenalTblMngVO);
	}

	@Override
	public List<ItemUoStbltYnVO> selectUoPrchsSlsSummaryList(ItemUoStbltYnVO itemUoStbltYnVo) throws Exception {
		int yr = Integer.parseInt(itemUoStbltYnVo.getYr());
		if (yr < 2025) {
			itemUoStbltYnVo.setOldDataYn(ComConstants.CON_YES);
		}
		return prdcrCrclOgnGenalTblMngMapper.selectUoPrchsSlsSummaryList(itemUoStbltYnVo);
	}

	@Override
	public List<ItemUoStbltYnVO> selectPrdcrCrclOgnGenalTblMngListNew(ItemUoStbltYnVO itemUoStbltYnVo) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngListNew(itemUoStbltYnVo);
	}

	@Override
	public List<PrdcrCrclOgnGenalTblMngVO> selectPstTmepChk(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectPstTmepChk(PrdcrCrclOgnGenalTblMngVO);
	}

	@Override
	public List<PrdcrCrclOgnGenalTblMngVO> selectApsTmepChk(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		return prdcrCrclOgnGenalTblMngMapper.selectApsTmepChk(PrdcrCrclOgnGenalTblMngVO);
	}
}
