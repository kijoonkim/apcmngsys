package com.at.apcss.am.spmt.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.spmt.mapper.SlsMngMapper;
import com.at.apcss.am.spmt.service.SlsMngService;
import com.at.apcss.am.spmt.vo.SlsMngVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

@Service("slsMngService")
public class SlsMngServiceImpl extends BaseServiceImpl implements SlsMngService {

	@Autowired
	private SlsMngMapper slsMngMapper;

	@Override
	public List<SlsMngVO> selectSlsPrfmnc(SlsMngVO slsMngVO) throws Exception {
		
		List<SlsMngVO> resultList = slsMngMapper.selectSlsPrfmnc(slsMngVO);
		
		return resultList;
	}

	@Override
	public int deleteSlsPrfmnc(List<SlsMngVO> slsMngVO) throws Exception {
		int deleteCnt = 0;
		for(SlsMngVO vo: slsMngVO) {
			deleteCnt += slsMngMapper.deleteSlsPrfmnc(vo);			
		}
		
		
		return deleteCnt;
	}

	@Override
	public int updateSlsPrfmnc(List<SlsMngVO> slsMngVO) throws Exception {
		int updateCnt = 0;
		for(SlsMngVO vo : slsMngVO) {
			updateCnt += slsMngMapper.updateSlsPrfmnc(vo);
		}
		return updateCnt;
	}

	@Override
	public List<SlsMngVO> selectSlsUntprc(SlsMngVO slsMngVO) throws Exception {
		
		List<SlsMngVO> resultList = slsMngMapper.selectSlsUntprc(slsMngVO);
		
		return resultList;
	}

	@Override
	public int deleteSlsUntprc(SlsMngVO slsMngVO) throws Exception {
		int deleteCnt =0;
		deleteCnt = slsMngMapper.deleteSlsUntprc(slsMngVO);
		return deleteCnt;
	}


	@Override
	public int updateSlsUntprcReg(List<SlsMngVO> slsUntprcList) throws Exception {
		int resultCnt =0;
		for(SlsMngVO slsMngVO : slsUntprcList) {
			String gubun = slsMngVO.getGubun();
			if(gubun.equals("insert")){
				resultCnt = slsMngMapper.insertSlsUntprc(slsMngVO);
			}else if(gubun.equals("update")){
				resultCnt = slsMngMapper.updateSlsUntprc(slsMngVO);
			}
		}
		if(resultCnt < 0) {
			throw new EgovBizException();
		}
		return resultCnt;
	}

	@Override
	public List<SlsMngVO> selectSlsUntprcDtl(SlsMngVO slsMngVO) throws Exception {
		return slsMngMapper.selectSlsUntprcDtl(slsMngVO);
	}

	@Override
	public List<SlsMngVO> selectSlsCrtr(SlsMngVO slsMngVO) throws Exception {
		return slsMngMapper.selectSlsCrtr(slsMngVO);
	}

	@Override
	public List<SlsMngVO> selectSlsCrtrDtl(SlsMngVO slsMngVO) throws Exception {
		return slsMngMapper.selectSlsCrtrDtl(slsMngVO);
	}

	@Override
	public int insertSlsCrtr(List<SlsMngVO> slsCrtrList) throws Exception {
		int resultCnt = 0;
		for(SlsMngVO slsMngVO : slsCrtrList ){
			String gubun = slsMngVO.getGubun();
			if(gubun.equals("insert")){
				resultCnt = slsMngMapper.insertSlsCrtr(slsMngVO);
			}else if(gubun.equals("update")){
				resultCnt = slsMngMapper.updateSlsCrtr(slsMngVO);
			}
			if(resultCnt < 0){
				throw new EgovBizException();
			}
		}
		return resultCnt;
	}

	@Override
	public int insertSlsCrtrDtl(List<SlsMngVO> slsCrtrDtlList) throws Exception {
		int resultCnt = 0;
		for(SlsMngVO slsMngVO : slsCrtrDtlList){
			String gubun = slsMngVO.getGubun();
			if(gubun.equals("insert")){
				resultCnt = slsMngMapper.insertSlsCrtrDtl(slsMngVO);
			}else if(gubun.equals("update")){
				resultCnt = slsMngMapper.updateSlsCrtrDtl(slsMngVO);
			}
			if(resultCnt < 0){
				throw new EgovBizException();
			}
		}
		return resultCnt;
	}

	@Override
	public int deleteSlsCrtr(SlsMngVO slsMngVO) throws Exception {
		int delectCnt = 0;
		delectCnt = slsMngMapper.deleteSlsCrtr(slsMngVO);
		return delectCnt;
	}

	@Override
	public int deleteSlsCrtrDtl(SlsMngVO slsMngVO) throws Exception {
		int delectCnt = 0;
		delectCnt = slsMngMapper.deleteSlsCrtrDtl(slsMngVO);
		return delectCnt;
	}
}
