package com.at.apcss.am.cmns.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.mapper.CmnsTaskNoMapper;
import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.vo.CmnsTaskNoVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : CmnsTaskNoServiceImpl.java
 * @Description : 업무별 번호 관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.07.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.21  신정철        최초 생성
 * </pre>
 */
@Service("cmnsTaskNoService")
public class CmnsTaskNoServiceImpl extends BaseServiceImpl implements CmnsTaskNoService{

	@Autowired
	private CmnsTaskNoMapper cmnsTaskNoMapper;

	@Override
	public String selectWghno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_WGH);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectWrhsno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_WRHS);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectPlanno(String apcCd, String ymd) throws Exception {
		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_WRHS_PLAN);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectSortno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_SORT);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectSortCmndno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_SORT_CMND);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectPckgno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_PCKG);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectPckgCmndno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_PCKG_CMND);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectSpmtno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_SPMT);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectSpmtCmndno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_SPMT_CMND);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

	@Override
	public String selectOutordrno(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_OUTORDR);

		CmnsTaskNoVO resultVO = cmnsTaskNoMapper.selectFnGetIdTaskNo(paramVO);

		if (resultVO != null && StringUtils.hasText(resultVO.getTaskNo())) {
			return resultVO.getTaskNo();
		}

		return null;
	}

}
