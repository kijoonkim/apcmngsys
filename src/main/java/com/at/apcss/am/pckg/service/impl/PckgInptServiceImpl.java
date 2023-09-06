package com.at.apcss.am.pckg.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.pckg.mapper.PckgInptMapper;
import com.at.apcss.am.pckg.service.PckgInptService;
import com.at.apcss.am.pckg.vo.PckgInptVO;

/**
 * @Class Name : PckgInptServiceImpl.java
 * @Description : 포장투입 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("pckgInptService")
public class PckgInptServiceImpl implements PckgInptService {

	@Autowired
	private PckgInptMapper pckgInptMapper;

	@Override
	public PckgInptVO selectPckgInpt(PckgInptVO pckgInptVO) throws Exception {

		PckgInptVO resultVO = pckgInptMapper.selectPckgInpt(pckgInptVO);

		return resultVO;
	}

	@Override
	public List<PckgInptVO> selectPckgInptList(PckgInptVO pckgInptVO) throws Exception {

		List<PckgInptVO> resultList = pckgInptMapper.selectPckgInptList(pckgInptVO);

		return resultList;
	}

	@Override
	public int insertPckgInpt(PckgInptVO pckgInptVO) throws Exception {

		int insertedCnt = pckgInptMapper.insertPckgInpt(pckgInptVO);

		return insertedCnt;
	}

	@Override
	public int updatePckgInpt(PckgInptVO pckgInptVO) throws Exception {

		int updatedCnt = pckgInptMapper.updatePckgInpt(pckgInptVO);

		return updatedCnt;
	}

	@Override
	public int deletePckgInpt(PckgInptVO pckgInptVO) throws Exception {

		int deletedCnt = pckgInptMapper.deletePckgInpt(pckgInptVO);

		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> insertPckgInptList(List<PckgInptVO> pckgInptList) throws Exception {

		for ( PckgInptVO pckgInptVO : pckgInptList ) {
			insertPckgInpt(pckgInptVO);
		}

		return null;
	}

}
