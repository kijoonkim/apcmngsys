package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.mapper.FcltSortMchnInfoMapper;
import com.at.apcss.fm.fclt.service.FcltSortMchnInfoService;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;
import com.at.apcss.fm.fclt.vo.FcltSortMchnInfoVO;


/**
 * @Class Name : FcltSortMchnInfoServiceImpl.java
 * @Description : 선별기운영의 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltSortMchnInfoService")
public class FcltSortMchnInfoServiceImpl extends BaseServiceImpl implements FcltSortMchnInfoService{

	@Autowired
	private FcltSortMchnInfoMapper fcltSortMchnInfoMapper;
	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltSortMchnInfoVO selectFcltSortMchnInfo(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception {

		FcltSortMchnInfoVO resultVO = fcltSortMchnInfoMapper.selectFcltSortMchnInfo(fcltSortMchnInfoVO);

		return resultVO;
	}

	@Override
	public FcltSortMchnInfoVO selectFcltSortMchnInfo(String msgKey) throws Exception {

		FcltSortMchnInfoVO fcltSortMchnInfoVO = new FcltSortMchnInfoVO();
		fcltSortMchnInfoVO.setMsgKey(msgKey);

		FcltSortMchnInfoVO resultVO = fcltSortMchnInfoMapper.selectFcltSortMchnInfo(fcltSortMchnInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltSortMchnInfoVO> selectFcltSortMchnInfoList(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception {

		List<FcltSortMchnInfoVO> resultList = fcltSortMchnInfoMapper.selectFcltSortMchnInfoList(fcltSortMchnInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltSortMchnInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}

	@Override
	public int multiSaveFcltSortMchnInfo(List<FcltSortMchnInfoVO> fcltSortMchnInfoVOList) throws Exception {
		int saveCnt = 0;
		String prgrsYn = "";
		FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
		for (FcltSortMchnInfoVO fcltSortMchnInfoVO : fcltSortMchnInfoVOList) {
			saveCnt += fcltSortMchnInfoMapper.insertFcltSortMchnInfo(fcltSortMchnInfoVO);
			prgrsYn = fcltSortMchnInfoVO.getPrgrsYn() == null ? "N" : fcltSortMchnInfoVO.getPrgrsYn();
			//진척도 변경
			fcltPrgrsVO.setApcCd(fcltSortMchnInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltSortMchnInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltSortMchnInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltSortMchnInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltSortMchnInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltSortMchnInfoVO.getSysLastChgPrgrmId());

			fcltPrgrsVO.setPrgrsSel("5");
			//임시저장
			String tmprStrgYn = fcltSortMchnInfoVO.getTmprStrgYn() == null ? "N" : fcltSortMchnInfoVO.getTmprStrgYn();
			if(tmprStrgYn.equals("Y")) {
				fcltPrgrsVO.setPrgrsVal("T");
			}else {
				fcltPrgrsVO.setPrgrsVal("Y");
			}
		}

		if(saveCnt == fcltSortMchnInfoVOList.size() && prgrsYn.equals("Y")) {
			fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		}
		return saveCnt;
	}


	@Override
	public int insertFcltSortMchnInfo(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception {

		int insertedCnt = fcltSortMchnInfoMapper.insertFcltSortMchnInfo(fcltSortMchnInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltSortMchnInfo(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception {

		int updatedCnt = fcltSortMchnInfoMapper.updateFcltSortMchnInfo(fcltSortMchnInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltSortMchnInfo(FcltSortMchnInfoVO fcltSortMchnInfoVO) throws Exception {

		int deletedCnt = fcltSortMchnInfoMapper.deleteFcltSortMchnInfo(fcltSortMchnInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltSortMchnInfoList(List<FcltSortMchnInfoVO> fcltSortMchnInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltSortMchnInfoVO fcltSortMchnInfoVO : fcltSortMchnInfoList ) {
			deletedCnt += fcltSortMchnInfoMapper.deleteFcltSortMchnInfo(fcltSortMchnInfoVO);
		}

		return deletedCnt;
	}

}
