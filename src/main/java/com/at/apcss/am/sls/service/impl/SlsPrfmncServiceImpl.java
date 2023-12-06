package com.at.apcss.am.sls.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.sls.mapper.SlsPrfmncMapper;
import com.at.apcss.am.sls.service.SlsPrfmncService;
import com.at.apcss.am.sls.vo.SlsPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
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
public class SlsPrfmncServiceImpl extends BaseServiceImpl implements SlsPrfmncService {

	@Autowired
	private SlsPrfmncMapper slsPrfmncMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

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

	@Override
	public HashMap<String, Object> saveSlsPrfmncCrtList(List<SlsPrfmncVO> slsPrfmncList) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int savedCnt = 0;

		for (SlsPrfmncVO slsPrfmncVO : slsPrfmncList) {
			String ddlnYn = cmnsValidationService.selectChkDdlnYn(slsPrfmncVO.getApcCd(), slsPrfmncVO.getSpmtYmd());

			if("N".equals(ddlnYn)) {
				savedCnt += updateSlsPrfmnc(slsPrfmncVO);
			} else {
				resultMap.put("errCd", ComConstants.MSGCD_ALEADY_CLOSE);
				return resultMap;
			}
		}
		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> deleteSlsPrfmncCrtList(List<SlsPrfmncVO> slsPrfmncList) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int deletedCnt = 0;

		for (SlsPrfmncVO slsPrfmncVO : slsPrfmncList) {
			String ddlnYn = cmnsValidationService.selectChkDdlnYn(slsPrfmncVO.getApcCd(), slsPrfmncVO.getSpmtYmd());

			if("N".equals(ddlnYn)) {
				deletedCnt += deleteSlsPrfmnc(slsPrfmncVO);
			} else {
				resultMap.put("errCd", ComConstants.MSGCD_ALEADY_CLOSE);
				return resultMap;
			}
		}
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		return resultMap;
	}

	@Override
	public SlsPrfmncVO selectSlsPrfmncCfmtnYn(SlsPrfmncVO slsPrfmncVO) throws Exception {
		SlsPrfmncVO resultVO = slsPrfmncMapper.selectSlsPrfmncCfmtnYn(slsPrfmncVO);
		return resultVO;
	}

	@Override
	public int deleteSlsPrfmncAll(SlsPrfmncVO slsPrfmncVO) throws Exception {

		int deletedCnt = slsPrfmncMapper.deleteSlsPrfmncAll(slsPrfmncVO);

		return deletedCnt;
	}

}
