package com.at.apcss.pd.pcm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

import com.at.apcss.pd.pcm.service.PrfmncChckMngService;
import com.at.apcss.pd.pcm.vo.PrfmncChckMngVO;
import com.at.apcss.pd.pcm.mapper.PrfmncChckMngMapper;


/**
 * @Class Name : PrfmncChckMngServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author ljw
 * @since 2024.10.24
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자         수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.24  ljw         최초 생성
 * </pre>
 */
@Service("PrfmncChckMngService")
public class PrfmncChckMngServiceImpl extends BaseServiceImpl implements PrfmncChckMngService{

	@Autowired
	private PrfmncChckMngMapper PrfmncChckMngMapper;

	@Override
	public PrfmncChckMngVO selectUoAprv(PrfmncChckMngVO PrfmncChckMngVO) throws Exception {
		PrfmncChckMngVO result = PrfmncChckMngMapper.selectUoAprv(PrfmncChckMngVO);
		return result;
	}

	@Override
	public List<PrfmncChckMngVO> selectUoAprvList(PrfmncChckMngVO PrfmncChckMngVO) throws Exception {
		List<PrfmncChckMngVO> resultList = PrfmncChckMngMapper.selectUoAprvList(PrfmncChckMngVO);
		return resultList;
	}

	@Override
	public List<PrfmncChckMngVO> selectPrfmncChckMngList(PrfmncChckMngVO PrfmncChckMngVO) throws Exception {

		List<PrfmncChckMngVO> resultList = PrfmncChckMngMapper.selectPrfmncChckMngList(PrfmncChckMngVO);

		return resultList;
	}

	@Override
	public int insertPrfmncChckMng(PrfmncChckMngVO PrfmncChckMngVO) throws Exception {
		int insertedCnt = PrfmncChckMngMapper.insertPrfmncChckMng(PrfmncChckMngVO);
		return insertedCnt;
	}

	@Override
	public int multiSavePrfmncChckMngList(List<PrfmncChckMngVO> PrfmncChckMngVOList) throws Exception {
		int savedCnt = 0;
		for (PrfmncChckMngVO prfmncChckMngVO : PrfmncChckMngVOList) {
			savedCnt += insertPrfmncChckMng(prfmncChckMngVO);
		}
		return savedCnt;
	}

}
