package com.at.apcss.fm.fclt.service.impl;

import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltInfoMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltInfoService;
import com.at.apcss.fm.fclt.vo.FcltInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltInfoServiceImpl.java
 * @Description : 시설현황 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltInfoService")
public class FcltInfoServiceImpl extends BaseServiceImpl implements FcltInfoService{

	@Autowired
	private FcltInfoMapper fcltInfoMapper;
	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltInfoVO selectFcltInfo(FcltInfoVO fcltInfoVO) throws Exception {

		FcltInfoVO resultVO = fcltInfoMapper.selectFcltInfo(fcltInfoVO);

		return resultVO;
	}

	@Override
	public FcltInfoVO selectFcltInfo(String msgKey) throws Exception {

		FcltInfoVO fcltInfoVO = new FcltInfoVO();
		fcltInfoVO.setMsgKey(msgKey);

		FcltInfoVO resultVO = fcltInfoMapper.selectFcltInfo(fcltInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltInfoVO> selectFcltInfoList(FcltInfoVO fcltInfoVO) throws Exception {

		List<FcltInfoVO> resultList = fcltInfoMapper.selectFcltInfoList(fcltInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltInfo(FcltInfoVO fcltInfoVO) throws Exception {

		int insertedCnt = fcltInfoMapper.insertFcltInfo(fcltInfoVO);

		String prgrsYn = fcltInfoVO.getPrgrsYn();
		if(insertedCnt == 1 && prgrsYn.equals("Y")) {
			//진척도 변경
			FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
			fcltPrgrsVO.setApcCd(fcltInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltInfoVO.getSysLastChgPrgrmId());

			//임시저장
			String tmprStrgYn = fcltInfoVO.getTmprStrgYn();
			if(tmprStrgYn.equals("Y")) {
				fcltPrgrsVO.setPrgrs3("T");
			}else {
				fcltPrgrsVO.setPrgrs3("Y");
			}
			fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		}

		return insertedCnt;
	}

	@Override
	public int updateFcltInfo(FcltInfoVO fcltInfoVO) throws Exception {

		int updatedCnt = fcltInfoMapper.updateFcltInfo(fcltInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltInfo(FcltInfoVO fcltInfoVO) throws Exception {

		int deletedCnt = fcltInfoMapper.deleteFcltInfo(fcltInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltInfoList(List<FcltInfoVO> fcltInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltInfoVO fcltInfoVO : fcltInfoList ) {
			deletedCnt += fcltInfoMapper.deleteFcltInfo(fcltInfoVO);
		}

		return deletedCnt;
	}

}
