package com.at.apcss.fm.mngmst.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.mngmst.mapper.MngmstBscInfoMapper;
import com.at.apcss.fm.mngmst.service.MngmstBscInfoService;
import com.at.apcss.fm.mngmst.vo.MngmstBscInfoVO;


/**
 * @Class Name : MngmstBscInfoServiceImpl.java
 * @Description : 경영체정보 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("mngmstBscInfoService")
public class MngmstBscInfoServiceImpl implements MngmstBscInfoService{

	@Autowired
	private MngmstBscInfoMapper mngmstBscInfoMapper;

	@Override
	public MngmstBscInfoVO selectMngmstBscInfo(MngmstBscInfoVO mngmstBscInfoVO) throws Exception {

		MngmstBscInfoVO resultVO = mngmstBscInfoMapper.selectMngmstBscInfo(mngmstBscInfoVO);

		return resultVO;
	}

	@Override
	public MngmstBscInfoVO selectMngmstBscInfo(String msgKey) throws Exception {

		MngmstBscInfoVO mngmstBscInfoVO = new MngmstBscInfoVO();
		mngmstBscInfoVO.setMsgKey(msgKey);

		MngmstBscInfoVO resultVO = mngmstBscInfoMapper.selectMngmstBscInfo(mngmstBscInfoVO);

		return resultVO;
	}

	@Override
	public List<MngmstBscInfoVO> selectMngmstBscInfoList(MngmstBscInfoVO mngmstBscInfoVO) throws Exception {

		List<MngmstBscInfoVO> resultList = mngmstBscInfoMapper.selectMngmstBscInfoList(mngmstBscInfoVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (MngmstBscInfoVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}


	@Override
	public int insertMngmstBscInfo(MngmstBscInfoVO mngmstBscInfoVO) throws Exception {

		int insertedCnt = mngmstBscInfoMapper.insertMngmstBscInfo(mngmstBscInfoVO);

		return insertedCnt;
	}

	@Override
	public int updateMngmstBscInfo(MngmstBscInfoVO mngmstBscInfoVO) throws Exception {

		int updatedCnt = mngmstBscInfoMapper.updateMngmstBscInfo(mngmstBscInfoVO);

		return updatedCnt;
	}

	@Override
	public int deleteMngmstBscInfo(MngmstBscInfoVO mngmstBscInfoVO) throws Exception {

		int deletedCnt = mngmstBscInfoMapper.deleteMngmstBscInfo(mngmstBscInfoVO);

		return deletedCnt;
	}

	@Override
	public int deleteMngmstBscInfoList(List<MngmstBscInfoVO> mngmstBscInfoList) throws Exception {

		int deletedCnt = 0;

		for ( MngmstBscInfoVO mngmstBscInfoVO : mngmstBscInfoList ) {
			deletedCnt += mngmstBscInfoMapper.deleteMngmstBscInfo(mngmstBscInfoVO);
		}

		return deletedCnt;
	}

}
