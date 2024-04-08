package com.at.apcss.co.cd.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.mapper.ComCdMapper;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

@Service("comCdService")
public class ComCdServiceImpl extends BaseServiceImpl implements ComCdService {

	@Autowired
	private ComCdMapper comCdMapper;

	@Override
	public ComCdVO selectComCd(ComCdVO comCdVO) throws Exception {

		return comCdMapper.selectComCd(comCdVO);
	}

	@Override
	public List<ComCdVO> selectComCdList(ComCdVO comCdVO) throws Exception {

		List<ComCdVO> resultList = new ArrayList<>();
		resultList = comCdMapper.selectComCdList(comCdVO);
		return resultList;
	}

	@Override
	public List<ComCdVO> selectComCdDtlList(ComCdVO comCdVO) throws Exception {

		List<ComCdVO> resultList = new ArrayList<>();
		resultList = comCdMapper.selectComCdDtlList(comCdVO);
		return resultList;
	}

	@Override
	public List<ComCdVO> selectApcRptList(ComCdVO comCdVO) throws Exception {
		List<ComCdVO> resultList = new ArrayList<>();
		resultList = comCdMapper.selectApcRptList(comCdVO);
		return resultList;
	}
	
	
	@Override
	public int insertComCd(ComCdVO comCdVO) throws Exception {
		return comCdMapper.insertComCd(comCdVO);
	}

	@Override
	public int updateComCd(ComCdVO comCdVO) throws Exception {
		return comCdMapper.updateComCd(comCdVO);
	}

	@Override
	public int deleteComCd(ComCdVO comCdVO) throws Exception {
		return comCdMapper.deleteComCd(comCdVO);
	}

	@Override
	public int insertComCdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.insertComCdDtl(comCdVO);
	}

	@Override
	public int updateComCdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.updateComCdDtl(comCdVO);
	}

	@Override
	public int deleteComCdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.deleteComCdDtl(comCdVO);
	}

	@Override
	public HashMap<String, Object> deleteApcComCdDtl(ComCdVO comCdVO) throws Exception {

		String errMsg = apcCdComCdDtlDelible(comCdVO);

		if(errMsg == null) {
			if(0 == deleteComCdDtl(comCdVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}else {
			return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errMsg); // E0000	{0}
		}

		return null;

	}

	@Override
	public List<ComCdVO> selectComBoCdDtlList(ComCdVO comCdVO) throws Exception {
		List<ComCdVO> resultList = new ArrayList<>();
		resultList = comCdMapper.selectComBoCdDtlList(comCdVO);
		return resultList;
	}

	@Override
	public ComCdVO selectComCdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.selectComCdDtl(comCdVO);
	}

	@Override
	public int duplicateCheckCdId(ComCdVO comCdVO) throws Exception {
		return comCdMapper.duplicateCheckCdId(comCdVO);
	}

	@Override
	public int duplicateCheckCdIdDtl(ComCdVO comCdVO) throws Exception {
		return comCdMapper.duplicateCheckCdIdDtl(comCdVO);
	}

	@Override
	public int updateComCdDtlDelYn(ComCdVO comCdVO) throws Exception {
		return comCdMapper.updateComCdDtlDelYn(comCdVO);
	}

	@Override
	public int comCdDtlDelYnAll(ComCdVO comCdVO) throws Exception {
		return comCdMapper.comCdDtlDelYnAll(comCdVO);
	}

	@Override
	public List<ComCdVO> selectFcltList(ComCdVO comCdVO) throws Exception {

		List<ComCdVO> resultList = comCdMapper.selectFcltList(comCdVO);

		return resultList;
	}

	@Override
	public int multiSaveComCdList(List<ComCdVO> comCdList) throws Exception {
		int savedCnt = 0;
		for (ComCdVO comCdVO : comCdList) {
			if(ComConstants.ROW_STS_INSERT.equals(comCdVO.getRowSts())) {
				savedCnt += insertComCd(comCdVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(comCdVO.getRowSts())) {
				savedCnt += updateComCd(comCdVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int multiSaveComCdDtlList(List<ComCdVO> comCdList) throws Exception {
		int savedCnt = 0;
		for (ComCdVO comCdVO : comCdList) {
			if(ComConstants.ROW_STS_INSERT.equals(comCdVO.getRowSts())) {
				savedCnt += insertComCdDtl(comCdVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(comCdVO.getRowSts())) {
				savedCnt += updateComCdDtl(comCdVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int multiSaveComCdComCdDtlList(ComCdVO comCdVO) throws Exception {
		int savedCnt = 0;

		if (comCdVO.getComCdList().size() > 0) {
			savedCnt += multiSaveComCdList(comCdVO.getComCdList());
		}
		if (comCdVO.getComCdDtlList().size() > 0) {
			savedCnt += multiSaveComCdDtlList(comCdVO.getComCdDtlList());
		}

		return savedCnt;
	}

	@Override
	public int deleteComCdComCdDtlList(ComCdVO comCdVO) throws Exception {
		int deletedCnt = 0;

		List<ComCdVO> deleteCdList = comCdVO.getComCdList();
		List<ComCdVO> deleteCdDtlList = comCdVO.getComCdDtlList();
		List<ComCdVO> resultList = new ArrayList<>();

		if (deleteCdList.size() > 0) {
			for (ComCdVO comCd : deleteCdList) {
				resultList = selectComCdDtlList(comCd);
				deletedCnt += deleteComCd(comCd);
				if (resultList.size() > 0) {
					for (ComCdVO result : resultList) {
						deletedCnt += deleteComCdDtl(result);
					}
				}
			}
		}
		if (deleteCdDtlList.size() > 0) {
			for (ComCdVO comCdDtl : deleteCdDtlList) {
				deletedCnt += deleteComCdDtl(comCdDtl);
			}
		}

		return deletedCnt;
	}

	@Override
	public String apcCdComCdDtlDelible(ComCdVO comCdVO) throws Exception {

		String cdId = comCdVO.getCdId();

		List<ComCdVO> resultList = comCdMapper.apcCdComCdDtlDelible(comCdVO);

		if(resultList.size() > 0) {
			String delible = "";
			if ("WAREHOUSE_SE_CD".equals(cdId)) {
				delible = "해당 창고는 ";
			}else if ("PCKG_FCLT_CD".equals(cdId)) {
				delible = "해당 포장기는 ";
			}else if ("SORT_FCLT_CD".equals(cdId)) {
				delible = "해당 선별기는 ";
			}

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
	public int updateComApcStdInq(ComCdVO comCdVO) throws Exception {
		int update_count = 0;

		update_count += comCdMapper.updateComApcStdInq(comCdVO);			
		return update_count;
	}

	@Override
	public HashMap<String, Object> updateComWarehouseList(List<ComCdVO> comCdList) throws Exception {

		for (ComCdVO comCd : comCdList) {
			updateComApcStdInq(comCd);
		}
		return null;
	}

	@Override
	public HashMap<String, Object> updateComSortFcltList(List<ComCdVO> comCdList) throws Exception {
		
		for (ComCdVO comCd : comCdList) {
			updateComApcStdInq(comCd);
		}
		return null;
	}
	@Override
	public HashMap<String, Object> updateComPckgFcltList(List<ComCdVO> comCdList) throws Exception {
		
		for (ComCdVO comCd : comCdList) {
			updateComApcStdInq(comCd);
		}
		return null;
	}



}
