package com.apcmngsys.apcss.am.invntr.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.apcmngsys.apcss.am.invntr.mapper.InvntrGrdMngMapper;
import com.apcmngsys.apcss.am.invntr.service.GdsInvntrService;
import com.apcmngsys.apcss.am.invntr.service.InvntrGrdMngService;
import com.apcmngsys.apcss.am.invntr.service.InvntrService;
import com.apcmngsys.apcss.am.invntr.service.RawMtrInvntrService;
import com.apcmngsys.apcss.am.invntr.service.SortInvntrService;
import com.apcmngsys.apcss.am.invntr.vo.InvntrMngVO;
import com.apcmngsys.apcss.am.invntr.vo.InvntrVO;
import com.apcmngsys.apcss.am.sort.mapper.SortPrfmncMapper;
import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;

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
@Service("invntrGrdMngService")
public class InvntrGrdMngServiceImpl extends BaseServiceImpl implements InvntrGrdMngService {


	@Autowired
	private InvntrGrdMngMapper invntrMngMapper;

	@Override
	public List<InvntrMngVO> selectInvntrGrdMng(InvntrMngVO invntrMngVO) throws Exception {

		List<InvntrMngVO> result = invntrMngMapper.selectInvntrGrdMng(invntrMngVO);

		return result;
	}




}
