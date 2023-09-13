package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsSpcfctMapper;
import com.at.apcss.am.cmns.service.CmnsSpcfctService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.vo.CmnsSpcfctVO;
import com.at.apcss.co.constants.ComConstants;

/**
 * @Class Name : CmnsSpcfctServiceImpl.java
 * @Description : 규격정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cmnsSpcfctService")
public class CmnsSpcfctServiceImpl implements CmnsSpcfctService {

	@Autowired
	private CmnsSpcfctMapper cmnsSpcfctMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public CmnsSpcfctVO selectCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		CmnsSpcfctVO resultVO = cmnsSpcfctMapper.selectCmnsSpcfct(cmnsSpcfctVO);

		return resultVO;
	}

	@Override
	public List<CmnsSpcfctVO> selectCmnsSpcfctList(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		List<CmnsSpcfctVO> resultList = cmnsSpcfctMapper.selectCmnsSpcfctList(cmnsSpcfctVO);

		return resultList;
	}

	@Override
	public int insertCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int insertedCnt = cmnsSpcfctMapper.insertCmnsSpcfct(cmnsSpcfctVO);

		return insertedCnt;
	}

	@Override
	public int updateCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int updatedCnt = cmnsSpcfctMapper.updateCmnsSpcfct(cmnsSpcfctVO);

		return updatedCnt;
	}

	@Override
	public int deleteCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int deletedCnt = cmnsSpcfctMapper.deleteCmnsSpcfct(cmnsSpcfctVO);

		return deletedCnt;
	}

	@Override
	public CmnsSpcfctVO selectApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		CmnsSpcfctVO resultVO = cmnsSpcfctMapper.selectApcSpcfct(cmnsSpcfctVO);

		return resultVO;
	}

	@Override
	public List<CmnsSpcfctVO> selectApcSpcfctList(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		List<CmnsSpcfctVO> resultList = cmnsSpcfctMapper.selectApcSpcfctList(cmnsSpcfctVO);

		return resultList;
	}

	@Override
	public int insertApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int insertedCnt = cmnsSpcfctMapper.insertApcSpcfct(cmnsSpcfctVO);

		return insertedCnt;
	}

	@Override
	public int updateApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int updatedCnt = cmnsSpcfctMapper.updateApcSpcfct(cmnsSpcfctVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		String errMsg = cmnsValidationService.selectChkCdDelible(cmnsSpcfctVO.getApcCd(), "SPCFCT_CD", cmnsSpcfctVO.getSpcfctCd());
		int deletedCnt = 0;
		if(errMsg == null) {
			deletedCnt = cmnsSpcfctMapper.deleteApcSpcfct(cmnsSpcfctVO);
			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		}else {
			resultMap.put("errMsg", errMsg);
		}
		return resultMap;
	}

	@Override
	public int deleteApcSpcfctAll(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {
		return cmnsSpcfctMapper.deleteApcSpcfctAll(cmnsSpcfctVO);
	}

	@Override
	public int multiApcSpcfct(List<CmnsSpcfctVO> cmnsSpcfctList) throws Exception {
		int savedCnt = 0;
		for (CmnsSpcfctVO cmnsSpcfctVO : cmnsSpcfctList) {
			if(ComConstants.ROW_STS_INSERT.equals(cmnsSpcfctVO.getRowSts())) {
				savedCnt += insertApcSpcfct(cmnsSpcfctVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(cmnsSpcfctVO.getRowSts())) {
				savedCnt += updateApcSpcfct(cmnsSpcfctVO);
			}
		}

		return savedCnt;
	}

}
