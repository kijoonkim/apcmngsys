package com.at.apcss.am.cmns.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.mapper.DdlnMapper;
import com.at.apcss.am.cmns.service.DdlnService;
import com.at.apcss.am.cmns.vo.DdlnVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : WrhsVhclServiceImpl.java
 * @Description : 입고차량정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("DdlnService")
public class DdlnServiceImpl extends BaseServiceImpl implements DdlnService {
	
	@Autowired
	private DdlnMapper DdlnMapper;

	@Override
	public List<DdlnVO> selectDdlnList(DdlnVO DdlnVO) throws Exception {

		List<DdlnVO> resultList = DdlnMapper.selectDdlnList(DdlnVO);
		
		return resultList;
	}

	@Override
	public int insertDdln(DdlnVO DdlnVO) throws Exception {

		int insertedCnt = DdlnMapper.insertDdln(DdlnVO);
		
		return insertedCnt;
	}

	@Override
	public int updateDdln(DdlnVO DdlnVO) throws Exception {

		int updatedCnt = DdlnMapper.updateDdln(DdlnVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteDdln(DdlnVO DdlnVO) throws Exception {

		int deletedCnt = DdlnMapper.deleteDdln(DdlnVO);
		
		return deletedCnt;
	}
	
	@Override
	public HashMap<String, Object> multiDdlnList(List<DdlnVO> ddlnList) throws Exception {
		// TODO Auto-generated method stub
	
		List<DdlnVO> insertList = new ArrayList<>();
		List<DdlnVO> updateList = new ArrayList<>();
		
		for ( DdlnVO DdlnVO : ddlnList ) {
			DdlnVO vo = new DdlnVO();
			BeanUtils.copyProperties(DdlnVO, vo);
			
			if (ComConstants.ROW_STS_INSERT.equals(DdlnVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(DdlnVO.getRowSts())) {
				updateList.add(vo);
			}
		}
		
		for ( DdlnVO DdlnVO : insertList ) {
			DdlnMapper.insertDdln(DdlnVO);
		}
		
		for ( DdlnVO DdlnVO : updateList ) {
			DdlnMapper.updateDdln(DdlnVO);
		}
		return null;
	}
}
