package com.at.apcss.am.trnsf.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.beans.BeanUtils;

import com.at.apcss.am.trnsf.mapper.TrnsfRawMtrInvntrMapper;
import com.at.apcss.am.trnsf.service.TrnsfRawMtrInvntrService;
import com.at.apcss.am.trnsf.vo.TrnsfRawMtrInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : RawMtrInvntrServiceImpl.java
 * @Description : 원물재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("TrnsfRawMtrInvntrService")
public class TrnsfRawMtrInvntrServiceImpl extends BaseServiceImpl implements TrnsfRawMtrInvntrService {

	@Autowired
	private TrnsfRawMtrInvntrMapper trnsfRawMtrInvntrMapper;


	@Override
	public List<TrnsfRawMtrInvntrVO> selectTrnsfRawMtrInvntrList(TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO) throws Exception {

		List<TrnsfRawMtrInvntrVO> resultList = trnsfRawMtrInvntrMapper.selectTrnsfRawMtrInvntrList(trnsfRawMtrInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> updateTrnsfRawMtrInvntrList(List<TrnsfRawMtrInvntrVO> trnsfRawMtrInvntrList) throws Exception {

		List<TrnsfRawMtrInvntrVO> updateList = new ArrayList<>();

		for (TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO : trnsfRawMtrInvntrList) {
			TrnsfRawMtrInvntrVO vo = new TrnsfRawMtrInvntrVO();
			BeanUtils.copyProperties(trnsfRawMtrInvntrVO, vo);

			if (ComConstants.ROW_STS_UPDATE.equals(trnsfRawMtrInvntrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for (TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO : updateList) {
			trnsfRawMtrInvntrMapper.updateTrnsfRawMtrInvntrList(trnsfRawMtrInvntrVO);
		}

		return null;
	}



}
