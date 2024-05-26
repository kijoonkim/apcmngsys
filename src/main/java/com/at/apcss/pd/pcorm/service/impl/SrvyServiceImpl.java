package com.at.apcss.pd.pcorm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcorm.mapper.SrvyMapper;
import com.at.apcss.pd.pcorm.service.SrvyService;
import com.at.apcss.pd.pcorm.vo.SrvyVO;

/**
 * @Class Name : BizPlanRegServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Service("SrvyService")
public class SrvyServiceImpl extends BaseServiceImpl implements SrvyService{

	@Autowired
	private SrvyMapper srvyMapper;

	@Override
	public List<SrvyVO> selectSrvyList(SrvyVO srvyVO) throws Exception {
		List<SrvyVO> resultList = srvyMapper.selectSrvyList(srvyVO);
		return resultList;
	}

}
