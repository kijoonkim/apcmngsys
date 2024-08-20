package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.mapper.FcltSortMchnOperInfoMapper;
import com.at.apcss.fm.fclt.service.FcltSortMchnOperInfoService;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;
import com.at.apcss.fm.fclt.vo.FcltSortMchnOperInfoVO;


/**
 * @Class Name : FcltSortMchnOperInfoServiceImpl.java
 * @Description : 선별기운영기간의 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltSortMchnOperInfoService")
public class FcltSortMchnOperInfoServiceImpl extends BaseServiceImpl implements FcltSortMchnOperInfoService{

	@Autowired
	private FcltSortMchnOperInfoMapper fcltSortMchnOperInfoMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltSortMchnOperInfoVO selectFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception {

		FcltSortMchnOperInfoVO resultVO = fcltSortMchnOperInfoMapper.selectFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);

		return resultVO;
	}

	@Override
	public FcltSortMchnOperInfoVO selectFcltSortMchnOperInfo(String msgKey) throws Exception {

		FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO = new FcltSortMchnOperInfoVO();
		fcltSortMchnOperInfoVO.setMsgKey(msgKey);

		FcltSortMchnOperInfoVO resultVO = fcltSortMchnOperInfoMapper.selectFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltSortMchnOperInfoVO> selectFcltSortMchnOperInfoList(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception {

		List<FcltSortMchnOperInfoVO> resultList = fcltSortMchnOperInfoMapper.selectFcltSortMchnOperInfoList(fcltSortMchnOperInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltSortMchnOperInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}

	@Override
	public int multiSaveFcltSortMchnOperInfo(List<FcltSortMchnOperInfoVO> fcltSortMchnOperInfoVOList) throws Exception {
		int saveCnt = 0;
		String prgrsYn = "";
		FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
		for (FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO : fcltSortMchnOperInfoVOList) {
			saveCnt += fcltSortMchnOperInfoMapper.insertFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);
			prgrsYn = fcltSortMchnOperInfoVO.getPrgrsYn();
			//진척도 변경
			fcltPrgrsVO.setApcCd(fcltSortMchnOperInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltSortMchnOperInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltSortMchnOperInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltSortMchnOperInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltSortMchnOperInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltSortMchnOperInfoVO.getSysLastChgPrgrmId());

			//임시저장
			String tmprStrgYn = fcltSortMchnOperInfoVO.getTmprStrgYn();
			if(tmprStrgYn.equals("Y")) {
				fcltPrgrsVO.setPrgrs6("T");
			}else {
				fcltPrgrsVO.setPrgrs6("Y");
			}
		}

		if(saveCnt == fcltSortMchnOperInfoVOList.size() && prgrsYn.equals("Y")) {
			fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		}

		return saveCnt;
	}

	@Override
	public int insertFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception {

		int insertedCnt = fcltSortMchnOperInfoMapper.insertFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception {

		int updatedCnt = fcltSortMchnOperInfoMapper.updateFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO) throws Exception {

		int deletedCnt = fcltSortMchnOperInfoMapper.deleteFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltSortMchnOperInfoList(List<FcltSortMchnOperInfoVO> fcltSortMchnOperInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO : fcltSortMchnOperInfoList ) {
			deletedCnt += fcltSortMchnOperInfoMapper.deleteFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);
		}

		return deletedCnt;
	}

}
