package com.at.apcss.am.cmns.service.impl;

import com.at.apcss.am.cmns.mapper.CnptSpmtPckgUnitMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CnptSpmtPckgUnitService;
import com.at.apcss.am.cmns.vo.CnptSpmtPckgUnitVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Class Name : CnptSpmtPckgUnitServiceImpl.java
 * @Description : 출하 상품 거래처 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2023.08.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.01  김호        최초 생성
 * </pre>
 */
@Service(value="cnptSpmtPckgUnitService")
public class CnptSpmtPckgUnitServiceImpl extends BaseServiceImpl implements CnptSpmtPckgUnitService {

	@Autowired
	private CnptSpmtPckgUnitMapper cnptSpmtPckgUnitMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public CnptSpmtPckgUnitVO selectCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception {
		return cnptSpmtPckgUnitMapper.selectCnptSpmtPckgUnit(cnptSpmtPckgUnitVO);
	}

	@Override
	public List<CnptSpmtPckgUnitVO> selectCnptSpmtPckgUnitList(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception {
		return cnptSpmtPckgUnitMapper.selectCnptSpmtPckgUnitList(cnptSpmtPckgUnitVO);
	}

	@Override
	public int insertCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception {
		return cnptSpmtPckgUnitMapper.insertCnptSpmtPckgUnit(cnptSpmtPckgUnitVO);
	}

	@Override
	public int updateCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception {
		return cnptSpmtPckgUnitMapper.updateCnptSpmtPckgUnit(cnptSpmtPckgUnitVO);
	}

	@Override
	public int deleteCnptSpmtPckgUnit(CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO) throws Exception {
		return cnptSpmtPckgUnitMapper.deleteCnptSpmtPckgUnit(cnptSpmtPckgUnitVO);
	}

	@Override
	public int multiCnptSpmtPckgUnitList(List<CnptSpmtPckgUnitVO> cnptSpmtPckgUnitList) throws Exception {
		return cnptSpmtPckgUnitMapper.mergeCnptSpmtPckgUnitList(cnptSpmtPckgUnitList);
	}
}
