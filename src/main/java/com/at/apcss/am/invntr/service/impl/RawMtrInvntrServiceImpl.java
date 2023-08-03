package com.at.apcss.am.invntr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.invntr.mapper.RawMtrInvntrMapper;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.whrs.vo.RawMtrWrhsVO;
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
@Service("rawMtrInvntrService")
public class RawMtrInvntrServiceImpl extends BaseServiceImpl implements RawMtrInvntrService {

	@Autowired
	private RawMtrInvntrMapper rawMtrInvntrMapper;
	
	@Override
	public RawMtrInvntrVO selectRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO resultVO = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);
		
		return resultVO;
	}

	@Override
	public List<RawMtrInvntrVO> selectRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		List<RawMtrInvntrVO> resultList = rawMtrInvntrMapper.selectRawMtrInvntrList(rawMtrInvntrVO);
		
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		int insertedCnt = rawMtrInvntrMapper.insertRawMtrInvntr(rawMtrInvntrVO);
		
		return null;
	}


	@Override
	public HashMap<String, Object> insertRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {
		
		int insertedCnt = 0;
		for ( RawMtrInvntrVO rawMtrInvntrVO : rawMtrInvntrList ) {
			
			insertedCnt = rawMtrInvntrMapper.insertRawMtrInvntr(rawMtrInvntrVO);
			
			if (insertedCnt != 0) {
				
			}
		}
		
		return null;
	}
	
	
	@Override
	public HashMap<String, Object> updateRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		int updatedCnt = rawMtrInvntrMapper.updateRawMtrInvntr(rawMtrInvntrVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		int deletedCnt = rawMtrInvntrMapper.deleteRawMtrInvntr(rawMtrInvntrVO);
		
		return null;
	}


}
