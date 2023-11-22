package com.at.apcss.co.log.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.log.mapper.ComLogMapper;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

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
public class ComLogServiceImpl extends BaseServiceImpl implements ComLogService {

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

	// 원물재고 변경 이력 조회
	@Override
	public List<ComLogVO> selectRawMtrHstryList(ComLogVO comLogVO) throws Exception {

		List<ComLogVO> resultList = comLogMapper.selectRawMtrHstryList(comLogVO);

		return resultList;
	}

	// 선별재고 변경 이력 조회
	@Override
	public List<ComLogVO> selectSortHstryList(ComLogVO comLogVO) throws Exception {
		List<ComLogVO> resultList = comLogMapper.selectSortHstryList(comLogVO);

		return resultList;
	}
	// 상품재고 변경 이력 조회
	@Override
	public List<ComLogVO> selectGdsHstryList(ComLogVO comLogVO) throws Exception {
		List<ComLogVO> resultList = comLogMapper.selectGdsHstryList(comLogVO);

		return resultList;
	}

}
