package com.apcmngsys.apcss.am.cmns.service.impl;

import com.apcmngsys.apcss.am.cmns.mapper.CmnsTaskNoMapper;
import com.apcmngsys.apcss.am.cmns.service.CmnsTaskNoService;
import com.apcmngsys.apcss.am.cmns.vo.CmnsTaskNoVO;
import com.apcmngsys.apcss.am.constants.AmConstants;
import com.apcmngsys.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.apcmngsys.apcss.am.wrhs.vo.SdlngVO;
import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;
import com.apcmngsys.apcss.fm.wrhs.vo.RawMtrWrhsPrnmntVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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
	public String selectWrhsPrcsNo(String apcCd, String ymd) throws Exception {

		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_WRHS_PRCS);

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
	public String selectBffaWrhsno(String apcCd, String ymd) throws Exception {
		CmnsTaskNoVO paramVO = new CmnsTaskNoVO();
		paramVO.setApcCd(apcCd);
		paramVO.setYmd(ymd);
		paramVO.setTaskId(AmConstants.TASK_ID_BFFA_WRHS);

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

	@Override
	public String selectFnGetPltNo(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		return cmnsTaskNoMapper.selectFnGetPltNo(rawMtrWrhsVO);
	}

	@Override
	public String selectFnGetPrnmntNo(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception {
		return cmnsTaskNoMapper.selectFnGetPrnmntNo(rawMtrWrhsPrnmntVO);
	}

    @Override
    public String selectFnGetIdSdlngCd(SdlngVO sdlngVO) throws Exception {
        return cmnsTaskNoMapper.selectFnGetIdSdlngCd(sdlngVO);
    }

    @Override
    public String selectFnGetIdSdnlgNo(SdlngVO sdlngVO) throws Exception {
        return cmnsTaskNoMapper.selectFnGetIdSdnlgNo(sdlngVO);
    }

    @Override
    public String selectFnGetIdPlntngNo(SdlngVO sdlngVO) throws Exception {
        return cmnsTaskNoMapper.selectFnGetIdPlntngNo(sdlngVO);
    }
}
