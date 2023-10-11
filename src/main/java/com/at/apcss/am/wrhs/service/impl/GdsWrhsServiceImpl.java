package com.at.apcss.am.wrhs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.wrhs.mapper.GdsWrhsMapper;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.wrhs.service.GdsWrhsService;

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
public class GdsWrhsServiceImpl implements GdsWrhsService {
	
	@Autowired
	private GdsWrhsMapper gdsWrhsMapper;
	
	@Override
	public List<GdsInvntrVO> selectGdsWrhsList(GdsInvntrVO gdsInvntrVO) throws Exception {
		
		List<GdsInvntrVO> resultList = gdsWrhsMapper.selectGdsWrhsList(gdsInvntrVO);
		
		return resultList;
	}
	
}
