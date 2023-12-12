package com.at.apcss.am.cmns.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.PrdcrDtlMapper;
import com.at.apcss.am.cmns.service.PrdcrDtlService;
import com.at.apcss.am.cmns.vo.PrdcrDtlVO;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : PrdcrDtlServiceImpl.java
 * @Description : 생산자상세정보관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 하민우
 * @since 2023.12.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.12.11  하민우        최초 생성
 * </pre>
 */
@Service("prdcrDtlService")
public class PrdcrDtlServiceImpl extends BaseServiceImpl implements PrdcrDtlService {

	@Autowired
	private PrdcrDtlMapper prdcrDtlMapper;

	@Override
	public List<PrdcrDtlVO> selectPrdcrDtlList(PrdcrDtlVO prdcrDtlVO) throws Exception {

		List<PrdcrDtlVO> resultList = prdcrDtlMapper.selectPrdcrDtlList(prdcrDtlVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertPrdcrDtl(PrdcrDtlVO prdcrDtlVO) throws Exception {

		if(0 == prdcrDtlMapper.insertPrdcrDtl(prdcrDtlVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updatePrdcrDtl(PrdcrDtlVO prdcrDtlVO) throws Exception {

		if(0 == prdcrDtlMapper.updatePrdcrDtl(prdcrDtlVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}
	
	@Override
	public HashMap<String, Object> updatePrdcrInfoFrmhs(PrdcrVO prdcrVO) throws Exception {

		if(0 == prdcrDtlMapper.updatePrdcrInfoFrmhs(prdcrVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updatePrdcrDtlDelYn(PrdcrDtlVO prdcrDtlVO) throws Exception {

		if(0 == prdcrDtlMapper.updatePrdcrDtlDelYn(prdcrDtlVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> multiPrdcrDtlList(List<PrdcrDtlVO> prdcrList) throws Exception {
		// TODO Auto-generated method stub

		List<PrdcrDtlVO> insertList = new ArrayList<>();
		List<PrdcrDtlVO> updateList = new ArrayList<>();

		for ( PrdcrDtlVO prdcrDtlVO : prdcrList ) {
			PrdcrDtlVO vo = new PrdcrDtlVO();
			BeanUtils.copyProperties(prdcrDtlVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(prdcrDtlVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(prdcrDtlVO.getRowSts())) {
				updateList.add(vo);
			}
		}
		
		PrdcrVO prdcrVO = new PrdcrVO();
		prdcrVO.setApcCd(prdcrList.get(0).getApcCd());
		prdcrVO.setPrdcrCd(prdcrList.get(0).getPrdcrCd());
		prdcrVO.setFrmhsNm(prdcrList.get(0).getFrmhsNm());
		prdcrVO.setFrmhsTelno(prdcrList.get(0).getFrmhsTelno());
		prdcrVO.setFrmhsCtpv(prdcrList.get(0).getFrmhsCtpv());
		prdcrVO.setFrmhsAddr(prdcrList.get(0).getFrmhsAddr());
		prdcrVO.setSysLastChgUserId(prdcrList.get(0).getSysLastChgUserId());
		prdcrVO.setSysLastChgPrgrmId(prdcrList.get(0).getSysLastChgPrgrmId());

		if (insertList.size() > 0) {
			for ( PrdcrDtlVO prdcrDtlVO : insertList ) {
				if(0 == prdcrDtlMapper.insertPrdcrDtl(prdcrDtlVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		if (updateList.size() > 0) {
			for ( PrdcrDtlVO prdcrDtlVO : updateList ) {
				if(0 == prdcrDtlMapper.updatePrdcrDtl(prdcrDtlVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}
		
		if(0 == prdcrDtlMapper.updatePrdcrInfoFrmhs(prdcrVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}
}
