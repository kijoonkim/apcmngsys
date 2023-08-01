package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.SpmtPckgUnitMapper;
import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
/**
 * @Class Name : SpmtPckgUnitServiceImpl.java
 * @Description : 출하포장단위 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2023.07.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.31  김호        최초 생성
 * </pre>
 */
@Service(value="spmtPckgUnitService")
public class SpmtPckgUnitServiceImpl implements SpmtPckgUnitService{

	@Autowired
	private SpmtPckgUnitMapper spmtPckgUnitMapper;

	@Override
	public SpmtPckgUnitVO selectSpmtPckgUnit(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception {
		return spmtPckgUnitMapper.selectSpmtPckgUnit(SpmtPckgUnitVO);
	}

	@Override
	public List<SpmtPckgUnitVO> selectSpmtPckgUnitList(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception {
		return spmtPckgUnitMapper.selectSpmtPckgUnitList(SpmtPckgUnitVO);
	}

	@Override
	public int insertSpmtPckgUnit(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception {
		return spmtPckgUnitMapper.insertSpmtPckgUnit(SpmtPckgUnitVO);
	}

	@Override
	public int updateSpmtPckgUnit(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception {
		return spmtPckgUnitMapper.updateSpmtPckgUnit(SpmtPckgUnitVO);
	}

	@Override
	public int deleteSpmtPckgUnit(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception {
		return spmtPckgUnitMapper.deleteSpmtPckgUnit(SpmtPckgUnitVO);
	}

	@Override
	public SpmtPckgUnitVO getSpmtPckgUnitCd(SpmtPckgUnitVO SpmtPckgUnitVO) throws Exception {
		return spmtPckgUnitMapper.getSpmtPckgUnitCd(SpmtPckgUnitVO);
	}

}
