package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.SpmtPckgUnitMapper;
import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.service.SpmtSlsUntprcRegService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.am.cmns.vo.SpmtSlsUntprcRegVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
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
public class SpmtPckgUnitServiceImpl extends BaseServiceImpl implements SpmtPckgUnitService{

	@Autowired
	private SpmtPckgUnitMapper spmtPckgUnitMapper;

	@Resource(name= "spmtSlsUntprcRegService")
	private SpmtSlsUntprcRegService spmtSlsUntprcRegService;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Resource(name = "cmnsGdsService")
	private CmnsGdsService cmnsGdsService;
	
	@Override
	public SpmtPckgUnitVO selectSpmtPckgUnit(SpmtPckgUnitVO spmtPckgUnitVO) throws Exception {
		SpmtPckgUnitVO resultVO = spmtPckgUnitMapper.selectSpmtPckgUnit(spmtPckgUnitVO);

		return resultVO;
	}

	@Override
	public List<SpmtPckgUnitVO> selectSpmtPckgUnitList(SpmtPckgUnitVO spmtPckgUnitVO) throws Exception {
		 List<SpmtPckgUnitVO> resultList = spmtPckgUnitMapper.selectSpmtPckgUnitList(spmtPckgUnitVO);
		return resultList;
	}

	@Override
	public int insertSpmtPckgUnit(SpmtPckgUnitVO spmtPckgUnitVO) throws Exception {
		int insertedCnt = spmtPckgUnitMapper.insertSpmtPckgUnit(spmtPckgUnitVO);

		return insertedCnt;
	}

	@Override
	public int updateSpmtPckgUnit(SpmtPckgUnitVO spmtPckgUnitVO) throws Exception {
		int updatedCnt = spmtPckgUnitMapper.updateSpmtPckgUnit(spmtPckgUnitVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteSpmtPckgUnit(SpmtPckgUnitVO spmtPckgUnitVO) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> resultSlsMap = new HashMap<String, Object>();

		String errMsg = cmnsValidationService.selectChkCdDelible(spmtPckgUnitVO.getApcCd(), "PCKG_UNIT_CD", spmtPckgUnitVO.getSpmtPckgUnitCd());
		int deletedCnt = 0;
		if(errMsg == null) {
			SpmtSlsUntprcRegVO spmtSlsUntprcReg = new SpmtSlsUntprcRegVO();

			BeanUtils.copyProperties(spmtPckgUnitVO, spmtSlsUntprcReg);

			List<SpmtSlsUntprcRegVO> resultList = spmtSlsUntprcRegService.selectSpmtSlsUntprcRegList(spmtSlsUntprcReg);

			for (SpmtSlsUntprcRegVO spmtSlsUntprcRegVO : resultList) {
				resultSlsMap = spmtSlsUntprcRegService.deleteSpmtSlsUntprcReg(spmtSlsUntprcRegVO);

				String errMsgSls = (String) resultSlsMap.get("errMsg");
				if(errMsgSls == null) {
					continue;
				}else {
					return resultSlsMap;
				}
			}
			deletedCnt = spmtPckgUnitMapper.deleteSpmtPckgUnit(spmtPckgUnitVO);
			resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		}else {
			resultMap.put("errMsg", errMsg);
		}

		return resultMap;
	}

	@Override
	public SpmtPckgUnitVO getSpmtPckgUnitCd(SpmtPckgUnitVO spmtPckgUnitVO) throws Exception {
		SpmtPckgUnitVO resultVO = spmtPckgUnitMapper.getSpmtPckgUnitCd(spmtPckgUnitVO);

		return resultVO;
	}

	@Override
	public int multiSaveSpmtPckgUnitList(List<SpmtPckgUnitVO> spmtPckgUnitList) throws Exception {
		int insertedCnt = 0;
		int savedCnt = 0;

		String spmtPckgUnitCd;
		for (SpmtPckgUnitVO spmtPckgUnitVO : spmtPckgUnitList) {

			if(ComConstants.ROW_STS_INSERT.equals(spmtPckgUnitVO.getRowSts())) {
				spmtPckgUnitCd = getSpmtPckgUnitCd(spmtPckgUnitVO).getSpmtPckgUnitCd();
				spmtPckgUnitVO.setSpmtPckgUnitCd(spmtPckgUnitCd);

				insertedCnt = insertSpmtPckgUnit(spmtPckgUnitVO);
				savedCnt += insertedCnt;
				if(insertedCnt > 0) {
					SpmtSlsUntprcRegVO spmtSlsUntprcRegVO = new SpmtSlsUntprcRegVO();

					spmtSlsUntprcRegVO.setApcCd(spmtPckgUnitVO.getApcCd());
					spmtSlsUntprcRegVO.setSpmtPckgUnitCd(spmtPckgUnitCd);
					spmtSlsUntprcRegVO.setSpmtSlsUntprc(spmtPckgUnitVO.getNtslUntprc());
					spmtSlsUntprcRegVO.setSpmtSlsUntprcCd(spmtSlsUntprcRegService.getSpmtSlsUntprcCd(spmtSlsUntprcRegVO).getSpmtSlsUntprcCd());
					spmtSlsUntprcRegVO.setSysFrstInptPrgrmId(spmtPckgUnitVO.getSysFrstInptPrgrmId());
					spmtSlsUntprcRegVO.setSysFrstInptUserId(spmtPckgUnitVO.getSysFrstInptUserId());
					spmtSlsUntprcRegVO.setSysLastChgPrgrmId(spmtPckgUnitVO.getSysLastChgPrgrmId());
					spmtSlsUntprcRegVO.setSysLastChgUserId(spmtPckgUnitVO.getSysLastChgUserId());

					savedCnt += spmtSlsUntprcRegService.insertSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
				}
				
				// 상품코드 발번 추가
				CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
				BeanUtils.copyProperties(spmtPckgUnitVO, cmnsGdsVO);
				cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
				
			}
			if(ComConstants.ROW_STS_UPDATE.equals(spmtPckgUnitVO.getRowSts())) {
				savedCnt += updateSpmtPckgUnit(spmtPckgUnitVO);
			}
		}

		return savedCnt;
	}

}
