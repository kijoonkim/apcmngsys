package com.at.apcss.am.sls.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.sls.mapper.SlsPrfmncMapper;
import com.at.apcss.am.sls.service.SlsPrfmncService;
import com.at.apcss.am.sls.vo.SlsPrfmncVO;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SlsPrfmncServiceImpl.java
 * @Description : 매출실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("slsPrfmncService")
public class SlsPrfmncServiceImpl implements SlsPrfmncService {

	@Autowired
	private SlsPrfmncMapper slsPrfmncMapper;

	@Override
	public SlsPrfmncVO selectSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception {

		SlsPrfmncVO resultVO = slsPrfmncMapper.selectSlsPrfmnc(slsPrfmncVO);

		return resultVO;
	}

	@Override
	public List<SlsPrfmncVO> selectSlsPrfmncList(SlsPrfmncVO slsPrfmncVO) throws Exception {

		List<SlsPrfmncVO> resultList = slsPrfmncMapper.selectSlsPrfmncList(slsPrfmncVO);

		return resultList;
	}

	@Override
	public int insertSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception {

		int insertedCnt = slsPrfmncMapper.insertSlsPrfmnc(slsPrfmncVO);

		return insertedCnt;
	}

	@Override
	public int updateSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception {

		int updatedCnt = slsPrfmncMapper.updateSlsPrfmnc(slsPrfmncVO);

		return updatedCnt;
	}

	@Override
	public int deleteSlsPrfmnc(SlsPrfmncVO slsPrfmncVO) throws Exception {

		int deletedCnt = slsPrfmncMapper.deleteSlsPrfmnc(slsPrfmncVO);

		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> insertSlsPrfmncCrt(SlsPrfmncVO slsPrfmncVO) throws Exception {

		slsPrfmncMapper.insertSlsPrfmncCrt(slsPrfmncVO);
		if (StringUtils.hasText(slsPrfmncVO.getRtnCd())) {
			return ComUtil.getResultMap(slsPrfmncVO.getRtnCd(), slsPrfmncVO.getRtnMsg());
		}

		return null;
	}

	@Override
	public List<SlsPrfmncVO> selectRegSlsPrfmncList(SlsPrfmncVO slsPrfmncVO) throws Exception {

		List<SlsPrfmncVO> resultList = slsPrfmncMapper.selectRegSlsPrfmncList(slsPrfmncVO);

		return resultList;
	}

}
