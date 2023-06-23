package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.PltBxMapper;
import com.at.apcss.am.cmns.service.PltBxService;
import com.at.apcss.am.cmns.vo.PltBxVO;

/**
 * @Class Name : PltBxServiceImpl.java
 * @Description : 팔레트/박스 정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("pltBxService")
public class PltBxServiceImpl implements PltBxService {
	
	@Autowired
	private PltBxMapper pltBxMapper;
	
	@Override
	public PltBxVO selectPltBx(PltBxVO pltBxVO) throws Exception {

		PltBxVO resultVO = pltBxMapper.selectPltBx(pltBxVO);
		
		return resultVO;
	}

	@Override
	public List<PltBxVO> selectPltBxList(PltBxVO pltBxVO) throws Exception {
		
		List<PltBxVO> resultList = pltBxMapper.selectPltBxList(pltBxVO);
				
		return resultList;
	}

	@Override
	public int insertPltBx(PltBxVO pltBxVO) throws Exception {
		
		int insertedCnt = pltBxMapper.insertPltBx(pltBxVO);
		
		return insertedCnt;
	}

	@Override
	public int updatePltBx(PltBxVO pltBxVO) throws Exception {
		
		int updatedCnt = pltBxMapper.updatePltBx(pltBxVO);
		
		return updatedCnt;
	}

	@Override
	public int deletePltBx(PltBxVO pltBxVO) throws Exception {
		
		int deletedCnt = pltBxMapper.deletePltBx(pltBxVO);
		
		return deletedCnt;
	}

}
