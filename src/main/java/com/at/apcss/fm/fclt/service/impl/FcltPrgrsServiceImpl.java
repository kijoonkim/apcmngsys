package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltPrgrsService;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltOperInfoServiceImpl.java
 * @Description : 운영자개요 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 임준완
 * @since 2024.07.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.23  임준완        최초 생성
 * </pre>
 */
@Service("fcltPrgrsService")
public class FcltPrgrsServiceImpl extends BaseServiceImpl implements FcltPrgrsService{

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltPrgrsVO selectPrgrs(FcltPrgrsVO fcltPrgrsVO) throws Exception {
		FcltPrgrsVO resultVO = fcltPrgrsMapper.selectPrgrs(fcltPrgrsVO);
		return resultVO;
	}

	@Override
	public List<FcltPrgrsVO> selectPrgrsList(FcltPrgrsVO fcltPrgrsVO) throws Exception {
		List<FcltPrgrsVO> resultList = fcltPrgrsMapper.selectPrgrsList(fcltPrgrsVO);
		return resultList;
	}

	@Override
	public int insertFcltPrgrs(FcltPrgrsVO fcltPrgrsVO) throws Exception {
		int insertCnt = fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		return insertCnt;
	}

}
