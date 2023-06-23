package com.at.apcss.am.clcln.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.clcln.mapper.ClclnPrfmncMapper;
import com.at.apcss.am.clcln.service.ClclnPrfmncService;
import com.at.apcss.am.clcln.vo.ClclnPrfmncVO;

/**
 * @Class Name : ClclnPrfmncServiceImpl.java
 * @Description : 정산실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("clclnPrfmncService")
public class ClclnPrfmncServiceImpl implements ClclnPrfmncService {

	@Autowired
	private ClclnPrfmncMapper clclnPrfmncMapper;
	
	@Override
	public ClclnPrfmncVO selectClclnPrfmnc(ClclnPrfmncVO clclnPrfmncVO) throws Exception {
		
		ClclnPrfmncVO rtnVO = clclnPrfmncMapper.selectClclnPrfmnc(clclnPrfmncVO);
		
		return rtnVO;
	}

	@Override
	public List<ClclnPrfmncVO> selectClclnPrfmncList(ClclnPrfmncVO clclnPrfmncVO) throws Exception {
		
		List<ClclnPrfmncVO> rtnList = clclnPrfmncMapper.selectClclnPrfmncList(clclnPrfmncVO);
		
		return rtnList;
	}

}
