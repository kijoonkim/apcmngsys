package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.SpmtSlsUntprcRegMapper;
import com.at.apcss.am.cmns.service.SpmtSlsUntprcRegService;
import com.at.apcss.am.cmns.vo.SpmtSlsUntprcRegVO;
/**
 * @Class Name : SpmtPckgUnitServiceImpl.java
 * @Description : 출하포장단위 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service(value="spmtSlsUntprcRegService")
public class SpmtSlsUntprcRegServiceImpl implements SpmtSlsUntprcRegService{

	@Autowired
	private SpmtSlsUntprcRegMapper spmtSlsUntprcRegMapper;

	@Override
	public SpmtSlsUntprcRegVO selectSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {
		return spmtSlsUntprcRegMapper.selectSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
	}

	@Override
	public List<SpmtSlsUntprcRegVO> selectSpmtSlsUntprcRegList(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {
		return spmtSlsUntprcRegMapper.selectSpmtSlsUntprcRegList(spmtSlsUntprcRegVO);
	}

	@Override
	public int insertSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {
		return spmtSlsUntprcRegMapper.insertSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
	}

	@Override
	public int updateSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {
		return spmtSlsUntprcRegMapper.updateSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
	}

	@Override
	public int deleteSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {
		return spmtSlsUntprcRegMapper.deleteSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
	}

	@Override
	public SpmtSlsUntprcRegVO getSpmtSlsUntprcCd(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {
		return spmtSlsUntprcRegMapper.getSpmtSlsUntprcCd(spmtSlsUntprcRegVO);
	}

}
