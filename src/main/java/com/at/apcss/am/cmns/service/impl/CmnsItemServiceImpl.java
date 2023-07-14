package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsItemMapper;
import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.vo.CmnsItemVO;

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
	public int deleteCmnsItem(CmnsItemVO cmnsItemVO) throws Exception {

		int deletedCnt = cmnsItemMapper.deleteCmnsItem(cmnsItemVO);

		return deletedCnt;
	}

	@Override
	public List<CmnsItemVO> selectApcCmnsItemList(CmnsItemVO cmnsItemVO) throws Exception {
		List<CmnsItemVO> resultList = cmnsItemMapper.selectApcCmnsItemList(cmnsItemVO);
		return resultList;
	}

}
