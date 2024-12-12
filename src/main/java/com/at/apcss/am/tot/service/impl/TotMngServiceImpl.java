package com.at.apcss.am.tot.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.at.apcss.am.tot.vo.TotMngVO;
import com.at.apcss.am.tot.mapper.TotMngMapper;
import com.at.apcss.am.tot.service.TotMngService;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : SortFcltServiceImpl.java
 * @Description : 선별설비정보 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @param <totMngVO>
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.03  박승진        최초 생성
 * </pre>
 */
@Service("totMngService")
public class TotMngServiceImpl extends BaseServiceImpl implements TotMngService {

	@Autowired
	private TotMngMapper totMngMapper;

	@Override
	public List<TotMngVO> selectTotCrtrInfoList(TotMngVO totMngVO) throws Exception {
		// TODO Auto-generated method stub
		List<TotMngVO> result = totMngMapper.selectTotMngInfoList(totMngVO);
		return result;
	}

	@Override
	public List<TotMngVO> selectTotCrtrInfoDtlList(TotMngVO totMngVO) throws Exception {
		List<TotMngVO> result = totMngMapper.selectTotMngInfoDtlList(totMngVO);
		return result;
	}

	@Override
	public int insertTotCrtrInfo(TotMngVO totMngVO) throws Exception {
		// TODO Auto-generated method stub
		String status = totMngVO.getGubun();
		int result = 0;
		if(status.equals("insert")) {
			result = totMngMapper.insertTotMngInfo(totMngVO);
		}else if(status.equals("update")) {
			result = totMngMapper.updateTotMngInfo(totMngVO);
		}
		return result;

	}

	@Override
	public int insertTotCrtrDtlInfo(List<TotMngVO> TotMngVOList) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		TotMngVOList.forEach(item->{
		String status = item.getGubun();
			if(status.equals("insert")) {
				totMngMapper.insertTotMngDtlInfo(item);
			}else if(status.equals("update")) {
				totMngMapper.updateTotMngDtlInfo(item);
			}
		});
		return result;
	}

	@Override
	public int deleteTotCrtrInfo(TotMngVO totMngVO) throws Exception {

		int result = totMngMapper.deleteTotMngInfo(totMngVO);
		result = totMngMapper.deleteTotMngDtlInfo(totMngVO);

		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectSpmtPrfmncTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectSpmtPrfmncTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectGdsInvntrTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectGdsInvntrTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPckgPrfmncTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectPckgPrfmncTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectRawMtrInvntrTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectRawMtrInvntrTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectRawMtrWrhsTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectRawMtrWrhsTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectSortInvntrTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectSortInvntrTotInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectSortPrfmncTotInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = totMngMapper.selectSortPrfmncTotInfo(totMngVO);
		return result;
	}




}
