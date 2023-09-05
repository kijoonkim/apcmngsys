package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsItemMapper;
import com.at.apcss.am.cmns.service.CmnsGrdService;
import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.service.CmnsSpcfctService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.cmns.vo.CmnsGrdVO;
import com.at.apcss.am.cmns.vo.CmnsItemVO;
import com.at.apcss.am.cmns.vo.CmnsSpcfctVO;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.co.constants.ComConstants;

/**
 * @Class Name : CmnsItemServiceImpl.java
 * @Description : 품목정보관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("cmnsItemService")
public class CmnsItemServiceImpl implements CmnsItemService {

	@Autowired
	private CmnsItemMapper cmnsItemMapper;

	@Resource(name = "cmnsVrtyService")
	private CmnsVrtyService cmnsVrtyService;

	@Resource(name = "cmnsSpcfctService")
	private CmnsSpcfctService cmnsSpcfctService;

	@Resource(name = "cmnsGrdService")
	private CmnsGrdService cmnsGrdService;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public CmnsItemVO selectCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {

		CmnsItemVO resultVO = cmnsItemMapper.selectCmnsItem(cmnsItemVO);

		return resultVO;
	}

	@Override
	public List<CmnsItemVO> selectCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception {

		List<CmnsItemVO> resultList = cmnsItemMapper.selectCmnsItemList(cmnsItemVO);

		return resultList;
	}

	@Override
	public int insertCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {

		int insertedCnt = cmnsItemMapper.insertCmnsItem(cmnsItemVO);

		return insertedCnt;
	}

	@Override
	public int updateCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {

		int updatedCnt = cmnsItemMapper.updateCmnsItem(cmnsItemVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		String errMsg = cmnsValidationService.selectChkCdDelible(cmnsItemVO.getApcCd(), "ITEM_CD", cmnsItemVO.getItemCd());

		int deletedCnt = 0;
		if(errMsg == null ) {

			CmnsGrdVO grdVO	= new CmnsGrdVO();
			grdVO.setApcCd(cmnsItemVO.getApcCd());
			grdVO.setItemCd(cmnsItemVO.getItemCd());

			cmnsGrdService.deleteApcGrdAll(grdVO);

			CmnsSpcfctVO spcfctVO = new CmnsSpcfctVO();
			spcfctVO.setApcCd(cmnsItemVO.getApcCd());
			spcfctVO.setItemCd(cmnsItemVO.getItemCd());

			cmnsSpcfctService.deleteApcSpcfctAll(spcfctVO);

			CmnsVrtyVO vrtyVO = new CmnsVrtyVO();
			vrtyVO.setApcCd(cmnsItemVO.getApcCd());
			vrtyVO.setItemCd(cmnsItemVO.getItemCd());

			cmnsVrtyService.deleteApcVrtyAll(vrtyVO);

			deletedCnt = cmnsItemMapper.deleteCmnsItem(cmnsItemVO);
			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		}else {
			resultMap.put("errMsg", errMsg);
		}

		return resultMap;
	}

	@Override
	public List<CmnsItemVO> selectApcCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception {
		List<CmnsItemVO> resultList = cmnsItemMapper.selectApcCmnsItemList(cmnsItemVO);
		return resultList;
	}

}
