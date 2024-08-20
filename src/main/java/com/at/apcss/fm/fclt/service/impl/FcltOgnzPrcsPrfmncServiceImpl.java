package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltOgnzPrcsPrfmncMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltOgnzPrcsPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltOgnzPrcsPrfmncVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltOgnzPrcsPrfmncServiceImpl.java
 * @Description : 유통조직처리실적 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
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
@Service("fcltOgnzPrcsPrfmncService")
public class FcltOgnzPrcsPrfmncServiceImpl extends BaseServiceImpl implements FcltOgnzPrcsPrfmncService{

	@Autowired
	private FcltOgnzPrcsPrfmncMapper fcltOgnzPrcsPrfmncMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltOgnzPrcsPrfmncVO selectFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception {

		FcltOgnzPrcsPrfmncVO resultVO = fcltOgnzPrcsPrfmncMapper.selectFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);

		return resultVO;
	}

	@Override
	public FcltOgnzPrcsPrfmncVO selectFcltOgnzPrcsPrfmnc(String msgKey) throws Exception {

		FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO = new FcltOgnzPrcsPrfmncVO();
		fcltOgnzPrcsPrfmncVO.setMsgKey(msgKey);

		FcltOgnzPrcsPrfmncVO resultVO = fcltOgnzPrcsPrfmncMapper.selectFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);

		return resultVO;
	}

	@Override
	public List<FcltOgnzPrcsPrfmncVO> selectFcltOgnzPrcsPrfmncList(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception {

		List<FcltOgnzPrcsPrfmncVO> resultList = fcltOgnzPrcsPrfmncMapper.selectFcltOgnzPrcsPrfmncList(fcltOgnzPrcsPrfmncVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (FcltOgnzPrcsPrfmncVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}

	@Override
	public int multiSaveFcltOgnzPrcsPrfmnc(List<FcltOgnzPrcsPrfmncVO> fcltOgnzPrcsPrfmncVOList) throws Exception {
		int saveCnt = 0;
		String prgrsYn = "";
		FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
		for (FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO : fcltOgnzPrcsPrfmncVOList) {
			saveCnt += fcltOgnzPrcsPrfmncMapper.insertFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);
			prgrsYn = fcltOgnzPrcsPrfmncVO.getPrgrsYn();
			//진척도 변경
			fcltPrgrsVO.setApcCd(fcltOgnzPrcsPrfmncVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltOgnzPrcsPrfmncVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltOgnzPrcsPrfmncVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltOgnzPrcsPrfmncVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltOgnzPrcsPrfmncVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltOgnzPrcsPrfmncVO.getSysLastChgPrgrmId());

			//임시저장
			String tmprStrgYn = fcltOgnzPrcsPrfmncVO.getTmprStrgYn();
			if(tmprStrgYn.equals("Y")) {
				fcltPrgrsVO.setPrgrs12("T");
			}else {
				fcltPrgrsVO.setPrgrs12("Y");
			}
		}

		if(saveCnt == fcltOgnzPrcsPrfmncVOList.size() && prgrsYn.equals("Y")) {
			fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		}

		return saveCnt;
	}

	@Override
	public int insertFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception {

		int insertedCnt = fcltOgnzPrcsPrfmncMapper.insertFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception {

		int updatedCnt = fcltOgnzPrcsPrfmncMapper.updateFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO) throws Exception {

		int deletedCnt = fcltOgnzPrcsPrfmncMapper.deleteFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltOgnzPrcsPrfmncList(List<FcltOgnzPrcsPrfmncVO> fcltOgnzPrcsPrfmncList) throws Exception {

		int deletedCnt = 0;

		for ( FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO : fcltOgnzPrcsPrfmncList ) {
			deletedCnt += fcltOgnzPrcsPrfmncMapper.deleteFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);
		}

		return deletedCnt;
	}

}
