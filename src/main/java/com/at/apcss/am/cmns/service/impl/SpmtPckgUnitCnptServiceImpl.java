package com.at.apcss.am.cmns.service.impl;

import com.at.apcss.am.cmns.mapper.SpmtPckgUnitCnptMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.SpmtPckgUnitCnptService;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitCnptVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Class Name : SpmtPckgUnitCnptServiceImpl.java
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
@Service(value="spmtPckgUnitCnptService")
public class SpmtPckgUnitCnptServiceImpl extends BaseServiceImpl implements SpmtPckgUnitCnptService {

	@Autowired
	private SpmtPckgUnitCnptMapper spmtPckgUnitCnptMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public SpmtPckgUnitCnptVO selectSpmtPckgUnitCnpt(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception {
		return spmtPckgUnitCnptMapper.selectSpmtPckgUnitCnpt(spmtPckgUnitCnptVO);
	}

	@Override
	public List<SpmtPckgUnitCnptVO> selectSpmtPckgUnitCnptList(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception {
		return spmtPckgUnitCnptMapper.selectSpmtPckgUnitCnptList(spmtPckgUnitCnptVO);
	}

	@Override
	public int insertSpmtPckgUnitCnpt(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception {
		return spmtPckgUnitCnptMapper.insertSpmtPckgUnitCnpt(spmtPckgUnitCnptVO);
	}

	@Override
	public int updateSpmtPckgUnitCnpt(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception {
		return spmtPckgUnitCnptMapper.updateSpmtPckgUnitCnpt(spmtPckgUnitCnptVO);
	}

	@Override
	public int deleteSpmtPckgUnitCnpt(SpmtPckgUnitCnptVO spmtPckgUnitCnptVO) throws Exception {
		return spmtPckgUnitCnptMapper.deleteSpmtPckgUnitCnpt(spmtPckgUnitCnptVO);
	}

	@Override
	public int multiSpmtPckgUnitCnptList(List<SpmtPckgUnitCnptVO> spmtPckgUnitCnptList) throws Exception {
		return spmtPckgUnitCnptMapper.mergeSpmtPckgUnitCnptList(spmtPckgUnitCnptList);
	}
}
