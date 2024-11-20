package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltPrgrsService;
import com.at.apcss.fm.fclt.vo.FcltAllRawDataVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltOperInfoServiceImpl.java
 * @Description : 운영자개요 서비스를 정의하기 위한 서비스 구현 클래스
 * @author ljw
 * @since 2024.07.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.23  ljw        최초 생성
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

	@Override
	public int updatePrgrsLast(FcltPrgrsVO fcltPrgrsVO) throws Exception {
		int updatedCnt = fcltPrgrsMapper.updatePrgrsLast(fcltPrgrsVO);
		return updatedCnt;
	}

	@Override
	public int multiSavePrgrsLast(List<FcltPrgrsVO> fcltPrgrsVOList) throws Exception {
		int saveCnt = 0;
		for (FcltPrgrsVO fcltPrgrsVO : fcltPrgrsVOList) {
			saveCnt += updatePrgrsLast(fcltPrgrsVO);
		}
		return saveCnt;
	}

	@Override
	public int updateAprv(FcltPrgrsVO fcltPrgrsVO) throws Exception {
		int updatedCnt = fcltPrgrsMapper.updateAprv(fcltPrgrsVO);
		return updatedCnt;
	}

	@Override
	public int multiSaveAprv(List<FcltPrgrsVO> fcltPrgrsVOList) throws Exception {
		int saveCnt = 0;
		for (FcltPrgrsVO fcltPrgrsVO : fcltPrgrsVOList) {
			saveCnt += updateAprv(fcltPrgrsVO);
		}
		return saveCnt;
	}

	@Override
	public List<FcltPrgrsVO> selectPrgrsRawData(FcltPrgrsVO fcltPrgrsVO) throws Exception {
		List<FcltPrgrsVO> resultList = fcltPrgrsMapper.selectPrgrsRawData(fcltPrgrsVO);
		return resultList;
	}

	@Override
	public List<FcltAllRawDataVO> selectAllRawData(FcltAllRawDataVO fcltAllRawDataVO) throws Exception {
		List<FcltAllRawDataVO> resultList = fcltPrgrsMapper.selectAllRawData(fcltAllRawDataVO);
		return resultList;
	}

}
