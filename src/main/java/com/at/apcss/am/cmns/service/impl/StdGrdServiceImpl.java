package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.StdGrdMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.StdGrdService;
import com.at.apcss.am.cmns.vo.StdGrdDtlVO;
import com.at.apcss.am.cmns.vo.StdGrdJgmtVO;
import com.at.apcss.am.cmns.vo.StdGrdListVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;
import com.at.apcss.co.constants.ComConstants;

/**
 * @Class Name : StdGrdServiceImpl.java
 * @Description : 등급정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("stdGrdService")
public class StdGrdServiceImpl implements StdGrdService {

	@Autowired
	private StdGrdMapper stdGrdMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public StdGrdVO selectStdGrd(StdGrdVO StdGrdVO) throws Exception {
		StdGrdVO resultVO = stdGrdMapper.selectStdGrd(StdGrdVO);
		return resultVO;
	}

	@Override
	public List<StdGrdVO> selectStdGrdList(StdGrdVO stdGrdVO) throws Exception {
		List<StdGrdVO> resultList = stdGrdMapper.selectStdGrdList(stdGrdVO);
		return resultList;
	}

	@Override
	public int insertStdGrd(StdGrdVO stdGrdVO) throws Exception {
		int insertedCnt = stdGrdMapper.insertStdGrd(stdGrdVO);
		return insertedCnt;
	}

	@Override
	public int updateStdGrd(StdGrdVO stdGrdVO) throws Exception {
		int updatedCnt = stdGrdMapper.updateStdGrd(stdGrdVO);
		return updatedCnt;
	}

	@Override
	public int multiStdGrdList(List<StdGrdListVO> stdGrdLists) throws Exception {
		int savedCnt = 0;

		List<StdGrdVO> stdGrdList = stdGrdLists.get(0).getStdGrdList();
		List<StdGrdDtlVO> stdGrdDtlList = stdGrdLists.get(0).getStdGrdDtlList();
		List<StdGrdJgmtVO> stdGrdJgmtList = stdGrdLists.get(0).getStdGrdJgmtList();

		String sysFrstInptPrgrmId = stdGrdLists.get(0).getSysFrstInptPrgrmId();
		String sysFrstInptUserId = stdGrdLists.get(0).getSysFrstInptUserId();
		String sysLastChgPrgrmId = stdGrdLists.get(0).getSysLastChgPrgrmId();
		String sysLastChgUserId = stdGrdLists.get(0).getSysLastChgUserId();

		for (StdGrdVO stdGrdVO : stdGrdList) {

			stdGrdVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);;
			stdGrdVO.setSysFrstInptUserId(sysFrstInptUserId);
			stdGrdVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
			stdGrdVO.setSysLastChgUserId(sysLastChgUserId);

			if(ComConstants.ROW_STS_INSERT.equals(stdGrdVO.getRowSts())) {
				savedCnt += insertStdGrd(stdGrdVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(stdGrdVO.getRowSts())) {
				savedCnt += updateStdGrd(stdGrdVO);
			}
		}

		for (StdGrdDtlVO stdGrdDtlVO : stdGrdDtlList) {

			stdGrdDtlVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);;
			stdGrdDtlVO.setSysFrstInptUserId(sysFrstInptUserId);
			stdGrdDtlVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
			stdGrdDtlVO.setSysLastChgUserId(sysLastChgUserId);

			if(ComConstants.ROW_STS_INSERT.equals(stdGrdDtlVO.getRowSts())) {
				savedCnt += insertStdGrdDtl(stdGrdDtlVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(stdGrdDtlVO.getRowSts())) {
				savedCnt += updateStdGrdDtl(stdGrdDtlVO);
			}
		}


		for (StdGrdJgmtVO stdGrdJgmtVO : stdGrdJgmtList) {

			stdGrdJgmtVO.setSysFrstInptPrgrmId(sysFrstInptPrgrmId);
			stdGrdJgmtVO.setSysFrstInptUserId(sysFrstInptUserId);
			stdGrdJgmtVO.setSysLastChgPrgrmId(sysLastChgPrgrmId);
			stdGrdJgmtVO.setSysLastChgUserId(sysLastChgUserId);

			if(ComConstants.ROW_STS_INSERT.equals(stdGrdJgmtVO.getRowSts())) {
				savedCnt += insertStdGrdJgmt(stdGrdJgmtVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(stdGrdJgmtVO.getRowSts())) {
				savedCnt += updateStdGrdJgmt(stdGrdJgmtVO);
			}
		}

		return savedCnt;
	}

	@Override
	public HashMap<String, Object> deleteStdGrd(StdGrdVO stdGrdVO) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		StdGrdDtlVO stdGrdDtlVO = new StdGrdDtlVO();
		stdGrdDtlVO.setApcCd(stdGrdVO.getApcCd());
		stdGrdDtlVO.setItemCd(stdGrdVO.getItemCd());
		stdGrdDtlVO.setGrdSeCd(stdGrdVO.getGrdSeCd());
		stdGrdDtlVO.setGrdKnd(stdGrdVO.getGrdKnd());
		int deletedCnt = 0;
		List<StdGrdDtlVO> stdGrdDtlList = selectStdGrdDtlList(stdGrdDtlVO);

		for (StdGrdDtlVO stdGrdDtl : stdGrdDtlList) {

			resultMap = deleteStdGrdDtl(stdGrdDtl);
			String errMsgGrdDtl = (String) resultMap.get("errMsg");
			if(errMsgGrdDtl !=null ) {
				return resultMap;
			}
		}

		String errMsg = cmnsValidationService.selectChkCdDelible(stdGrdVO.getApcCd(), "GRD_KND", stdGrdVO.getGrdKnd());

		if(errMsg == null ) {
			stdGrdMapper.deleteStdGrdAll(stdGrdVO);
			deletedCnt =+ stdGrdMapper.deleteStdGrd(stdGrdVO);
			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		}else {
			resultMap.put("errMsg", errMsg);
		}
		return resultMap;
	}

	@Override
	public int deleteStdGrdAll(StdGrdVO stdGrdVO) throws Exception {
		int deletedCnt = stdGrdMapper.deleteStdGrdAll(stdGrdVO);

		return deletedCnt;
	}

	@Override
	public StdGrdDtlVO selectStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		StdGrdDtlVO resultVO = stdGrdMapper.selectStdGrdDtl(stdGrdDtlVO);
		return resultVO;
	}

	@Override
	public List<StdGrdDtlVO> selectStdGrdDtlList(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		List<StdGrdDtlVO> resultList = stdGrdMapper.selectStdGrdDtlList(stdGrdDtlVO);
		return resultList;
	}

	@Override
	public int insertStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		int insertedCnt = stdGrdMapper.insertStdGrdDtl(stdGrdDtlVO);
		return insertedCnt;
	}

	@Override
	public int updateStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		int updatedCnt = stdGrdMapper.updateStdGrdDtl(stdGrdDtlVO);
		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteStdGrdDtl(StdGrdDtlVO stdGrdDtlVO) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		String errMsg = cmnsValidationService.selectChkCdDelible(stdGrdDtlVO.getApcCd(), "GRD_CD", stdGrdDtlVO.getGrdCd());
		int deletedCnt = 0;
		if(errMsg == null ) {
			deletedCnt = stdGrdMapper.deleteStdGrd(stdGrdDtlVO);
			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		}else {
			resultMap.put("errMsg", errMsg);
		}
		return resultMap;

	}

	@Override
	public int deleteStdGrdDtlAll(StdGrdDtlVO stdGrdDtlVO) throws Exception {
		int deletedCnt = stdGrdMapper.deleteStdGrdDtlAll(stdGrdDtlVO);
		return deletedCnt;
	}

	@Override
	public StdGrdJgmtVO selectStdGrdJgmt(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {
		StdGrdJgmtVO resultVO = stdGrdMapper.selectStdGrdJgmt(StdGrdJgmtVO);

		return resultVO;
	}

	@Override
	public List<StdGrdJgmtVO> selectStdGrdJgmtList(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {
		List<StdGrdJgmtVO> resultList = stdGrdMapper.selectStdGrdJgmtList(StdGrdJgmtVO);

		return resultList;
	}

	@Override
	public int insertStdGrdJgmt(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {

		int insertedCnt = stdGrdMapper.insertStdGrdJgmt(StdGrdJgmtVO);

		return insertedCnt;
	}

	@Override
	public int updateStdGrdJgmt(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {

		int updatedCnt = stdGrdMapper.updateStdGrdJgmt(StdGrdJgmtVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteStdGrdJgmt(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		String errMsg = cmnsValidationService.selectChkCdDelible(StdGrdJgmtVO.getApcCd(), "JGMT_GRD_CD", StdGrdJgmtVO.getGrdCd());
		int deletedCnt = 0;
		if(errMsg == null ) {
			deletedCnt = stdGrdMapper.deleteStdGrdJgmt(StdGrdJgmtVO);
			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		}else {
			resultMap.put("errMsg", errMsg);
		}
		return resultMap;
	}

	@Override
	public int deleteStdGrdJgmtAll(StdGrdJgmtVO StdGrdJgmtVO) throws Exception {
		int deletedCnt = stdGrdMapper.deleteStdGrdJgmtAll(StdGrdJgmtVO);
		return deletedCnt;
	}

}
