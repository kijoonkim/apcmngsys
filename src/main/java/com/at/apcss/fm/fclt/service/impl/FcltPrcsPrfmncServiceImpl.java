package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltPrcsPrfmncMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltPrcsPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltOgnzPrcsPrfmncVO;
import com.at.apcss.fm.fclt.vo.FcltPrcsPrfmncVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltPrcsPrfmncServiceImpl.java
 * @Description : 산지유통품목처리실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("fcltPrcsPrfmncService")
public class FcltPrcsPrfmncServiceImpl extends BaseServiceImpl implements FcltPrcsPrfmncService{

	@Autowired
	private FcltPrcsPrfmncMapper fcltPrcsPrfmncMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltPrcsPrfmncVO selectFcltPrcsPrfmnc(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		return fcltPrcsPrfmncMapper.selectFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
	}

	@Override
	public FcltPrcsPrfmncVO selectFcltPrcsPrfmnc(String msgKey) throws Exception {

		FcltPrcsPrfmncVO fcltPrcsPrfmncVO = new FcltPrcsPrfmncVO();

		return fcltPrcsPrfmncMapper.selectFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
	}

	@Override
	public List<FcltPrcsPrfmncVO> selectFcltPrcsPrfmncList(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		return fcltPrcsPrfmncMapper.selectFcltPrcsPrfmncList(fcltPrcsPrfmncVO);
	}

	@Override
	public int multiSaveFcltPrcsPrfmnc(List<FcltPrcsPrfmncVO> fcltPrcsPrfmncVOList) throws Exception {
		int saveCnt = 0;
		String prgrsYn = "";
		FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
		for (FcltPrcsPrfmncVO fcltPrcsPrfmncVO : fcltPrcsPrfmncVOList) {
			saveCnt += fcltPrcsPrfmncMapper.insertFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
			prgrsYn = fcltPrcsPrfmncVO.getPrgrsYn() == null ? "N" : fcltPrcsPrfmncVO.getPrgrsYn();
			//진척도 변경
			fcltPrgrsVO.setApcCd(fcltPrcsPrfmncVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltPrcsPrfmncVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltPrcsPrfmncVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltPrcsPrfmncVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltPrcsPrfmncVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltPrcsPrfmncVO.getSysLastChgPrgrmId());

			fcltPrgrsVO.setPrgrsSel("13");
			//임시저장
			String tmprStrgYn = fcltPrcsPrfmncVO.getTmprStrgYn() == null ? "N" : fcltPrcsPrfmncVO.getTmprStrgYn();
			if(tmprStrgYn.equals("Y")) {
				fcltPrgrsVO.setPrgrsVal("T");
			}else {
				fcltPrgrsVO.setPrgrsVal("Y");
			}
		}

		if (saveCnt == fcltPrcsPrfmncVOList.size() && prgrsYn.equals("Y")) {
			fcltPrgrsMapper.insertFcltPrgrs(fcltPrgrsVO);
		}

		return saveCnt;
	}

	@Override
	public int insertFcltPrcsPrfmnc(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		return fcltPrcsPrfmncMapper.insertFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
	}

	@Override
	public int updateFcltPrcsPrfmnc(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		return fcltPrcsPrfmncMapper.updateFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
	}

	@Override
	public int deleteFcltPrcsPrfmnc(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		return fcltPrcsPrfmncMapper.deleteFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
	}

	@Override
	public int deleteFcltPrcsPrfmncList(List<FcltPrcsPrfmncVO> fcltPrcsPrfmncList) throws Exception {

		int deletedCnt = 0;

		for ( FcltPrcsPrfmncVO fcltPrcsPrfmncVO : fcltPrcsPrfmncList ) {
			deletedCnt += fcltPrcsPrfmncMapper.deleteFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
		}

		return deletedCnt;
	}

	@Override
	public List<FcltPrcsPrfmncVO> selectFcltPrcsPrfmncRawDataList(FcltPrcsPrfmncVO fcltPrcsPrfmncVO) throws Exception {

		return fcltPrcsPrfmncMapper.selectFcltPrcsPrfmncRawDataList(fcltPrcsPrfmncVO);
	}

}
