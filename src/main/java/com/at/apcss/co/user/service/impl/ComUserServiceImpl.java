package com.at.apcss.co.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.user.mapper.ComUserMapper;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;

/**
 * 사용자정보에 대한 서비스 구현 클래스를 정의한다
 * @author 신정철
 * @since 2023.05.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자          수정내용
 *  ----------  ----------    ---------------------------
 *  2023.05.16  신정철          최초 생성
 *
 * </pre>
 */
@Service("comUserService")
public class ComUserServiceImpl implements ComUserService {

	@Autowired
	private ComUserMapper comUserMapper;
	
	@Override
	public ComUserVO selectComUser(ComUserVO comUserVO) {

		ComUserVO comUserRsltVO = comUserMapper.selectComUser(comUserVO);
		return comUserRsltVO;
	}

	@Override
	public ComUserVO selectComUser(String userId) {
		
		ComUserVO comUserVO = new ComUserVO();
		comUserVO.setUserId(userId);
		
		return selectComUser(comUserVO);
	}

	@Override
	public List<ComUserVO> selectComUserList(ComUserVO comUserVO) {
		
		List<ComUserVO> resultList = comUserMapper.selectComUserList(comUserVO);
		return resultList;
	}

	@Override
	public int updateComUser(ComUserVO comUserVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComUserAprv(ComUserVO comUserVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
