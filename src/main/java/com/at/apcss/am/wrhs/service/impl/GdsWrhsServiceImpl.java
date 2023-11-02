package com.at.apcss.am.wrhs.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.am.cmns.service.CmnsGdsService;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.vo.CmnsGdsVO;
import com.at.apcss.am.wrhs.mapper.GdsWrhsMapper;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.wrhs.service.GdsWrhsService;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : GdsWrhsServiceImpl.java
 * @Description : 상품입고 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("gdsWrhsService")
public class GdsWrhsServiceImpl extends BaseServiceImpl implements GdsWrhsService {
	
	@Autowired
	private GdsWrhsMapper gdsWrhsMapper;
	
	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;
	
	@Resource(name="cmnsGdsService")
	private CmnsGdsService cmnsGdsService;
	
	@Override
	public List<GdsInvntrVO> selectGdsWrhsList(GdsInvntrVO gdsInvntrVO) throws Exception {
		
		List<GdsInvntrVO> resultList = gdsWrhsMapper.selectGdsWrhsList(gdsInvntrVO);
		
		return resultList;
	}
	
	@Override
	public HashMap<String, Object> insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {
		int sn = 1;
		String wrhsSeCd = "4";
		String trsprtSeCd = "3";
		String delYn = "N";
		String pckgno = cmnsTaskNoService.selectPckgno(gdsInvntrVO.getApcCd(), gdsInvntrVO.getPckgYmd());
		
		CmnsGdsVO cmnsGdsVO = new CmnsGdsVO();
		
		cmnsGdsVO.setSysLastChgUserId(gdsInvntrVO.getSysLastChgUserId());
		cmnsGdsVO.setSysLastChgPrgrmId(gdsInvntrVO.getSysLastChgPrgrmId());
		cmnsGdsVO.setApcCd(gdsInvntrVO.getApcCd());
		cmnsGdsVO.setItemCd(gdsInvntrVO.getItemCd());
		cmnsGdsVO.setVrtyCd(gdsInvntrVO.getVrtyCd());
		cmnsGdsVO.setSpcfctCd(gdsInvntrVO.getSpcfctCd());
		
		HashMap<String, Object> getGdsCd = cmnsGdsService.insertCheckGdsCd(cmnsGdsVO);
		if (getGdsCd != null) {
			throw new EgovBizException(getMessageForMap(getGdsCd));
		}

		if (!StringUtils.hasText(cmnsGdsVO.getNewGdsCd())) {
			throw new EgovBizException(
						getMessageForMap(ComUtil.getResultMap("E0003", "상품코드 발번"))
					);	// {0} 시 오류가 발생하였습니다.
		}
		
		gdsInvntrVO.setPckgno(pckgno);
		gdsInvntrVO.setPckgSn(sn);
		gdsInvntrVO.setWrhsSeCd(wrhsSeCd);
		gdsInvntrVO.setTrsprtSeCd(trsprtSeCd);
		gdsInvntrVO.setGdsCd(cmnsGdsVO.getNewGdsCd());
		gdsInvntrVO.setDelYn(delYn);
		
		gdsWrhsMapper.insertGdsInvntr(gdsInvntrVO);
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {
		String delYn = "Y";
		
		gdsInvntrVO.setDelYn(delYn);
		
		gdsWrhsMapper.deleteGdsInvntr(gdsInvntrVO);
		
		return null;
	}
	
}
