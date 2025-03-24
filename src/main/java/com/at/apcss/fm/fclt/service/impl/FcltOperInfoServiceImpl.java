package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltOperInfoMapper;
import com.at.apcss.fm.fclt.mapper.FcltPrgrsMapper;
import com.at.apcss.fm.fclt.service.FcltOperInfoService;
import com.at.apcss.fm.fclt.vo.FcltApcVO;
import com.at.apcss.fm.fclt.vo.FcltItemVO;
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;
import org.springframework.util.StringUtils;


/**
 * @Class Name : FcltOperInfoServiceImpl.java
 * @Description : 운영자개요 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
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
@Service("fcltOperInfoService")
public class FcltOperInfoServiceImpl extends BaseServiceImpl implements FcltOperInfoService{

	@Autowired
	private FcltOperInfoMapper fcltOperInfoMapper;

	@Autowired
	private FcltPrgrsMapper fcltPrgrsMapper;

	@Override
	public FcltOperInfoVO selectFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		FcltOperInfoVO resultVO = fcltOperInfoMapper.selectFcltOperInfo(fcltOperInfoVO);

		return resultVO;
	}

	@Override
	public FcltOperInfoVO selectFcltOperInfo(String msgKey) throws Exception {

		FcltOperInfoVO fcltOperInfoVO = new FcltOperInfoVO();
		fcltOperInfoVO.setMsgKey(msgKey);

		FcltOperInfoVO resultVO = fcltOperInfoMapper.selectFcltOperInfo(fcltOperInfoVO);


		return resultVO;
	}

	@Override
	public List<FcltOperInfoVO> selectFcltOperInfoList(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		List<FcltOperInfoVO> resultList = fcltOperInfoMapper.selectFcltOperInfoList(fcltOperInfoVO);
		for (FcltOperInfoVO vo : resultList ) {
			FcltItemVO fcltItemVO = new FcltItemVO();
			fcltItemVO.setApcCd(fcltOperInfoVO.getApcCd());
			fcltItemVO.setCrtrYr(fcltOperInfoVO.getCrtrYr());
			vo.setItemList(fcltOperInfoMapper.selectFcltOperInfoItemList(fcltItemVO));
		}
		return resultList;
	}


	@Override
	public int insertFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		int insertedCnt = fcltOperInfoMapper.insertFcltOperInfo(fcltOperInfoVO);
		int itemInsertCnt = 0;
		//품목리스트 등록
		for (FcltItemVO fcltItemVO : fcltOperInfoVO.getItemList()) {
			fcltItemVO.setCrtrYr(fcltOperInfoVO.getCrtrYr());
			fcltItemVO.setApcCd(fcltOperInfoVO.getApcCd());
			fcltItemVO.setSysFrstInptUserId(fcltOperInfoVO.getSysFrstInptUserId());
			fcltItemVO.setSysFrstInptPrgrmId(fcltOperInfoVO.getSysFrstInptPrgrmId());
			fcltItemVO.setSysLastChgUserId(fcltOperInfoVO.getSysLastChgUserId());
			fcltItemVO.setSysLastChgPrgrmId(fcltOperInfoVO.getSysLastChgPrgrmId());

			List<FcltItemVO> selectList = fcltOperInfoMapper.selectFcltOperInfoItemList(fcltItemVO);

			boolean isDuplicate = false;

			if (selectList != null && selectList.size() >0 ) {
				for (FcltItemVO vo : selectList) {
					if (StringUtils.hasText(vo.getItemCd()) && vo.getItemCd().equals(fcltItemVO.getItemCd()) && vo.getOgnzSeCd().equals(fcltItemVO.getOgnzSeCd())) {
						isDuplicate = true;
						break;
					}
				}
			}

			if (!isDuplicate) {
				itemInsertCnt += fcltOperInfoMapper.insertFcltOperInfoItem (fcltItemVO);
			}

		}

		String prgrsYn = fcltOperInfoVO.getPrgrsYn() == null ? "N" : fcltOperInfoVO.getPrgrsYn();
		if(insertedCnt == 1 && prgrsYn.equals("Y")) {
			//진척도 변경
			FcltPrgrsVO fcltPrgrsVO = new FcltPrgrsVO();
			fcltPrgrsVO.setApcCd(fcltOperInfoVO.getApcCd());
			fcltPrgrsVO.setCrtrYr(fcltOperInfoVO.getCrtrYr());
			fcltPrgrsVO.setSysFrstInptUserId(fcltOperInfoVO.getSysFrstInptUserId());
			fcltPrgrsVO.setSysFrstInptPrgrmId(fcltOperInfoVO.getSysFrstInptPrgrmId());
			fcltPrgrsVO.setSysLastChgUserId(fcltOperInfoVO.getSysLastChgUserId());
			fcltPrgrsVO.setSysLastChgPrgrmId(fcltOperInfoVO.getSysLastChgPrgrmId());

			fcltPrgrsVO.setPrgrsSel("1");
			//임시저장
			String tmprStrgYn = fcltOperInfoVO.getTmprStrgYn() == null ? "N" : fcltOperInfoVO.getTmprStrgYn();
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
	public int updateFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		int updatedCnt = fcltOperInfoMapper.updateFcltOperInfo(fcltOperInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltOperInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {

		int deletedCnt = fcltOperInfoMapper.deleteFcltOperInfo(fcltOperInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltOperInfoList(List<FcltOperInfoVO> fcltOperInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltOperInfoVO fcltOperInfoVO : fcltOperInfoList ) {
			deletedCnt += fcltOperInfoMapper.deleteFcltOperInfo(fcltOperInfoVO);
		}

		return deletedCnt;
	}

	@Override
	public List<FcltItemVO> selectFcltOperInfoItemList(FcltItemVO fcltItemVO) throws Exception {

		List<FcltItemVO> resultList = fcltOperInfoMapper.selectFcltOperInfoItemList(fcltItemVO);

		return resultList;
	}

	@Override
	public int deleteItem(FcltItemVO fcltItemVO) throws Exception {
		int deletedCnt = fcltOperInfoMapper.deleteItem(fcltItemVO);
		return deletedCnt;
	}

	@Override
	public List<FcltApcVO> selectApcList(FcltApcVO fcltApcVO) throws Exception {

		List<FcltApcVO> resultList = fcltOperInfoMapper.selectApcList(fcltApcVO);
		return resultList;
	}

	@Override
	public List<FcltApcVO> selectFcltOperInfoRawDataList(FcltApcVO fcltApcVO) throws Exception {

		List<FcltApcVO> resultList = fcltOperInfoMapper.selectFcltOperInfoRawDataList(fcltApcVO);
		return resultList;
	}

	@Override
	public List<FcltApcVO> selectUserApcList(FcltApcVO fcltApcVO) throws Exception {

		List<FcltApcVO> resultList = fcltOperInfoMapper.selectUserApcList(fcltApcVO);
		return resultList;
	}

	@Override
	public FcltOperInfoVO selectUserInfo(FcltOperInfoVO fcltOperInfoVO) throws Exception {
		FcltOperInfoVO resultVO = fcltOperInfoMapper.selectUserInfo(fcltOperInfoVO);
		return resultVO;
	}

}
