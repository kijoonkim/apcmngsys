package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsGrdMapper;
import com.at.apcss.am.cmns.service.CmnsGrdService;
import com.at.apcss.am.cmns.vo.CmnsGrdVO;

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
@Service("cmnsGrdService")
public class CmnsGrdServiceImpl implements CmnsGrdService {
	
	@Autowired
	private CmnsGrdMapper cmnsGrdMapper;
	
	@Override
	public CmnsGrdVO selectCmnsGrd(CmnsGrdVO cmnsGrdVO) throws Exception {
		
		CmnsGrdVO resultVO = cmnsGrdMapper.selectCmnsGrd(cmnsGrdVO);
		
		return resultVO;
	}

	@Override
	public List<CmnsGrdVO> selectCmnsGrdList(CmnsGrdVO cmnsGrdVO) throws Exception {

		List<CmnsGrdVO> resultList = cmnsGrdMapper.selectCmnsGrdList(cmnsGrdVO);
		
		return resultList;
	}

	@Override
	public int insertCmnsGrd(CmnsGrdVO cmnsGrdVO) throws Exception {

		int insertedCnt = cmnsGrdMapper.insertCmnsGrd(cmnsGrdVO);
		
		return insertedCnt;
	}

	@Override
	public int updateCmnsGrd(CmnsGrdVO cmnsGrdVO) throws Exception {

		int updatedCnt = cmnsGrdMapper.updateCmnsGrd(cmnsGrdVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteCmnsGrd(CmnsGrdVO cmnsGrdVO) throws Exception {

		int deletedCnt = cmnsGrdMapper.deleteCmnsGrd(cmnsGrdVO);
		
		return deletedCnt;
	}

	@Override
	public CmnsGrdVO selectApcGrd(CmnsGrdVO cmnsGrdVO) throws Exception {
		
		CmnsGrdVO resultVO = cmnsGrdMapper.selectApcGrd(cmnsGrdVO);
		
		return resultVO;
	}

	@Override
	public List<CmnsGrdVO> selectApcGrdList(CmnsGrdVO cmnsGrdVO) throws Exception {

		List<CmnsGrdVO> resultList = cmnsGrdMapper.selectApcGrdList(cmnsGrdVO);
		
		return resultList;
	}

	@Override
	public int insertApcGrd(CmnsGrdVO cmnsGrdVO) throws Exception {

		int insertedCnt = cmnsGrdMapper.insertApcGrd(cmnsGrdVO);
		
		return insertedCnt;
	}

	@Override
	public int updateApcGrd(CmnsGrdVO cmnsGrdVO) throws Exception {

		int updatedCnt = cmnsGrdMapper.updateApcGrd(cmnsGrdVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteApcGrd(CmnsGrdVO CmnsGrdVO) throws Exception {

		int deletedCnt = cmnsGrdMapper.deleteApcGrd(CmnsGrdVO);
		
		return deletedCnt;
	}

}
