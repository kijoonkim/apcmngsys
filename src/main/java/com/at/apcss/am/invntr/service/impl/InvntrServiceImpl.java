package com.at.apcss.am.invntr.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.InvntrService;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.InvntrVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : InvntrServiceImpl.java
 * @Description : 재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("invntrService")
public class InvntrServiceImpl extends BaseServiceImpl implements InvntrService {

	// 원물재고
	@Resource(name="rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;
	
	// 선별재고
	@Resource(name="sortInvntrService")
	private SortInvntrService sortInvntrService;
	
	// 상품재고
	@Resource(name="gdsInvntrService")
	private GdsInvntrService gdsInvntrService;
	
	
	@Override
	public HashMap<String, Object> insertInvntr(InvntrVO invntrVO) throws Exception {
		// TODO Auto-generated method stub
		
		
		
		
		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntr(InvntrVO invntrVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
