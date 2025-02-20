package com.at.apcss.am.clcln.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.clcln.mapper.ClclnWkrptMapper;
import com.at.apcss.am.clcln.service.ClclnWkrptService;
import com.at.apcss.am.clcln.vo.ClclnWkrptVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : ClclnUntprcServiceImpl.java
 * @Description : 주간 입고출고 현황 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2024.11.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.12  김호        최초 생성
 * </pre>
 */
@Service("clclnWkrptService")
public class ClclnWkrptServiceImpl extends BaseServiceImpl implements ClclnWkrptService {

	@Autowired
	private ClclnWkrptMapper clclnWkrptMapper;

	@Override
	public List<ClclnWkrptVO> selectWkrptList(ClclnWkrptVO clclnWkrptVO) throws Exception {
		List<ClclnWkrptVO> resultList = clclnWkrptMapper.selectWkrptList(clclnWkrptVO);
		return resultList;
	}

	@Override
	public List<ClclnWkrptVO> selectWkrptLastQnttList(ClclnWkrptVO clclnWkrptVO) throws Exception {
		List<ClclnWkrptVO> resultList = clclnWkrptMapper.selectWkrptLastQnttList(clclnWkrptVO);
		return resultList;
	}

}
