package com.at.apcss.am.trnsf.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.invntr.mapper.GdsInvntrMapper;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.GdsStdGrdVO;
import com.at.apcss.am.trnsf.mapper.TrnsfGdsInvntrMapper;
import com.at.apcss.am.trnsf.service.TrnsfGdsInvntrService;
import com.at.apcss.am.trnsf.vo.TrnsfGdsInvntrVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

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

	@Override
	public List<TrnsfGdsInvntrVO> selectUpdateTrnsfGdsInvntrList(TrnsfGdsInvntrVO trnsfGdsInvntrVO) throws Exception {
		
		List<TrnsfGdsInvntrVO> resultList = trnsfGdsInvntrMapper.selectUpdateTrnsfGdsInvntrList(trnsfGdsInvntrVO);
		
		return resultList;
	}

	
	@Override
	public HashMap<String, Object> updateTrnsfGdsInvntrList(List<TrnsfGdsInvntrVO> trnsfGdsInvntrList) throws Exception {
		List<TrnsfGdsInvntrVO> updateList = new ArrayList<>();

		for (TrnsfGdsInvntrVO trnsfGdsInvntrVO : trnsfGdsInvntrList) {
			TrnsfGdsInvntrVO vo = new TrnsfGdsInvntrVO();
			BeanUtils.copyProperties(trnsfGdsInvntrVO, vo);

			if (ComConstants.ROW_STS_UPDATE.equals(trnsfGdsInvntrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for (TrnsfGdsInvntrVO trnsfGdsInvntrVO : updateList) {
			trnsfGdsInvntrMapper.updateTrnsfGdsInvntrList(trnsfGdsInvntrVO);
		}

		return null;
	}

}
