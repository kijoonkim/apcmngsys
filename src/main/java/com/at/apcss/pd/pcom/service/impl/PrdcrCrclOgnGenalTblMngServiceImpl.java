package com.at.apcss.pd.pcom.service.impl;

import java.util.List;
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
@Service("PrdcrCrclOgnGenalTblMngService")
public class PrdcrCrclOgnGenalTblMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnGenalTblMngService{

	@Autowired
	private PrdcrCrclOgnGenalTblMngMapper PrdcrCrclOgnGenalTblMngMapper;

	@Autowired
	private InvShipOgnSpeczItmPurSalMngMapper InvShipOgnSpeczItmPurSalMngMapper;

	@Autowired
	private PrdcrOgnCurntMngMapper PrdcrOgnCurntMngMapper;

	@Override
	public PrdcrCrclOgnGenalTblMngVO selectPrdcrCrclOgnGenalTblMng(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {

		PrdcrCrclOgnGenalTblMngVO resultVO = PrdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMng(PrdcrCrclOgnGenalTblMngVO);

		return resultVO;
	}

	@Override
	public List<PrdcrCrclOgnGenalTblMngVO> selectPrdcrCrclOgnGenalTblMngUoList(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {

		List<PrdcrCrclOgnGenalTblMngVO> resultList = PrdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngUoList(PrdcrCrclOgnGenalTblMngVO);
		return resultList;
	}

	@Override
	public List<ItemUoStbltYnVO> selectPrdcrCrclOgnGenalTblMngList(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception {

		List<ItemUoStbltYnVO> resultList = PrdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngList(ItemUoStbltYnVo);
		return resultList;
	}

	@Override
	public int updateStbltYn(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		int updatedCnt = PrdcrCrclOgnGenalTblMngMapper.updateStbltYn(PrdcrCrclOgnGenalTblMngVO);

		return updatedCnt;
	}

	@Override
	public int updatePrfmncCorpDdlnYn(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		int updatedCnt = PrdcrCrclOgnGenalTblMngMapper.updatePrfmncCorpDdlnYn(PrdcrCrclOgnGenalTblMngVO);

		return updatedCnt;
	}

	@Override
	public List<ItemUoStbltYnVO> selectRawDataList(ItemUoStbltYnVO ItemUoStbltYnVo) throws Exception {

		List<ItemUoStbltYnVO> resultList = PrdcrCrclOgnGenalTblMngMapper.selectRawDataList(ItemUoStbltYnVo);
		return resultList;
	}

	@Override
	public int updateItemUoActnMttr(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		int updatedCnt = PrdcrCrclOgnGenalTblMngMapper.updateItemUoActnMttr(PrdcrCrclOgnGenalTblMngVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveItemUoActnMttr(List<PrdcrCrclOgnGenalTblMngVO> PrdcrCrclOgnGenalTblMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO : PrdcrCrclOgnGenalTblMngVOList) {
			savedCnt += updateItemUoActnMttr(PrdcrCrclOgnGenalTblMngVO);
		}
		return savedCnt;
	}

	@Override
	public int updateFrmhsItem(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		int updatedCnt = PrdcrCrclOgnGenalTblMngMapper.updateFrmhsItem(PrdcrCrclOgnGenalTblMngVO);
		return updatedCnt;
	}

	@Override
	public int updateUoIsoItem(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		int updatedCnt = PrdcrCrclOgnGenalTblMngMapper.updateUoIsoItem(PrdcrCrclOgnGenalTblMngVO);
		return updatedCnt;
	}


	@Override
	public int updateAllFrmhsStbltYn (PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		//String userId = PrdcrCrclOgnGenalTblMngVO.getSysLastChgUserId();
		//String prgrmId = PrdcrCrclOgnGenalTblMngVO.getSysLastChgPrgrmId();

		List<TbEvFrmhsApoVO> frmhsList = PrdcrCrclOgnGenalTblMngMapper.selectFrmhsStbltYnList(PrdcrCrclOgnGenalTblMngVO);
		int updatedCnt = 0;
		for (TbEvFrmhsApoVO frmhsValue : frmhsList) {

			TbEvFrmhsApoVO resultVO = PrdcrOgnCurntMngMapper.selectTbEvFrmhsApoStbltYn(frmhsValue);

			if(resultVO != null) {
				//resultVO.setSysLastChgUserId(userId);
				//resultVO.setSysLastChgPrgrmId(prgrmId);
				updatedCnt += PrdcrOgnCurntMngMapper.updateTbEvFrmhsApoStbltYn(resultVO);
			}
		}
		return updatedCnt;
	}

	@Override
	public int updateAllIsoStbltYn(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		//String userId = PrdcrCrclOgnGenalTblMngVO.getSysLastChgUserId();
		//String prgrmId = PrdcrCrclOgnGenalTblMngVO.getSysLastChgPrgrmId();

		List<ItemStbltYnVO> frmhsList = PrdcrCrclOgnGenalTblMngMapper.selectIsoStbltYnList(PrdcrCrclOgnGenalTblMngVO);

		int updatedCnt = 0;
		for (ItemStbltYnVO uoValue : frmhsList) {
			List<ItemStbltYnVO> resultList = InvShipOgnSpeczItmPurSalMngMapper.selectItemStbltYnList(uoValue);
			for (ItemStbltYnVO itemStbltYnVO : resultList) {
				if(itemStbltYnVO != null) {

					//itemStbltYnVO.setSysLastChgUserId(userId);
					//itemStbltYnVO.setSysLastChgPrgrmId(prgrmId);

					InvShipOgnSpeczItmPurSalMngMapper.updateItemStbltYnInit(itemStbltYnVO);
					if(itemStbltYnVO.getItemCd() != null && !itemStbltYnVO.getItemCd().equals("")) {
						updatedCnt += InvShipOgnSpeczItmPurSalMngMapper.updateItemStbltYn(itemStbltYnVO);
					}
				}
			}
		}
		return updatedCnt;
	}

	@Override
	public int updateAllUoStbltYn(PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO) throws Exception {
		String userId = PrdcrCrclOgnGenalTblMngVO.getSysLastChgUserId();
		String prgrmId = PrdcrCrclOgnGenalTblMngVO.getSysLastChgPrgrmId();
		List<ItemUoStbltYnVO> uoList = PrdcrCrclOgnGenalTblMngMapper.selectUoStbltYnList(PrdcrCrclOgnGenalTblMngVO);
		int updatedCnt = 0;
		for (ItemUoStbltYnVO uoValue : uoList) {
			List<ItemUoStbltYnVO> resultList = PrdcrCrclOgnGenalTblMngMapper.selectPrdcrCrclOgnGenalTblMngList(uoValue);
			for (ItemUoStbltYnVO itemUoStbltYnValue : resultList) {
				PrdcrCrclOgnGenalTblMngVO uoItemValue = new PrdcrCrclOgnGenalTblMngVO();
				uoItemValue.setSysLastChgUserId(userId);
				uoItemValue.setSysLastChgPrgrmId(prgrmId);
				uoItemValue.setItemCd(itemUoStbltYnValue.getItemCd());
				uoItemValue.setBrno(itemUoStbltYnValue.getBrno());
				uoItemValue.setYr(itemUoStbltYnValue.getYr());
				uoItemValue.setStbltYn(itemUoStbltYnValue.getStbltYn());
				if(itemUoStbltYnValue.getItemCd() != null && !itemUoStbltYnValue.getItemCd().equals("")) {
					updatedCnt += updateStbltYn(uoItemValue);
				}
			}
		}
		return updatedCnt;
	}
}
