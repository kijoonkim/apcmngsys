package com.at.apcss.am.cmns.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.RgnTrsprtCstMapper;
import com.at.apcss.am.cmns.service.RgnTrsprtCstService;
import com.at.apcss.am.cmns.vo.RgnTrsprtCstVO;
import com.at.apcss.co.constants.ComConstants;

/**
 * @Class Name : RgnTrsprtCstServiceImpl.java
 * @Description : 지역별운임비정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rgnTrsprtCstService")
public class RgnTrsprtCstServiceImpl implements RgnTrsprtCstService {
	
	@Autowired
	private RgnTrsprtCstMapper rgnTrsprtCstMapper;
	
	@Override
	public RgnTrsprtCstVO selectRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {
		
		RgnTrsprtCstVO resultVO = rgnTrsprtCstMapper.selectRgnTrsprtCst(rgnTrsprtCstVO);
		
		return resultVO;
	}

	@Override
	public List<RgnTrsprtCstVO> selectRgnTrsprtCstList(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {
		
		List<RgnTrsprtCstVO> resultList = rgnTrsprtCstMapper.selectRgnTrsprtCstList(rgnTrsprtCstVO);

		return resultList;
	}
	
	@Override
	public int insertRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {
		
		int insertedCnt = rgnTrsprtCstMapper.insertRgnTrsprtCst(rgnTrsprtCstVO);
		
		return insertedCnt;
	}

	@Override
	public int updateRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {

		int updatedCnt = rgnTrsprtCstMapper.updateRgnTrsprtCst(rgnTrsprtCstVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {

		int deletedCnt = rgnTrsprtCstMapper.deleteRgnTrsprtCst(rgnTrsprtCstVO);
		
		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> multiRgnTrsprtCst(List<RgnTrsprtCstVO> vhclList) throws Exception {
		// TODO Auto-generated method stub

		List<RgnTrsprtCstVO> insertList = new ArrayList<>();
		List<RgnTrsprtCstVO> updateList = new ArrayList<>();

		for (RgnTrsprtCstVO rgnTrsprtCstVO : vhclList) {
			RgnTrsprtCstVO vo = new RgnTrsprtCstVO();
			BeanUtils.copyProperties(rgnTrsprtCstVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(rgnTrsprtCstVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(rgnTrsprtCstVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for (RgnTrsprtCstVO rgnTrsprtCstVO : insertList) {
			rgnTrsprtCstMapper.insertRgnTrsprtCst(rgnTrsprtCstVO);
		}

		for (RgnTrsprtCstVO rgnTrsprtCstVO : updateList) {
			rgnTrsprtCstMapper.updateRgnTrsprtCst(rgnTrsprtCstVO);
		}
		return null;
	}

}
