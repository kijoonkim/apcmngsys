package com.at.apcss.am.pckg.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.pckg.mapper.GdsCdMapper;
import com.at.apcss.am.pckg.service.GdsCdService;
import com.at.apcss.am.pckg.vo.GdsCdVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : GdsCdSercviceImpl.java
 * @Description : 상품코드 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김현호
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  김현호        최초 생성
 * </pre>
 */
@Service("gdsCdService")
public class GdsCdServiceImpl extends BaseServiceImpl implements GdsCdService {
	@Autowired
	private GdsCdMapper gdsCdMapper;
	
	@Override
	public List<GdsCdVO> selectGdsCdList(GdsCdVO gdsCdVO) throws Exception {

		List<GdsCdVO> resultList = gdsCdMapper.selectGdsCdList(gdsCdVO);

		return resultList;
	}
}
