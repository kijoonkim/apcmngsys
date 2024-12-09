package com.at.apcss.am.fclt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.fclt.service.FcltService;
import com.at.apcss.am.fclt.vo.FcltVO;
import com.at.apcss.am.fclt.mapper.FcltMapper;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
/**
 * @Class Name : FcltServiceImpl.java
 * @Description : 창고현황 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2024.12.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.12.03  김 호        최초 생성
 * </pre>
 */
@Service("fcltService")
public class FcltServiceImpl extends BaseServiceImpl implements FcltService {

	@Autowired
	private FcltMapper fcltMapper;

	@Override
	public List<FcltVO> selectWarehouseCurSiList(FcltVO FcltVO) throws Exception {
		List<FcltVO> resultList = fcltMapper.selectWarehouseCurSiList(FcltVO);
		return resultList;
	}

}
