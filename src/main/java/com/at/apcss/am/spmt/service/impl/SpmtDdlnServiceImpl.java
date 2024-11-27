package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.ordr.service.OrdrService;
import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.mapper.SpmtCmndMapper;
import com.at.apcss.am.spmt.mapper.SpmtDdlnMapper;
import com.at.apcss.am.spmt.service.SpmtCmndService;
import com.at.apcss.am.spmt.service.SpmtDdlnService;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SpmtDdlnServiceImpl.java
 * @Description : 생산속보 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 박승진
 * @since 2024.11.20
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
@Service("spmtDdlnService")
public class SpmtDdlnServiceImpl extends BaseServiceImpl implements SpmtDdlnService {

	@Autowired
	private SpmtDdlnMapper spmtDdlnMapper;



	@Override
	public List<HashMap<String, Object>> selectDhtyJobList(HashMap<String, Object> spmtVO) throws Exception {

		List<HashMap<String, Object>> result = spmtDdlnMapper.selectDhtyJobList(spmtVO);

		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectMrktAnlsList(HashMap<String, Object> spmtVO) throws Exception {

		List<HashMap<String, Object>> result = spmtDdlnMapper.selectMrktAnlsList(spmtVO);

		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectJobCnList(HashMap<String, Object> spmtVO) throws Exception {

		List<HashMap<String, Object>> result = spmtDdlnMapper.selectJobCnList(spmtVO);

		return result;
	}

	@Override
	public int insertDhtyJobList(List<HashMap<String, Object>> spmtVO) throws Exception {
		for(HashMap<String,Object> item : spmtVO) {
			if(item.get("gubun").equals("update")) {
				spmtDdlnMapper.updateDhtyJobList(item);
			}else if (item.get("gubun").equals("insert")){
				spmtDdlnMapper.insertDhtyJobList(item);
			}

		}
		return 0;
	}

	@Override
	public int insertJobCnList(List<HashMap<String, Object>> spmtVO) throws Exception {
		for(HashMap<String,Object> item : spmtVO) {
			if(item.get("gubun").equals("update")) {
				spmtDdlnMapper.updateJobCnList(item);
			}else if (item.get("gubun").equals("insert")){
				spmtDdlnMapper.insertJobCnList(item);
			}

		}
		return 0;
	}

	@Override
	public int insertInvntrSttn1(List<HashMap<String, Object>> spmtVO) throws Exception {
		for(HashMap<String,Object> item : spmtVO) {
			if(item.get("gubun").equals("update")) {
				if(item.get("sortBx").equals("sort")) {
					spmtDdlnMapper.updateInvntrSort(item);
				}else {
					spmtDdlnMapper.updatePltBx(item);
				}
			}else if (item.get("gubun").equals("insert")){
				if(item.get("sortBx").equals("sort")) {
					spmtDdlnMapper.insertInvntrSort(item);
				}else {
					spmtDdlnMapper.insertPltBx(item);
				}
			}

		}
		return 0;
	}

	@Override
	public int insertMrktAnlsList(List<HashMap<String, Object>> spmtVO) throws Exception {
		for(HashMap<String,Object> item : spmtVO) {
			if(item.get("gubun").equals("update")) {
				spmtDdlnMapper.updateMrktAnlsList(item);
			}else if (item.get("gubun").equals("insert")){
				spmtDdlnMapper.insertMrktAnlsList(item);
			}
		}
	return 0;
	}

	@Override
	public List<HashMap<String, Object>> selectInvntrSttnOneList(HashMap<String, Object> spmtVO) throws Exception {
		List<HashMap<String, Object>> result = spmtDdlnMapper.selectInvntrSortList(spmtVO);
	    return result;
	}

	@Override
	public int insertInvntrSttn2(List<HashMap<String, Object>> spmtVO) throws Exception {
		for(HashMap<String,Object> item : spmtVO) {
			if(item.get("gubun").equals("update")) {
				if(item.get("seCd").equals("G")) {
					spmtDdlnMapper.updateInvntr2GdsList(item);
				}else if(item.get("seCd").equals("D")) {
					spmtDdlnMapper.updateInvntr2DiceList(item);
				}else if(item.get("seCd").equals("S")) {
					spmtDdlnMapper.updateInvntrSort(item);
				}

			}else if (item.get("gubun").equals("insert")){
				if(item.get("seCd").equals("G")) {
					spmtDdlnMapper.insertInvntr2GdsList(item);
				}else if(item.get("seCd").equals("D")) {
					spmtDdlnMapper.insertInvntr2DiceList(item);
				}else if(item.get("seCd").equals("S")) {
					spmtDdlnMapper.insertInvntrSort(item);
				}
			}
		}
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> selectInvntrSttnTwoList(HashMap<String, Object> spmtVO) throws Exception {
		List<HashMap<String, Object>> result = spmtDdlnMapper.selectInvntrTwoList(spmtVO);
	    return result;
	}




	@Override
	public int insertWrhsSttn(List<HashMap<String, Object>> spmtVO) throws Exception {
		for(HashMap<String,Object> item : spmtVO) {
			if(item.get("gubun").equals("update")) {
				spmtDdlnMapper.updateWrhsSttnList(item);
			}else if (item.get("gubun").equals("insert")){
				spmtDdlnMapper.insertWrhsSttnList(item);
			}
		}
		return 0;
	}

	@Override
	public List<HashMap<String, Object>> selectWrhsSttnList(HashMap<String, Object> spmtVO) throws Exception {
		List<HashMap<String, Object>> result = spmtDdlnMapper.selectWrhsSttnList(spmtVO);
		return result;
	}

	@Override
	public int deleteDhtyJobList(HashMap<String, Object> spmtVO) throws Exception {
		spmtDdlnMapper.deleteDhtyJobList(spmtVO);
		return 0;
	}

	@Override
	public int deleteJobCnList(HashMap<String, Object> spmtVO) throws Exception {
		spmtDdlnMapper.deleteJobCnList(spmtVO);
		return 0;
	}

	@Override
	public int deleteMrktAnlsList(HashMap<String, Object> spmtVO) throws Exception {
		spmtDdlnMapper.deleteMrktAnlsList(spmtVO);
		return 0;
	}

	@Override
	public int deleteInvntrOne(HashMap<String, Object> spmtVO) throws Exception {
		spmtDdlnMapper.deleteInvntrSort1(spmtVO);
		spmtDdlnMapper.deleteInvntrPltbx(spmtVO);
		return 0;
	}

	@Override
	public int deleteInvntrTwo(HashMap<String, Object> spmtVO) throws Exception {
		spmtDdlnMapper.deleteInvntrSort2(spmtVO);
		spmtDdlnMapper.deleteInvntrDice(spmtVO);
		spmtDdlnMapper.deleteInvntrGds(spmtVO);
		return 0;
	}

	@Override
	public int deleteWrhsSttnList(HashMap<String, Object> spmtVO) throws Exception {
		spmtDdlnMapper.deleteWrhsSttnList(spmtVO);
		return 0;
	}
}
