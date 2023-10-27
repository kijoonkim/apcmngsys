package com.at.apcss.am.trnsf.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.trnsf.mapper.TrnsfGdsInvntrMapper;
import com.at.apcss.am.trnsf.service.InvntrTrnsfService;
import com.at.apcss.am.trnsf.service.TrnsfGdsInvntrService;
import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;
import com.at.apcss.am.trnsf.vo.TrnsfGdsInvntrVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : GdsInvntrServiceImpl.java
 * @Description : 상품재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("trnsfGdsInvntrService")
public class TrnsfGdsInvntrServiceImpl extends BaseServiceImpl implements TrnsfGdsInvntrService {


	@Autowired
	private TrnsfGdsInvntrMapper trnsfGdsInvntrMapper;

	@Resource(name = "gdsInvntrService")
	private GdsInvntrService gdsInvntrService;

	@Resource(name = "invntrTrnsfService")
	private InvntrTrnsfService invntrTrnsfService;

	@Override
	public List<TrnsfGdsInvntrVO> selectUpdateTrnsfGdsInvntrList(TrnsfGdsInvntrVO trnsfGdsInvntrVO) throws Exception {

		List<TrnsfGdsInvntrVO> resultList = trnsfGdsInvntrMapper.selectUpdateTrnsfGdsInvntrList(trnsfGdsInvntrVO);

		return resultList;
	}


	@Override
	public HashMap<String, Object> inserttrnsfGdsInvntrList(List<TrnsfGdsInvntrVO> trnsfGdsInvntrList) throws Exception {
		List<InvntrTrnsfVO> insertList = new ArrayList<>();

		List<GdsInvntrVO> GdsInvntrList = new ArrayList<>();


		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		for (TrnsfGdsInvntrVO trnsfGdsInvntrVO : trnsfGdsInvntrList) {
			InvntrTrnsfVO invntrTrnsf = new InvntrTrnsfVO();
			GdsInvntrVO gdsInvntr = new GdsInvntrVO();

			BeanUtils.copyProperties(trnsfGdsInvntrVO, gdsInvntr);
			BeanUtils.copyProperties(trnsfGdsInvntrVO, invntrTrnsf);

			GdsInvntrList.add(gdsInvntr);

			insertList.add(invntrTrnsf);

		}

		resultMap = invntrTrnsfService.insertInvntrTrnsfList(insertList);

		if(resultMap != null) {
			throw new EgovBizException(getMessageForMap(resultMap));
		}


		resultMap = gdsInvntrService.multiGdsInvntrList(GdsInvntrList);

		if(resultMap != null) {
			throw new EgovBizException(getMessageForMap(resultMap));
		}

		return resultMap;
	}

}
