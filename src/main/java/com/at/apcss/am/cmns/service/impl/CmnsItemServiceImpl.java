package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.at.apcss.am.sort.vo.SortBffaGrdVO;
import com.at.apcss.am.sort.vo.SortBffaWrhsStdGrdVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsItemMapper;
import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.service.CmnsSpcfctService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.service.StdGrdService;
import com.at.apcss.am.cmns.vo.CmnsItemVO;
import com.at.apcss.am.cmns.vo.CmnsSpcfctVO;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.am.cmns.vo.StdGrdJgmtVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

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
public class CmnsItemServiceImpl extends BaseServiceImpl implements CmnsItemService {

	@Autowired
	private CmnsItemMapper cmnsItemMapper;

	@Resource(name = "cmnsVrtyService")
	private CmnsVrtyService cmnsVrtyService;

	@Resource(name = "cmnsSpcfctService")
	private CmnsSpcfctService cmnsSpcfctService;

	@Resource(name = "stdGrdService")
	private StdGrdService stdGrdService;

	@Resource(name= "spmtPckgUnitService")
	private SpmtPckgUnitService spmtPckgUnitService;

	@Resource(name ="comCdService")
	private ComCdService comCdService;

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
	public HashMap<String, Object> insertCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {

		if(0 == cmnsItemMapper.insertCmnsItem(cmnsItemVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		StdGrdVO stdGrdVO = new StdGrdVO();
		BeanUtils.copyProperties(cmnsItemVO, stdGrdVO);

		HashMap<String, Object> rtnObj = stdGrdService.insertStdGrdAuto(stdGrdVO);
		if(rtnObj != null) {
			return rtnObj;
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {

		if(0 == cmnsItemMapper.updateCmnsItem(cmnsItemVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {

		String errMsg = itemDelible(cmnsItemVO);

		if(errMsg == null) {

			StdGrdVO stdGrdVO = new StdGrdVO();
			StdGrdJgmtVO stdGrdJgmtVO = new StdGrdJgmtVO();
			CmnsSpcfctVO spcfctVO = new CmnsSpcfctVO();
			CmnsVrtyVO vrtyVO = new CmnsVrtyVO();
			SpmtPckgUnitVO spmtPckgUnitVO = new SpmtPckgUnitVO();
			BeanUtils.copyProperties(cmnsItemVO, stdGrdVO);
			BeanUtils.copyProperties(cmnsItemVO, stdGrdJgmtVO);
			BeanUtils.copyProperties(cmnsItemVO, spcfctVO);
			BeanUtils.copyProperties(cmnsItemVO, vrtyVO);
			BeanUtils.copyProperties(cmnsItemVO, spmtPckgUnitVO);

			List<StdGrdVO> stdGrdList = stdGrdService.selectStdGrdList(stdGrdVO);

			for (StdGrdVO stdGrd : stdGrdList) {

				HashMap<String, Object> rtnObj = stdGrdService.deleteStdGrd(stdGrd);
				if(rtnObj != null) {
					return rtnObj;
				}
			}

			List<StdGrdJgmtVO> stdGrdJgmtList = stdGrdService.selectStdGrdJgmtList(stdGrdJgmtVO);

			for (StdGrdJgmtVO stdGrdJgmt : stdGrdJgmtList) {
				HashMap<String, Object> rtnObj = stdGrdService.deleteStdGrdJgmt(stdGrdJgmt);
				if(rtnObj != null) {
					return rtnObj;
				}
			}

			List<CmnsSpcfctVO> spcfctList = cmnsSpcfctService.selectApcSpcfctList(spcfctVO);

			for (CmnsSpcfctVO cmnsSpcfctVO : spcfctList) {

				HashMap<String, Object> rtnObj = cmnsSpcfctService.deleteApcSpcfct(cmnsSpcfctVO);
				if(rtnObj != null) {
					return rtnObj;
				}
			}

			List<CmnsVrtyVO> vrtyList = cmnsVrtyService.selectApcVrtyList(vrtyVO);

			for (CmnsVrtyVO cmnsVrtyVO : vrtyList) {

				HashMap<String, Object> rtnObj = cmnsVrtyService.deleteApcVrty(cmnsVrtyVO);
				if(rtnObj != null) {
					return rtnObj;
				}
			}

			List<SpmtPckgUnitVO> spmtPckgUnitList = spmtPckgUnitService.selectSpmtPckgUnitList(spmtPckgUnitVO);

			for (SpmtPckgUnitVO spmtPckgUnit : spmtPckgUnitList) {

				HashMap<String, Object> rtnObj = spmtPckgUnitService.deleteSpmtPckgUnit(spmtPckgUnit);
				if(rtnObj != null) {
					return rtnObj;
				}
			}

			if(0 == cmnsItemMapper.deleteCmnsItem(cmnsItemVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
			}

		}else {
			return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errMsg); // E0000	{0}
		}

		return null;
	}

	@Override
	public List<CmnsItemVO> selectApcCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception {
		List<CmnsItemVO> resultList = cmnsItemMapper.selectApcCmnsItemList(cmnsItemVO);
		return resultList;
	}

	@Override
	public CmnsItemVO selectCmnsApcItem(CmnsItemVO cmnsItemVO) throws Exception {
		CmnsItemVO resultVO = cmnsItemMapper.selectCmnsApcItem(cmnsItemVO);
		return resultVO;
	}

	@Override
	public int updateApcCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {
		int updatedCnt = cmnsItemMapper.updateApcCmnsItem(cmnsItemVO);

		return updatedCnt;
	}

	@Override
	public String itemDelible(CmnsItemVO cmnsItemVO) throws Exception {
		List<CmnsItemVO> resultList = cmnsItemMapper.itemDelible(cmnsItemVO);

		if(resultList.size() > 0) {
			String delible = "해당 품목은 ";
			for (int i = 0; i < resultList.size(); i++) {
				if(i == 0) {
					delible += resultList.get(i).getDelible();
				}else {
					delible += ", "+resultList.get(i).getDelible();
				}
			}
			delible += "이/가 존재 합니다.";

			return delible;
		}

		return null;
	}
	
	@Override
	public int updateItem(CmnsItemVO cmnsItemVO) throws Exception {
		int updateCnt = 0;
		updateCnt = cmnsItemMapper.updateComItem(cmnsItemVO);
		return updateCnt;
	}
	@Override
	public HashMap<String, Object> updateItemList(List<CmnsItemVO> cmnsItemList) throws Exception {
		
		for (CmnsItemVO cmnsItemVO : cmnsItemList) {
			updateItem(cmnsItemVO);
		}
		return null;
	}

	@Override
	public List<ComCdVO> selectApcBffaTypeList(CmnsItemVO cmnsItemVO) throws Exception {
		return cmnsItemMapper.selectApcBffaTypeList(cmnsItemVO);
	}

	@Override
	public List<SortBffaGrdVO> selectApcBffaGrdDtlList(SortBffaGrdVO sortBffaGrdVO) throws Exception {
		return cmnsItemMapper.selectApcBffaGrdDtlList(sortBffaGrdVO);
	}

	@Override
	public List<SortBffaWrhsStdGrdVO> selectBffaGrdKndList(SortBffaWrhsStdGrdVO sortBffaWrhsStdGrdVO) throws Exception {
		return cmnsItemMapper.selectBffaGrdKndList(sortBffaWrhsStdGrdVO);
	}


}
