package com.at.apcss.am.invntr.service.impl;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.vo.PltBxVO;
import com.at.apcss.am.invntr.mapper.PltWrhsSpmtMapper;
import com.at.apcss.am.invntr.service.PltWrhsSpmtService;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : PltWrhsSpmtServiceImpl.java
 * @Description : 팔레트 입출고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("pltWrhsSpmtService")
public class PltWrhsSpmtServiceImpl extends BaseServiceImpl implements PltWrhsSpmtService {

	@Autowired
	private PltWrhsSpmtMapper pltWrhsSpmtMapper;

	@Override
	public PltWrhsSpmtVO selectPltBxMngWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception {

		PltWrhsSpmtVO resultVO = pltWrhsSpmtMapper.selectPltBxMngWrhsSpmt(pltWrhsSpmtVO);

		return resultVO;
	}

	@Override
	public List<PltBxVO> selectPltBxMngList(PltBxVO pltBxVO) throws Exception {

		List<PltBxVO> resultList = pltWrhsSpmtMapper.selectPltBxMngList(pltBxVO);

		return resultList;
	}

	@Override
	public PltWrhsSpmtVO selectPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception {

		PltWrhsSpmtVO resultVO = pltWrhsSpmtMapper.selectPltWrhsSpmt(pltWrhsSpmtVO);

		return resultVO;
	}

	@Override
	public List<PltWrhsSpmtVO> selectPltWrhsSpmtList(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception {

		List<PltWrhsSpmtVO> resultList = pltWrhsSpmtMapper.selectPltWrhsSpmtList(pltWrhsSpmtVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception {
		PltWrhsSpmtVO resultVO = selectPltBxMngWrhsSpmt(pltWrhsSpmtVO);
		int insertedCnt = pltWrhsSpmtMapper.insertPltWrhsSpmt(pltWrhsSpmtVO);

		if(insertedCnt > 0) {
			if("1".equals(pltWrhsSpmtVO.getWrhsSpmtSeCd())) {
				int returnBssInvntrQntt = resultVO.getBssInvntrQntt() + pltWrhsSpmtVO.getQntt();
				pltWrhsSpmtVO.setBssInvntrQntt(returnBssInvntrQntt);
			}else if("2".equals(pltWrhsSpmtVO.getWrhsSpmtSeCd())) {
				int returnBssInvntrQntt = resultVO.getBssInvntrQntt() - pltWrhsSpmtVO.getQntt();
				if(returnBssInvntrQntt > 0 ) {
					pltWrhsSpmtVO.setBssInvntrQntt(returnBssInvntrQntt);
				}else {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0008", "현팔레트수량||입력팔레트수량")));
				}
			}
			insertedCnt = pltWrhsSpmtMapper.updatePltWrhsSpmt(pltWrhsSpmtVO);
		}else {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0008", "수량||현재고수량")));
		}
		return null;
	}

	@Override
	public HashMap<String, Object> insertPltWrhsSpmtList(List<PltWrhsSpmtVO> pltWrhsSpmtList) throws Exception {
		for (PltWrhsSpmtVO pltWrhsSpmtVO : pltWrhsSpmtList) {
			HashMap<String, Object> rtnObj = insertPltWrhsSpmt(pltWrhsSpmtVO);
			if(rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		return null;
	}

	@Override
	public HashMap<String, Object> updateDelYnPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception {
		PltWrhsSpmtVO resultVO = selectPltBxMngWrhsSpmt(pltWrhsSpmtVO);
		int deletedCnt = pltWrhsSpmtMapper.updateDelYnPltWrhsSpmt(pltWrhsSpmtVO);
		if(deletedCnt > 0) {
			if("1".equals(pltWrhsSpmtVO.getWrhsSpmtSeCd())) {
				int deleteQntt = resultVO.getBssInvntrQntt() - pltWrhsSpmtVO.getQntt();
				if(deleteQntt > 0) {
					pltWrhsSpmtVO.setBssInvntrQntt(deleteQntt);
				}else {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0008", "입력팔레트수량||현팔레트수량")));
				}
			}else if("2".equals(pltWrhsSpmtVO.getWrhsSpmtSeCd())) {
				int deleteQntt = resultVO.getBssInvntrQntt() + pltWrhsSpmtVO.getQntt();
				pltWrhsSpmtVO.setBssInvntrQntt(deleteQntt);
			}
			deletedCnt = pltWrhsSpmtMapper.updateBssInvntrQnttPltWrhsSpmt(pltWrhsSpmtVO);
		}else {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("W0008", "수량||현재고수량")));
		}
		return null;
	}

	@Override
	public HashMap<String, Object> updateDelYnPltWrhsSpmtList(List<PltWrhsSpmtVO> pltWrhsSpmtList) throws Exception {
		for (PltWrhsSpmtVO pltWrhsSpmtVO : pltWrhsSpmtList) {
			HashMap<String, Object> rtnObj = updateDelYnPltWrhsSpmt(pltWrhsSpmtVO);
			if(rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		return null;
	}
}
