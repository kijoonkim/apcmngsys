package com.at.apcss.am.ordr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.ordr.mapper.OrdrMapper;
import com.at.apcss.am.ordr.service.OrdrService;
import com.at.apcss.am.ordr.vo.OrdrVO;

/**
 * @Class Name : OrdrServiceImpl.java
 * @Description : 발주정보 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("ordrService")
public class OrdrServiceImpl implements OrdrService {

	@Autowired
	private OrdrMapper ordrMapper;
	
	@Override
	public OrdrVO selectOrdr(OrdrVO ordrVO) throws Exception {

		OrdrVO resultVO = ordrMapper.selectOrdr(ordrVO);
		
		return resultVO;
	}

	@Override
	public List<OrdrVO> selectOrdrList(OrdrVO ordrVO) throws Exception {

		List<OrdrVO> resultList = ordrMapper.selectOrdrList(ordrVO);
		
		return resultList;
	}

	@Override
	public int insertOrdr(OrdrVO ordrVO) throws Exception {

		int insertedCnt = ordrMapper.insertOrdr(ordrVO);
		
		return insertedCnt;
	}

	@Override
	public int updateOrdr(OrdrVO ordrVO) throws Exception {

		int updatedCnt = ordrMapper.updateOrdr(ordrVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteOrdr(OrdrVO ordrVO) throws Exception {

		int deletedCnt = ordrMapper.deleteOrdr(ordrVO);
		
		return deletedCnt;
	}

}
