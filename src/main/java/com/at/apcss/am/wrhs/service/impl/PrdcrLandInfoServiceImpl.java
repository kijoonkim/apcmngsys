package com.at.apcss.am.wrhs.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.at.apcss.am.wrhs.mapper.FrmerInfoMapper;
import com.at.apcss.am.wrhs.mapper.PrdcrLandInfoMapper;
import com.at.apcss.am.wrhs.service.PrdcrLandInfoService;
import com.at.apcss.am.wrhs.vo.CltvtnHstryVO;
import com.at.apcss.am.wrhs.vo.PrdcrLandInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : PrdcrLandInfoServiceImpl.java
 * @Description : 영농관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김  호
 * @since 2024.08.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.08.25  김  호        최초 생성
 * </pre>
 */
@Service("prdcrLandInfoService")
public class PrdcrLandInfoServiceImpl extends BaseServiceImpl implements PrdcrLandInfoService {

	@Resource(name="prdcrLandInfoMapper")
	private PrdcrLandInfoMapper prdcrLandInfoMapper;

	@Resource(name = "frmerInfoMapper")
	private FrmerInfoMapper frmerInfoMapper;

	@Override
	public List<PrdcrLandInfoVO> selectPrdcrLandInfoList(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception {
		List<PrdcrLandInfoVO> resultList = prdcrLandInfoMapper.selectPrdcrLandInfoList(prdcrLandInfoVO);
		return resultList;
	}

	@Override
	public String selectGetPrdcrLandInfoNo(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception {
		String prdcrLandInfoNo = prdcrLandInfoMapper.selectGetPrdcrLandInfoNo(prdcrLandInfoVO);
		return prdcrLandInfoNo;
	}

	@Override
	public int insertPrdcrLandInfo(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception {
		int insertedCnt = prdcrLandInfoMapper.insertPrdcrLandInfo(prdcrLandInfoVO);
		return insertedCnt;
	}

	@Override
	public int updatePrdcrLandInfo(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception {
		int updatedCnt = prdcrLandInfoMapper.updatePrdcrLandInfo(prdcrLandInfoVO);
		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deletePrdcrLandInfo(PrdcrLandInfoVO prdcrLandInfoVO) throws Exception {

		if (0 == prdcrLandInfoMapper.deletePrdcrLandInfo(prdcrLandInfoVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		CltvtnHstryVO cltvtnHstryVO = new CltvtnHstryVO();

		BeanUtils.copyProperties(prdcrLandInfoVO, cltvtnHstryVO);

		List<CltvtnHstryVO> resultList = frmerInfoMapper.selectCltvtnHstryList(cltvtnHstryVO);

		for (CltvtnHstryVO cltvtnHstry : resultList) {
			if (0 == frmerInfoMapper.deleteCltvtnHstry(cltvtnHstry)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}
		return null;
	}
}
