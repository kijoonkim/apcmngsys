package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltDtaMngInfoMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltDtaMngInfoService;
import com.at.apcss.fm.fclt.vo.FcltDataMngVO;
import com.at.apcss.fm.fclt.vo.FcltDtaMngInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltDtaMngInfoServiceImpl.java
 * @Description : 스마트데이터화 서비스를 정의하기 위한 서비스 구현 클래스
 * @author
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("fcltDtaMngInfoService")
public class FcltDtaMngInfoServiceImpl extends BaseServiceImpl implements FcltDtaMngInfoService{

	@Autowired
	private FcltDtaMngInfoMapper fcltDtaMngInfoMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltDtaMngInfoVO selectFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		FcltDtaMngInfoVO resultVO = fcltDtaMngInfoMapper.selectFcltDtaMngInfo(fcltDtaMngInfoVO);

		return resultVO;
	}

	@Override
	public FcltDtaMngInfoVO selectFcltDtaMngInfo(String msgKey) throws Exception {

		FcltDtaMngInfoVO fcltDtaMngInfoVO = new FcltDtaMngInfoVO();
		fcltDtaMngInfoVO.setMsgKey(msgKey);

		FcltDtaMngInfoVO resultVO = fcltDtaMngInfoMapper.selectFcltDtaMngInfo(fcltDtaMngInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltDtaMngInfoVO> selectFcltDtaMngInfoList(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		List<FcltDtaMngInfoVO> resultList = fcltDtaMngInfoMapper.selectFcltDtaMngInfoList(fcltDtaMngInfoVO);

		return resultList;
	}


	@Override
	public int insertFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		int insertedCnt = fcltDtaMngInfoMapper.insertFcltDtaMngInfo(fcltDtaMngInfoVO);

		List<FcltDataMngVO> fcltDataMngVOList = fcltDtaMngInfoVO.getFcltDataMngVOList();

		for (FcltDataMngVO fcltDataMngVO : fcltDataMngVOList) {
			fcltDataMngVO.setSysFrstInptUserId(fcltDtaMngInfoVO.getSysFrstInptUserId());
			fcltDataMngVO.setSysFrstInptPrgrmId(fcltDtaMngInfoVO.getSysFrstInptPrgrmId());
			fcltDataMngVO.setSysLastChgUserId(fcltDtaMngInfoVO.getSysLastChgUserId());
			fcltDataMngVO.setSysLastChgPrgrmId(fcltDtaMngInfoVO.getSysLastChgPrgrmId());
		}

		boolean subChk = false;
		int subinsertedCnt = 0;
		int arrSize = fcltDtaMngInfoVO.getFcltDataMngVOList().size();

		if(arrSize > 0) {
			subinsertedCnt = multiSaveFcltDataMng(fcltDataMngVOList);
		}

		subChk = subinsertedCnt == arrSize;

		String prgrsYn = fcltDtaMngInfoVO.getPrgrsYn() == null ? "N" : fcltDtaMngInfoVO.getPrgrsYn();

		if(insertedCnt == 1 && prgrsYn.equals("Y") && subChk == true) {
			//진척도 변경
			FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
			fcltPrgrsVO.setApcCd(fcltDtaMngInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltDtaMngInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltDtaMngInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltDtaMngInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltDtaMngInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltDtaMngInfoVO.getSysLastChgPrgrmId());
			fcltPrgrsVO.setPrgrsSel("10");
			//임시저장
			String tmprStrgYn = fcltDtaMngInfoVO.getTmprStrgYn() == null ? "N" : fcltDtaMngInfoVO.getTmprStrgYn();
			if(tmprStrgYn.equals("Y")) {
				fcltPrgrsVO.setPrgrsVal("T");
			}else {
				fcltPrgrsVO.setPrgrsVal("Y");
			}
			fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		}
		return insertedCnt;
	}

	@Override
	public int updateFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		int updatedCnt = fcltDtaMngInfoMapper.updateFcltDtaMngInfo(fcltDtaMngInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		int deletedCnt = fcltDtaMngInfoMapper.deleteFcltDtaMngInfo(fcltDtaMngInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltDtaMngInfoList(List<FcltDtaMngInfoVO> fcltDtaMngInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltDtaMngInfoVO fcltDtaMngInfoVO : fcltDtaMngInfoList ) {
			deletedCnt += fcltDtaMngInfoMapper.deleteFcltDtaMngInfo(fcltDtaMngInfoVO);
		}

		return deletedCnt;
	}

	/* 데이터 관리 항목 */

	@Override
	public List<FcltDataMngVO> selectFcltDataMngList(FcltDtaMngInfoVO fcltDtaMngInfoVO) throws Exception {

		List<FcltDataMngVO> resultList = fcltDtaMngInfoMapper.selectFcltDataMngList(fcltDtaMngInfoVO);

		return resultList;
	}


	@Override
	public int updateFcltDataMng(FcltDataMngVO fcltDataMngVO) throws Exception {

		int updatedCnt = fcltDtaMngInfoMapper.updateFcltDataMng(fcltDataMngVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltDataMng(FcltDataMngVO fcltDataMngVO) throws Exception {

		int deletedCnt = fcltDtaMngInfoMapper.deleteFcltDataMng(fcltDataMngVO);

		return deletedCnt;
	}

	@Override
	public int insertFcltDataMng(FcltDataMngVO fcltDataMngVO) throws Exception {

		int insertedCnt = fcltDtaMngInfoMapper.insertFcltDataMng(fcltDataMngVO);

		return insertedCnt;
	}

	@Override
	public int multiSaveFcltDataMng(List<FcltDataMngVO> fcltDataMngVOList) throws Exception {
		int saveCnt = 0;
		for (FcltDataMngVO fcltDataMngVO : fcltDataMngVOList) {
			saveCnt += fcltDtaMngInfoMapper.insertFcltDataMng(fcltDataMngVO);
		}

		return saveCnt;
	}

}
