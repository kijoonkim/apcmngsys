package com.at.apcss.am.cmns.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.mapper.PrdcrMapper;
import com.at.apcss.am.cmns.service.PrdcrDtlService;
import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.vo.PrdcrDtlVO;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : PrdcrServiceImpl.java
 * @Description : 생산자정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("prdcrService")
public class PrdcrServiceImpl extends BaseServiceImpl implements PrdcrService {

	@Autowired
	private PrdcrMapper prdcrMapper;

	@Resource(name="prdcrDtlService")
	private PrdcrDtlService prdcrDtlService;

	@Override
	public PrdcrVO selectPrdcr(PrdcrVO prdcrVO) throws Exception {

		PrdcrVO resultVO = prdcrMapper.selectPrdcr(prdcrVO);

		return resultVO;
	}

	@Override
	public List<PrdcrVO> selectPrdcrList(PrdcrVO prdcrVO) throws Exception {

		List<PrdcrVO> resultList = prdcrMapper.selectPrdcrList(prdcrVO);

		return resultList;
	}


	@Override
	public List<PrdcrVO> selectPrdcrCdList(PrdcrVO prdcrVO) throws Exception {

		List<PrdcrVO> resultList = prdcrMapper.selectPrdcrCdList(prdcrVO);

		return resultList;
	}


	@Override
	public HashMap<String, Object> insertPrdcr(PrdcrVO prdcrVO) throws Exception {

		if(0 == prdcrMapper.insertPrdcr(prdcrVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updatePrdcr(PrdcrVO prdcrVO) throws Exception {

		if(0 == prdcrMapper.updatePrdcr(prdcrVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updatePrdcrRprs(PrdcrVO prdcrVO) throws Exception {

		if(0 == prdcrMapper.updatePrdcrRprs(prdcrVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deletePrdcr(PrdcrVO prdcrVO) throws Exception {

		PrdcrDtlVO prdcrDtlVO = new PrdcrDtlVO();
		prdcrDtlVO.setApcCd(prdcrVO.getApcCd());
		prdcrDtlVO.setPrdcrCd(prdcrVO.getPrdcrCd());

		List<PrdcrDtlVO> rtnList = prdcrDtlService.selectPrdcrDtlList(prdcrDtlVO);

		if(rtnList.size() > 0) {
			HashMap<String, Object> rtnObj = prdcrDtlService.deletePrdcrDtl(prdcrDtlVO);
			if (rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		if(0 == prdcrMapper.deletePrdcr(prdcrVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> multiPrdcrList(List<PrdcrVO> prdcrList) throws Exception {
		// TODO Auto-generated method stub

		List<PrdcrVO> insertList = new ArrayList<>();
		List<PrdcrVO> updateList = new ArrayList<>();

		for ( PrdcrVO prdcrVO : prdcrList ) {
			PrdcrVO vo = new PrdcrVO();
			BeanUtils.copyProperties(prdcrVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(prdcrVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(prdcrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for ( PrdcrVO prdcrVO : insertList ) {

			PrdcrVO newPrdcr = prdcrMapper.selectNewPrdcrCd(prdcrVO);
			if (newPrdcr == null || !StringUtils.hasText(newPrdcr.getPrdcrCd())) {
				throw new EgovBizException(getMessage("E0001"));
			}
			prdcrVO.setPrdcrCd(newPrdcr.getPrdcrCd());
			if(0 == prdcrMapper.insertPrdcr(prdcrVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}

		for ( PrdcrVO prdcrVO : updateList ) {
			int check;
			String prdcrMngTypeChk = prdcrVO.getPrdcrMngType();
			if(prdcrMngTypeChk != null && prdcrMngTypeChk.equals("U")) {
				check = prdcrMapper.updatePrdcrNm(prdcrVO);
			}else {
				check = prdcrMapper.updatePrdcr(prdcrVO);
			}
			if(check == 0) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}

		return null;
	}

	@Override
	public List<PrdcrVO> selectAgrixPrdcrList(PrdcrVO prdcrVO) throws Exception {
		List<PrdcrVO> resultList = prdcrMapper.selectAgrixPrdcrList(prdcrVO);
		return resultList;
	}

	@Override
	public int updateApcPrdcr(PrdcrVO prdcrVO) throws Exception {
		int updatedCnt = prdcrMapper.updateApcPrdcr(prdcrVO);
		return updatedCnt;
	}
	@Override
	public HashMap<String, Object> updatePrdcrList(List<PrdcrVO> prdcrList) throws Exception {
		for (PrdcrVO prdcrVO : prdcrList) {
			updateApcPrdcr(prdcrVO);
		}
		return null;
	}

}
