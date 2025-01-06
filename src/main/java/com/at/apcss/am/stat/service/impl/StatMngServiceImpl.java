package com.at.apcss.am.stat.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.stat.vo.StatMngVO;
import com.at.apcss.am.stat.mapper.StatMngMapper;
import com.at.apcss.am.stat.service.StatMngService;
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
@Service("statMngService")
public class StatMngServiceImpl extends BaseServiceImpl implements StatMngService {

	@Autowired
	private StatMngMapper statMngMapper;

	@Override
	public List<StatMngVO> selectStatCrtrInfoList(StatMngVO StatMngVO) throws Exception {
		List<StatMngVO> result = statMngMapper.selectStatMngInfoList(StatMngVO);
		return result;
	}

	@Override
	public List<StatMngVO> selectStatCrtrInfoDtlList(StatMngVO StatMngVO) throws Exception {
		List<StatMngVO> result = statMngMapper.selectStatMngInfoDtlList(StatMngVO);
		return result;
	}

	@Override
	public int insertStatCrtrInfo(StatMngVO statMngVO) throws Exception {

		String status = statMngVO.getGubun();
		int result = 0;
		if(status.equals("insert")) {
			result = statMngMapper.insertStatMngInfo(statMngVO);
		}else if(status.equals("update")) {
			result = statMngMapper.updateStatMngInfo(statMngVO);
		}
		return result;
	}

	@Override
	public int insertStatCrtrDtlInfo(List<StatMngVO> statMngVOList) throws Exception {
		int result = 0;
		statMngVOList.forEach(item->{
		String status = item.getGubun();
			if(status.equals("insert")) {
				statMngMapper.insertStatMngDtlInfo(item);
			}else if(status.equals("update")) {
				statMngMapper.updateStatMngDtlInfo(item);
			}
		});
		return result;
	}

	@Override
	public int deleteStatCrtrInfo(StatMngVO statMngVO) throws Exception {
		int result = 0;
		result = statMngMapper.deleteStatMngInfo(statMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdWrhsStatInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = statMngMapper.selectPrdWrhsStatInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdInptPrfmncStatInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = statMngMapper.selectPrdInptPrfmncStatInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdPrdctnPrfmncStatInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = statMngMapper.selectPrdPrdctnPrfmncStatInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdSpmtPrfmncStatInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = statMngMapper.selectPrdSpmtPrfmncStatInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdInptInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = statMngMapper.selectPrdInptInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdWrhsInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = statMngMapper.selectPrdWrhsInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdSpmtInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = statMngMapper.selectPrdSpmtInfo(totMngVO);
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectPrdPrdctnInfo(HashMap<String, Object> totMngVO) throws Exception {
		List<HashMap<String,Object>> result = statMngMapper.selectPrdPrdctnInfo(totMngVO);
		return result;
	}


}
