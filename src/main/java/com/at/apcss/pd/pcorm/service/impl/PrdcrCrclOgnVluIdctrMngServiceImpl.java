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

	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectRawDataList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectRawDataList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}
	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectRawDataIsoList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectRawDataIsoList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}



	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectUoIcptRsnList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectUoIcptRsnList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}
	@Override
	public List<PrdcrCrclOgnVluIdctrMngVO> selectIsoIcptRsnList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = prdcrCrclOgnVluIdctrMngMapper.selectIsoIcptRsnList(prdcrCrclOgnVluIdctrMngVO);
		return resultList;
	}


	@Override
	public int multiSaveUoIcptRsnList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception {
		int savedCnt = 0;
		String yrVal = prdcrCrclOgnVluIdctrMngVO.getYr();

		String prgrmId = prdcrCrclOgnVluIdctrMngVO.getSysFrstInptPrgrmId();
		String userId = prdcrCrclOgnVluIdctrMngVO.getSysFrstInptUserId();

		if (yrVal != null && !yrVal.equals("")) {
			//통합조직 일괄 조회 후 저장
			List<PrdcrCrclOgnVluIdctrMngVO> resultUoList = selectUoIcptRsnList(prdcrCrclOgnVluIdctrMngVO);
			for (PrdcrCrclOgnVluIdctrMngVO uoVO : resultUoList) {

				uoVO.setSysFrstInptPrgrmId(prgrmId);
				uoVO.setSysFrstInptUserId(userId);
				uoVO.setSysLastChgPrgrmId(prgrmId);
				uoVO.setSysLastChgUserId(userId);

				int insertChk = insertUoTotList(uoVO);

				if(insertChk == 1) {
					savedCnt += 1;
					//각 통합조직으로 출자출하조직 선정여부 조회 후 저장
					List<PrdcrCrclOgnVluIdctrMngVO> resultIsoList = selectIsoIcptRsnList(uoVO);
					for (PrdcrCrclOgnVluIdctrMngVO isoVO : resultIsoList) {

						isoVO.setSysFrstInptPrgrmId(prgrmId);
						isoVO.setSysFrstInptUserId(userId);
						isoVO.setSysLastChgPrgrmId(prgrmId);
						isoVO.setSysLastChgUserId(userId);

						savedCnt += insertIsoTotList(isoVO);
					}
				}

			}
		}
		return savedCnt;
	}

}
