package com.at.apcss.pd.pcorm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcorm.mapper.BizPlanRegMapper;
import com.at.apcss.pd.pcorm.service.BizPlanRegService;
import com.at.apcss.pd.pcorm.vo.BizPlanRegFileVO;
import com.at.apcss.pd.pcorm.vo.BizPlanRegVO;

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
@Service("BizPlanRegService")
public class BizPlanRegServiceImpl extends BaseServiceImpl implements BizPlanRegService{

	@Autowired
	private BizPlanRegMapper bizPlanRegMapper;

	@Override
	public List<BizPlanRegVO> selectBizPlanRegList(BizPlanRegVO bizPlanRegVO) throws Exception {
		List<BizPlanRegVO> resultList = bizPlanRegMapper.selectBizPlanRegList(bizPlanRegVO);
		return resultList;
	}

	@Override
	public List<BizPlanRegVO> selectBizPlanRegFileList(BizPlanRegVO bizPlanRegVO) throws Exception {
		List<BizPlanRegVO> resultList = bizPlanRegMapper.selectBizPlanRegFileList(bizPlanRegVO);
		return resultList;
	}

	@Override
	public List<BizPlanRegVO> selectSrvy(BizPlanRegVO bizPlanRegVO) throws Exception {
		List<BizPlanRegVO> resultList = bizPlanRegMapper.selectSrvy(bizPlanRegVO);
		return resultList;
	}

	@Override
	public int insertBizPlanRegFile(BizPlanRegFileVO bizPlanRegFileVO) throws Exception {
		int saveCnt = bizPlanRegMapper.insertSbmsnDcmnt(bizPlanRegFileVO);
		bizPlanRegMapper.insertSbmsnDcmntFile(bizPlanRegFileVO);

		return saveCnt;
	}

	@Override
	public int insertSrvy(BizPlanRegVO bizPlanRegVO) throws Exception {
		int saveCnt = bizPlanRegMapper.insertSrvy(bizPlanRegVO);
		return saveCnt;
	}
}
