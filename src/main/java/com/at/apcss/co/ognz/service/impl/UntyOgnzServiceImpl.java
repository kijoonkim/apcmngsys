package com.at.apcss.co.ognz.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.ognz.mapper.UntyOgnzMapper;
import com.at.apcss.co.ognz.service.UntyOgnzService;
import com.at.apcss.co.ognz.vo.UntyOgnzVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : UntyOgnzServiceImpl.java
 * @Description : 통합조직 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2024.07.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.22  신정철        최초 생성
 * </pre>
 */
@Service("untyOgnzService")
public class UntyOgnzServiceImpl extends BaseServiceImpl implements UntyOgnzService {

	@Autowired
	private UntyOgnzMapper untyOgnzMapper;
	
	
	@Override
	public UntyOgnzVO selectUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception {
		
		UntyOgnzVO resultVO = untyOgnzMapper.selectUntyOgnz(untyOgnzVO);
		
		return resultVO;
	}

	@Override
	public List<UntyOgnzVO> selectUntyOgnzList(UntyOgnzVO untyOgnzVO) throws Exception {
		
		List<UntyOgnzVO> resultList = untyOgnzMapper.selectUntyOgnzList(untyOgnzVO);
		
		return resultList;
	}

	@Override
	public List<UntyOgnzVO> selectUntyOgnzTreeList(UntyOgnzVO untyOgnzVO) throws Exception {
		
		List<UntyOgnzVO> resultTreeList = untyOgnzMapper.selectUntyOgnzTreeList(untyOgnzVO);
		
		return resultTreeList;
	}

	@Override
	public List<UntyOgnzVO> selectUntyOgnzApcList(UntyOgnzVO untyOgnzVO) throws Exception {

		List<UntyOgnzVO> resultTreeList = untyOgnzMapper.selectUntyOgnzApcList(untyOgnzVO);
		
		return resultTreeList;
	}

	
	@Override
	public HashMap<String, Object> insertUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception {
		
		UntyOgnzVO newUntyOgnz = untyOgnzMapper.selectNewUntyOgnzId(untyOgnzVO);
		
		if (newUntyOgnz == null || !StringUtils.hasText(newUntyOgnz.getUntyOgnzId())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "신규통합조직ID");
		}
		
		untyOgnzVO.setUntyOgnzId(newUntyOgnz.getUntyOgnzId());
		untyOgnzMapper.insertUntyOgnz(untyOgnzVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> updateUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception {
		
		untyOgnzMapper.updateUntyOgnz(untyOgnzVO);
		return null;
	}

	@Override
	public HashMap<String, Object> deleteUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception {
		
		untyOgnzMapper.deleteUntyOgnz(untyOgnzVO);
		return null;
	}


}
