package com.at.apcss.pd.pcorm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.pcorm.mapper.PrdcrCrclOgnVluIdctrMngMapper;
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluIdctrMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluIdctrMngVO;


/**
 * @Class Name : BbsServiceImpl.java
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
@Service("prdcrCrclOgnVluIdctrMngService")
public class PrdcrCrclOgnVluIdctrMngServiceImpl extends BaseServiceImpl implements PrdcrCrclOgnVluIdctrMngService{

	@Autowired
	private PrdcrCrclOgnVluIdctrMngMapper prdcrCrclOgnVluIdctrMngMapper;

	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectUoList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectUoList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectUoTotList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectUoTotList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectIsoList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectIsoList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectIsoTotList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectIsoTotList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}

	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectFrmhsList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectFrmhsList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}

	@Override
	public int insertIsoTotList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		int saveCnt = prdcrCrclOgnVluIdctrMngMapper.insertIsoTotList(prdcrCrclOgnVluIdctrMngVO);
		return saveCnt;
	}

	@Override
	public int insertUoTotList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		int saveCnt = prdcrCrclOgnVluIdctrMngMapper.insertUoTotList(prdcrCrclOgnVluIdctrMngVO);
		return saveCnt;
	}

	@Override
	public int multiSaveIsoTotList(List<PrdcrCrclOgnVluIdctrMngVO> PrdcrCrclOgnVluIdctrMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnVluIdctrMngVO PrdcrCrclOgnVluIdctrMngVO : PrdcrCrclOgnVluIdctrMngVOList) {
			savedCnt += insertIsoTotList(PrdcrCrclOgnVluIdctrMngVO);

		}
		return savedCnt;
	}

	@Override
	public int multiSaveUoTotList(List<PrdcrCrclOgnVluIdctrMngVO> PrdcrCrclOgnVluIdctrMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrdcrCrclOgnVluIdctrMngVO PrdcrCrclOgnVluIdctrMngVO : PrdcrCrclOgnVluIdctrMngVOList) {
			savedCnt += insertUoTotList(PrdcrCrclOgnVluIdctrMngVO);

		}
		return savedCnt;
	}
}
