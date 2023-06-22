package com.at.apcss.co.log.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

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

	@Override
	public List<ComLogVO> selectCntnHstryList(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComLogVO> selectMenuHstryList(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComLogVO> selectTrsmHstryList(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComLogVO> selectBatchHstryList(ComLogVO comLogVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
