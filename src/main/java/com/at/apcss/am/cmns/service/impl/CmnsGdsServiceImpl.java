package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.mapper.CmnsGdsMapper;
import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : CmnsGdsServiceImpl.java
 * @Description : 상품정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cmnsGdsService")
public class CmnsGdsServiceImpl implements CmnsGdsService {

	@Autowired
	private CmnsGdsMapper cmnsGdsMapper;

	@Override
	public CmnsGdsVO selectCmnsGds(CmnsGdsVO cmnsGdsVO) throws Exception {

		CmnsGdsVO resultVO = cmnsGdsMapper.selectCmnsGds(cmnsGdsVO);

		return resultVO;
	}

	@Override
	public List<CmnsGdsVO> selectCmnsGdsList(CmnsGdsVO cmnsGdsVO) throws Exception {

		List<CmnsGdsVO> resultList = cmnsGdsMapper.selectCmnsGdsList(cmnsGdsVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertCheckGdsCd(CmnsGdsVO cmnsGdsVO) throws Exception {

		if (StringUtils.hasText(cmnsGdsVO.getGdsCd())) {
			return null;
		}

		cmnsGdsMapper.insertSpGdsCdReg(cmnsGdsVO);
		if (StringUtils.hasText(cmnsGdsVO.getRtnCd())) {
			return ComUtil.getResultMap(cmnsGdsVO.getRtnCd(), cmnsGdsVO.getRtnMsg());
		}

		return null;
	}

	@Override
	public int insertCmnsGds(CmnsGdsVO cmnsGdsVO) throws Exception {

		int insertedCnt = cmnsGdsMapper.insertCmnsGds(cmnsGdsVO);

		return insertedCnt;
	}

	@Override
	public int updateCmnsGds(CmnsGdsVO cmnsGdsVO) throws Exception {

		int updatedCnt = cmnsGdsMapper.insertCmnsGds(cmnsGdsVO);

		return updatedCnt;
	}

	@Override
	public int deleteCmnsGds(CmnsGdsVO cmnsGdsVO) throws Exception {

		int deletedCnt = cmnsGdsMapper.deleteCmnsGds(cmnsGdsVO);

		return deletedCnt;
	}

}
