package com.at.apcss.fm.fclt.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.fclt.mapper.FcltBizInfoMapper;
import com.at.apcss.fm.fclt.service.FcltBizInfoService;
import com.at.apcss.fm.fclt.vo.FcltItemVO;
import com.at.apcss.fm.fclt.vo.FcltBizInfoVO;


/**
 * @Class Name : FcltBizInfoServiceImpl.java
 * @Description : 지원사업 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 임준완
 * @since 2024.07.30
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.30  임준완        최초 생성
 * </pre>
 */
@Service("fcltBizInfoService")
public class FcltBizInfoServiceImpl extends BaseServiceImpl implements FcltBizInfoService{

	@Autowired
	private FcltBizInfoMapper fcltBizInfoMapper;

	@Override
	public FcltBizInfoVO selectFcltBizInfo(FcltBizInfoVO fcltBizInfoVO) throws Exception {

		FcltBizInfoVO resultVO = fcltBizInfoMapper.selectFcltBizInfo(fcltBizInfoVO);

		return resultVO;
	}

	@Override
	public FcltBizInfoVO selectFcltBizInfo(String msgKey) throws Exception {

		FcltBizInfoVO fcltBizInfoVO = new FcltBizInfoVO();
		fcltBizInfoVO.setMsgKey(msgKey);

		FcltBizInfoVO resultVO = fcltBizInfoMapper.selectFcltBizInfo(fcltBizInfoVO);


		return resultVO;
	}

	@Override
	public List<FcltBizInfoVO> selectFcltBizInfoList(FcltBizInfoVO fcltBizInfoVO) throws Exception {

		List<FcltBizInfoVO> resultList = fcltBizInfoMapper.selectFcltBizInfoList(fcltBizInfoVO);

		return resultList;
	}


	@Override
	public int insertFcltBizInfo(FcltBizInfoVO fcltBizInfoVO) throws Exception {

		int insertedCnt = fcltBizInfoMapper.insertFcltBizInfo(fcltBizInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateFcltBizInfo(FcltBizInfoVO fcltBizInfoVO) throws Exception {

		int updatedCnt = fcltBizInfoMapper.updateFcltBizInfo(fcltBizInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteFcltBizInfo(FcltBizInfoVO fcltBizInfoVO) throws Exception {

		int deletedCnt = fcltBizInfoMapper.deleteFcltBizInfo(fcltBizInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteFcltBizInfoList(List<FcltBizInfoVO> fcltBizInfoList) throws Exception {

		int deletedCnt = 0;

		for ( FcltBizInfoVO fcltBizInfoVO : fcltBizInfoList ) {
			deletedCnt += fcltBizInfoMapper.deleteFcltBizInfo(fcltBizInfoVO);
		}

		return deletedCnt;
	}

}
