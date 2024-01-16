package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.mapper.OrdrGdsMapper;
import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.OrdrGdsService;
import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.am.cmns.vo.OrdrGdsVO;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : OrdrGdsServiceImpl.java
 * @Description : 발주상품정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("ordrGdsService")
public class OrdrGdsServiceImpl extends BaseServiceImpl implements OrdrGdsService {

	@Autowired
	private OrdrGdsMapper ordrGdsMapper;

	@Resource(name = "cmnsGdsService")
	private CmnsGdsService cmnsGdsService;
	
	@Resource(name = "spmtPckgUnitService")
	private SpmtPckgUnitService spmtPckgUnitService;
	
	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;
	
	
	
	@Override
	public OrdrGdsVO selectOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception {
		OrdrGdsVO resultVO = ordrGdsMapper.selectOrdrGds(ordrGdsVO);
		return resultVO;
	}

	@Override
	public List<OrdrGdsVO> selectOrdrGdsList(OrdrGdsVO ordrGdsVO) throws Exception {
		List<OrdrGdsVO> resultList = ordrGdsMapper.selectOrdrGdsList(ordrGdsVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> multiOrdrGdsList(List<OrdrGdsVO> ordrGdsList) throws Exception {

		String aplcnYmd = cmnsValidationService.selectNowDateString();
		
		HashMap<String, Object> rtnObj = new HashMap<>();
		
		if (ordrGdsList == null || ordrGdsList.isEmpty()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "발주상품정보");	// W0005	{0}이/가 없습니다.
		}
		
		//cmnsGdsService.insertCheckGdsCd
		// 발주상품정보 등록
		for ( OrdrGdsVO ordrGds : ordrGdsList ) {
			
			SpmtPckgUnitVO pckgUnitParam = new SpmtPckgUnitVO();
			pckgUnitParam.setApcCd(ordrGds.getApcCd());
			pckgUnitParam.setSpmtPckgUnitCd(ordrGds.getSpmtPckgUnitCd());
			// 출하포장단위로 스펙 조회
			SpmtPckgUnitVO spmtPckgUnitVO = spmtPckgUnitService.selectSpmtPckgUnit(pckgUnitParam);
			
			if (spmtPckgUnitVO == null || !StringUtils.hasText(spmtPckgUnitVO.getSpmtPckgUnitCd())) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품조회결과")));
			}
			
			ordrGds.setItemCd(spmtPckgUnitVO.getItemCd());
			ordrGds.setVrtyCd(spmtPckgUnitVO.getVrtyCd());
			ordrGds.setSpcfctCd(spmtPckgUnitVO.getSpcfctCd());
			
			if (!StringUtils.hasText(ordrGds.getAplcnYmd())) {
				ordrGds.setAplcnYmd(aplcnYmd);
			}
			
			CmnsGdsVO gdsVO = new CmnsGdsVO();
			BeanUtils.copyProperties(ordrGds, gdsVO);
			rtnObj = cmnsGdsService.insertCheckGdsCd(gdsVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
			ordrGds.setGdsCd(gdsVO.getNewGdsCd());
			
			if (!StringUtils.hasText(ordrGds.getGdsCd())) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "상품정보")));
			}
			
			OrdrGdsVO ordrGdsInfo = selectOrdrGds(ordrGds);
			if (ordrGdsInfo != null && StringUtils.hasText(ordrGdsInfo.getApcCd())) {

				if (ComConstants.CON_YES.equals(ordrGdsInfo.getDelYn())) {
					// delete
					deleteOrdrGds(ordrGds);
					// insert
					rtnObj = insertOrdrGds(ordrGds);
				} else {
					// update
					rtnObj = updateOrdrGds(ordrGds);
				}
			} else {
				// insert				
				rtnObj = insertOrdrGds(ordrGds);
			}
			
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
			
			ordrGdsMapper.updateSpMrktOrdrGdsUpdt(ordrGds);
			if (StringUtils.hasText(ordrGds.getRtnCd())) {
				return ComUtil.getResultMap(ordrGds.getRtnCd(), ordrGds.getRtnMsg());
			}
		}
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> insertOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception {
		ordrGdsMapper.insertOrdrGds(ordrGdsVO);
		return null;
	}

	@Override
	public HashMap<String, Object> updateOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception {
		ordrGdsMapper.updateOrdrGds(ordrGdsVO);
		return null;
	}
	
	@Override
	public HashMap<String, Object> updateOrdrGdsForDelY(OrdrGdsVO ordrGdsVO) throws Exception {
		ordrGdsMapper.updateOrdrGdsForDelY(ordrGdsVO);
		return null;
	}
	
	@Override
	public HashMap<String, Object> deleteOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception {
		ordrGdsMapper.deleteOrdrGds(ordrGdsVO);
		return null;
	}





}
