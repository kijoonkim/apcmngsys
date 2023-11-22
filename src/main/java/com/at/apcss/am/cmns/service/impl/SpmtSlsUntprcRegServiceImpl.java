package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.SpmtSlsUntprcRegMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.SpmtSlsUntprcRegService;
import com.at.apcss.am.cmns.vo.SpmtSlsUntprcRegVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
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
public class SpmtSlsUntprcRegServiceImpl extends BaseServiceImpl implements SpmtSlsUntprcRegService{

	@Autowired
	private SpmtSlsUntprcRegMapper spmtSlsUntprcRegMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

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
	public HashMap<String, Object> deleteSpmtSlsUntprcReg(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int deletedCnt = 0;

		String errMsg = cmnsValidationService.selectChkCdDelible(spmtSlsUntprcRegVO.getApcCd(), "SPMT_SLS_UNTPRC", spmtSlsUntprcRegVO.getSpmtSlsUntprcCd());
		if(errMsg == null) {
			deletedCnt = spmtSlsUntprcRegMapper.deleteSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		}else {
			resultMap.put("errMsg", errMsg);
		}
		return resultMap;
	}

	@Override
	public SpmtSlsUntprcRegVO getSpmtSlsUntprcCd(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {
		SpmtSlsUntprcRegVO resultVO = spmtSlsUntprcRegMapper.getSpmtSlsUntprcCd(spmtSlsUntprcRegVO);
		return resultVO;
	}

	@Override
	public int multiSpmtSlsUntprcRegList(List<SpmtSlsUntprcRegVO> spmtSlsUntprcRegList) throws Exception {
		int savedCnt = 0;
		for (SpmtSlsUntprcRegVO spmtSlsUntprcRegVO : spmtSlsUntprcRegList) {

			if(ComConstants.ROW_STS_INSERT.equals(spmtSlsUntprcRegVO.getRowSts())) {

				String spmtSlsUntprcCd = getSpmtSlsUntprcCd(spmtSlsUntprcRegVO).getSpmtSlsUntprcCd();
				spmtSlsUntprcRegVO.setSpmtSlsUntprcCd(spmtSlsUntprcCd);
				savedCnt += insertSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(spmtSlsUntprcRegVO.getRowSts())) {
				savedCnt += updateSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
			}
		}

		return savedCnt;
	}

}
