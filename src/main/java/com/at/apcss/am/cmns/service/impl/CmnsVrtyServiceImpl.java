package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsVrtyMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.co.constants.ComConstants;

/**
 * @Class Name : CmnsVrtyServiceImpl.java
 * @Description : 품종정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cmnsVrtyService")
public class CmnsVrtyServiceImpl implements CmnsVrtyService {

	@Autowired
	private CmnsVrtyMapper cmnsVrtyMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public CmnsVrtyVO selectCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		CmnsVrtyVO resultVO = cmnsVrtyMapper.selectCmnsVrty(cmnsVrtyVO);

		return resultVO;
	}

	@Override
	public List<CmnsVrtyVO> selectCmnsVrtyList(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		List<CmnsVrtyVO> resultList = cmnsVrtyMapper.selectCmnsVrtyList(cmnsVrtyVO);

		return resultList;
	}

	@Override
	public int insertCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int insertedCnt = cmnsVrtyMapper.insertCmnsVrty(cmnsVrtyVO);

		return insertedCnt;
	}

	@Override
	public int updateCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int updatedCnt = cmnsVrtyMapper.updateCmnsVrty(cmnsVrtyVO);

		return updatedCnt;
	}

	@Override
	public int deleteCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int deletedCnt = cmnsVrtyMapper.deleteCmnsVrty(cmnsVrtyVO);

		return deletedCnt;
	}

	@Override
	public CmnsVrtyVO selectApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		CmnsVrtyVO resultVO = cmnsVrtyMapper.selectApcVrty(cmnsVrtyVO);

		return resultVO;
	}

	@Override
	public List<CmnsVrtyVO> selectApcVrtyList(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		List<CmnsVrtyVO> resultList = cmnsVrtyMapper.selectApcVrtyList(cmnsVrtyVO);

		return resultList;
	}

	@Override
	public int insertApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int insertedCnt = cmnsVrtyMapper.insertApcVrty(cmnsVrtyVO);

		return insertedCnt;
	}

	@Override
	public int updateApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int updatedCnt = cmnsVrtyMapper.updateApcVrty(cmnsVrtyVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		String errMsg = cmnsValidationService.selectChkCdDelible(cmnsVrtyVO.getApcCd(), "VRTY_CD", cmnsVrtyVO.getItemCd());
		int deletedCnt = 0;

		if(errMsg == null ) {
			deletedCnt = cmnsVrtyMapper.deleteApcVrty(cmnsVrtyVO);
			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		}else {
			resultMap.put("errMsg", errMsg);
		}
		return resultMap;
	}

	@Override
	public int deleteApcVrtyAll(CmnsVrtyVO cmnsVrtyVO) throws Exception {
		int deletedCnt = cmnsVrtyMapper.deleteApcVrtyAll(cmnsVrtyVO);
		return deletedCnt;
	}

}
