package com.at.apcss.co.log.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.log.mapper.ComLogMapper;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;

/**
 * 이력정보에 대한 서비스 구현 클래스를 정의한다
 * @author 신정철
 * @since 2023.06.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자          수정내용
 *  ----------  ----------    ---------------------------
 *  2023.06.20  신정철          최초 생성
 *
 * </pre>
 */
@Service("comLogService")
public class ComLogServiceImpl implements ComLogService {

	@Autowired
	private ComLogMapper comLogMapper;

	@Override
	public List<ComLogVO> selectCntnHstryList(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		List<ComLogVO> resultList = comLogMapper.selectCntnHstryList(comLogVO);

		return resultList;
	}

	@Override
	public List<ComLogVO> selectMenuHstryList(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		List<ComLogVO> resultList = comLogMapper.selectMenuHstryList(comLogVO);

		return resultList;
	}

	@Override
	public List<ComLogVO> selectTrsmHstryList(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		List<ComLogVO> resultList = comLogMapper.selectTrsmHstryList(comLogVO);

		return resultList;
	}

	@Override
	public List<ComLogVO> selectBatchHstryList(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		List<ComLogVO> resultList = comLogMapper.selectBatchHstryList(comLogVO);

		return resultList;
	}

	@Override
	public void insertMenuHstry(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		comLogMapper.insertMenuHstry(comLogVO);


	}

}
