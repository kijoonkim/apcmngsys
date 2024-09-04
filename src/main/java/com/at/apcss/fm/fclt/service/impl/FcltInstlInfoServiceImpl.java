package com.at.apcss.fm.fclt.service.impl;

import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltInstlInfoMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltInstlInfoService;
import com.at.apcss.fm.fclt.vo.FcltInstlInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;

import egovframework.let.utl.fcc.service.EgovDateUtil;


/**
 * @Class Name : FcltInstlInfoServiceImpl.java
 * @Description : 시설설치보완 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltInstlInfoService")
public class FcltInstlInfoServiceImpl extends BaseServiceImpl implements FcltInstlInfoService{

	@Autowired
	private FcltInstlInfoMapper fcltInstlInfoMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltInstlInfoVO selectFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		FcltInstlInfoVO resultVO = fcltInstlInfoMapper.selectFcltInstlInfo(fcltInstlInfoVO);

		return resultVO;
	}

	@Override
	public FcltInstlInfoVO selectFcltInstlInfo(String msgKey) throws Exception {

		FcltInstlInfoVO fcltInstlInfoVO = new FcltInstlInfoVO();
		fcltInstlInfoVO.setMsgKey(msgKey);

		FcltInstlInfoVO resultVO = fcltInstlInfoMapper.selectFcltInstlInfo(fcltInstlInfoVO);

		return resultVO;
	}

	@Override
	public List<FcltInstlInfoVO> selectFcltInstlInfoList(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		List<FcltInstlInfoVO> resultList = fcltInstlInfoMapper.selectFcltInstlInfoList(fcltInstlInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltInstlInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		int insertedCnt = fcltInstlInfoMapper.insertFcltInstlInfo(fcltInstlInfoVO);

		String prgrsYn = fcltInstlInfoVO.getPrgrsYn() == null ? "N" : fcltInstlInfoVO.getPrgrsYn();
		if(insertedCnt == 1 && prgrsYn.equals("Y")) {
			//진척도 변경
			FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
			fcltPrgrsVO.setApcCd(fcltInstlInfoVO.getApcCd());
			//현재년도 구하기 진척도 조회를 위해 추가
			Calendar aCalendar = Calendar.getInstance();
			int year = aCalendar.get(Calendar.YEAR);
			fcltPrgrsVO.setCrtrYr(Integer.toString(year));
			fcltPrgrsVO.setSysFrstInptUserId(fcltInstlInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltInstlInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltInstlInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltInstlInfoVO.getSysLastChgPrgrmId());

			fcltPrgrsVO.setPrgrsSel("2");
			//임시저장
			String tmprStrgYn = fcltInstlInfoVO.getTmprStrgYn() == null ? "N" : fcltInstlInfoVO.getTmprStrgYn();
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
	public int updateFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		int updatedCnt = fcltInstlInfoMapper.updateFcltInstlInfo(fcltInstlInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltInstlInfo(FcltInstlInfoVO fcltInstlInfoVO) throws Exception {

		int deletedCnt = fcltInstlInfoMapper.deleteFcltInstlInfo(fcltInstlInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltInstlInfoList(List<FcltInstlInfoVO> fcltInstlInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltInstlInfoVO fcltInstlInfoVO : fcltInstlInfoList ) {
			deletedCnt += fcltInstlInfoMapper.deleteFcltInstlInfo(fcltInstlInfoVO);
		}

		return deletedCnt;
	}

}
