package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.SpmtSlsUntprcRegMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.SpmtSlsUntprcRegService;
import com.at.apcss.am.cmns.vo.SpmtSlsUntprcRegVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
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

		if(0 == spmtSlsUntprcRegMapper.deleteSpmtSlsUntprcReg(spmtSlsUntprcRegVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}
		return null;
	}

	@Override
	public SpmtSlsUntprcRegVO getSpmtSlsUntprcCd(SpmtSlsUntprcRegVO spmtSlsUntprcRegVO) throws Exception {
		SpmtSlsUntprcRegVO resultVO = spmtSlsUntprcRegMapper.getSpmtSlsUntprcCd(spmtSlsUntprcRegVO);
		return resultVO;
	}

	@Override
	public HashMap<String, Object> multiSpmtSlsUntprcRegList(List<SpmtSlsUntprcRegVO> spmtSlsUntprcRegList) throws Exception {
		for (SpmtSlsUntprcRegVO spmtSlsUntprcRegVO : spmtSlsUntprcRegList) {

			if(ComConstants.ROW_STS_INSERT.equals(spmtSlsUntprcRegVO.getRowSts())) {

				String spmtSlsUntprcCd = getSpmtSlsUntprcCd(spmtSlsUntprcRegVO).getSpmtSlsUntprcCd();
				spmtSlsUntprcRegVO.setSpmtSlsUntprcCd(spmtSlsUntprcCd);
				if(0 == insertSpmtSlsUntprcReg(spmtSlsUntprcRegVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
			if(ComConstants.ROW_STS_UPDATE.equals(spmtSlsUntprcRegVO.getRowSts())) {

				if(0 == updateSpmtSlsUntprcReg(spmtSlsUntprcRegVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		return null;
	}

}
