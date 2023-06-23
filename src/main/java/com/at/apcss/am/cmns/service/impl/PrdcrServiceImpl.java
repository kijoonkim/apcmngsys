package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.PrdcrMapper;
import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.vo.PrdcrVO;

/**
 * @Class Name : PrdcrServiceImpl.java
 * @Description : 생산자정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("prdcrService")
public class PrdcrServiceImpl implements PrdcrService {
	
	@Autowired
	private PrdcrMapper prdcrMapper;
	
	@Override
	public PrdcrVO selectPrdcr(PrdcrVO prdcrVO) throws Exception {
		
		PrdcrVO resultVO = prdcrMapper.selectPrdcr(prdcrVO);

		return resultVO;
	}

	@Override
	public List<PrdcrVO> selectPrdcrList(PrdcrVO prdcrVO) throws Exception {
		
		List<PrdcrVO> resultList = prdcrMapper.selectPrdcrList(prdcrVO);
		
		return resultList;
	}

	@Override
	public int insertPrdcr(PrdcrVO prdcrVO) throws Exception {

		int insertedCnt = prdcrMapper.insertPrdcr(prdcrVO);

		return insertedCnt;
	}

	@Override
	public int updatePrdcr(PrdcrVO prdcrVO) throws Exception {

		int updatedCnt = prdcrMapper.updatePrdcr(prdcrVO);

		return updatedCnt;
	}

	@Override
	public int deletePrdcr(PrdcrVO prdcrVO) throws Exception {

		int deletedCnt = prdcrMapper.deletePrdcr(prdcrVO);

		return deletedCnt;
	}

}
