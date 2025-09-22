package com.at.apcss.am.sort.service.impl;


import com.at.apcss.am.sort.mapper.SortPrfmncAtrbMapper;

import com.at.apcss.am.sort.service.SortPrfmncAtrbService;
import com.at.apcss.am.sort.vo.*;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : SortPrfmncAtrbServiceImpl.java
 * @Description : 선별실적속성 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2025.09.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.18  김호        최초 생성
 * </pre>
 */
@Service("sortPrfmncAtrbService")
public class SortPrfmncAtrbServiceImpl extends BaseServiceImpl implements SortPrfmncAtrbService {

	@Autowired
	private SortPrfmncAtrbMapper sortPrfmncAtrbMapper;

	@Override
	public HashMap<String, Object> muliSaveSortPrfmncList(List<SortPrfmncAtrbVO> sortPrfmncAtrbList) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();
		List<SortPrfmncAtrbVO> insertSortPrfmncAtrbList = new ArrayList<>();
		List<SortPrfmncAtrbVO> updateSortPrfmncAtrbList = new ArrayList<>();

		for (SortPrfmncAtrbVO sortPrfmncAtrbVO :sortPrfmncAtrbList) {

			if (ComConstants.ROW_STS_INSERT.equals(sortPrfmncAtrbVO.getRowSts())) {
				insertSortPrfmncAtrbList.add(sortPrfmncAtrbVO);
			}

			if (ComConstants.ROW_STS_UPDATE.equals(sortPrfmncAtrbVO.getRowSts())) {
				updateSortPrfmncAtrbList.add(sortPrfmncAtrbVO);
			}
		}

		if (!insertSortPrfmncAtrbList.isEmpty()) {
			for (SortPrfmncAtrbVO sortPrfmncAtrbVO : insertSortPrfmncAtrbList) {

				if (0 == insertSortPrfmncAtrb(sortPrfmncAtrbVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}

			}
		}

		if (!updateSortPrfmncAtrbList.isEmpty()) {

			for (SortPrfmncAtrbVO sortPrfmncAtrbVO : updateSortPrfmncAtrbList) {

				if (0 == updateSortPrfmncAtrb(sortPrfmncAtrbVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}

			}
		}

		return null;
	}

	@Override
	public int insertSortPrfmncAtrb(SortPrfmncAtrbVO sortPrfmncAtrbVO) throws Exception {
		return sortPrfmncAtrbMapper.insertSortPrfmncAtrb(sortPrfmncAtrbVO);
	}

	@Override
	public int updateSortPrfmncAtrb(SortPrfmncAtrbVO sortPrfmncAtrbVO) throws Exception {
		return sortPrfmncAtrbMapper.updateSortPrfmncAtrb(sortPrfmncAtrbVO);
	}

	@Override
	public int deleteSortPrfmncAtrb(SortPrfmncAtrbVO sortPrfmncAtrbVO) throws Exception {
		return sortPrfmncAtrbMapper.deleteSortPrfmncAtrb(sortPrfmncAtrbVO);
	}

	@Override
	public int deleteSortPrfmncAtrbAll(SortPrfmncAtrbVO sortPrfmncAtrbVO) throws Exception {
		return sortPrfmncAtrbMapper.deleteSortPrfmncAtrbAll(sortPrfmncAtrbVO);
	}

}
