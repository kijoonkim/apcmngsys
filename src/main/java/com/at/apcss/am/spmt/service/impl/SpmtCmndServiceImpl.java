package com.at.apcss.am.spmt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.ordr.service.OrdrService;
import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.mapper.SpmtCmndMapper;
import com.at.apcss.am.spmt.service.SpmtCmndService;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SpmtCmndServiceImpl.java
 * @Description : 출고지시 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("spmtCmndService")
public class SpmtCmndServiceImpl extends BaseServiceImpl implements SpmtCmndService {

	@Autowired
	private SpmtCmndMapper spmtCmndMapper;

	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name = "ordrService")
	private OrdrService ordrService;

	@Override
	public SpmtCmndVO selectSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception {

		SpmtCmndVO resultVO = spmtCmndMapper.selectSpmtCmnd(spmtCmndVO);

		return resultVO;
	}

	@Override
	public List<SpmtCmndVO> selectSpmtCmndList(SpmtCmndVO spmtCmndVO) throws Exception {

		List<SpmtCmndVO> resultList = spmtCmndMapper.selectSpmtCmndList(spmtCmndVO);

		return resultList;
	}

	@Override
	public List<SpmtCmndVO> selectRegSpmtCmndList(SpmtCmndVO spmtCmndVO) throws Exception {

		List<SpmtCmndVO> resultList = spmtCmndMapper.selectRegSpmtCmndList(spmtCmndVO);

		return resultList;
	}

	public List<OrdrVO> selectSpmtCmndTrgList(OrdrVO ordrVO) throws Exception {

		List<OrdrVO> resultList = spmtCmndMapper.selectSpmtCmndTrgList(ordrVO);

		return resultList;
	}

	@Override
	public int insertSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception {

		int insertedCnt = spmtCmndMapper.insertSpmtCmnd(spmtCmndVO);

		return insertedCnt;
	}

	@Override
	public int updateSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception {

		int updatedCnt = spmtCmndMapper.updateSpmtCmnd(spmtCmndVO);

		return updatedCnt;
	}

	@Override
	public int deleteSpmtCmnd(SpmtCmndVO spmtCmndVO) throws Exception {

		int deletedCnt = spmtCmndMapper.deleteSpmtCmnd(spmtCmndVO);

		return deletedCnt;
	}

	@Override
	public int deleteSpmtCmndList(List<SpmtCmndVO> spmtCmndList) throws Exception {
		int deletedCnt = 0;

		for (SpmtCmndVO spmtCmndVO : spmtCmndList) {

			int resultCnt = deleteSpmtCmnd(spmtCmndVO);
			if(resultCnt == 1) {


				OrdrVO ordrVO = new OrdrVO();
				ordrVO.setApcCd(spmtCmndVO.getApcCd());
				ordrVO.setOutordrno(spmtCmndVO.getOutordrno());
				ordrVO.setSpmtCmndno("");
				ordrVO.setApcSeCd(spmtCmndVO.getApcSeCd());
				ordrVO.setSysLastChgPrgrmId(spmtCmndVO.getSysLastChgPrgrmId());
				ordrVO.setSysLastChgUserId(spmtCmndVO.getSysLastChgUserId());

				ordrService.updateCmndno(ordrVO);
			}

			deletedCnt += resultCnt;
		}

		return deletedCnt;
	}

	@Override
	public int insertSpmtCmndList(List<SpmtCmndVO> spmtCmndList) throws Exception {

		int insertedCnt = 0;
		String spmtCmndno = cmnsTaskNoService.selectSpmtCmndno(spmtCmndList.get(0).getApcCd(), spmtCmndList.get(0).getCmndYmd());
		int sn = 1;

		for (SpmtCmndVO spmtCmndVO : spmtCmndList) {
			spmtCmndVO.setSpmtCmndno(spmtCmndno);
			spmtCmndVO.setSpmtCmndSn(sn);
			int insertResult = insertSpmtCmnd(spmtCmndVO);
			if(insertResult == 1) {
				OrdrVO ordrVO = new OrdrVO();
				ordrVO.setApcCd(spmtCmndVO.getApcCd());
				ordrVO.setOutordrno(spmtCmndVO.getOutordrno());
				ordrVO.setSpmtCmndno(spmtCmndno);
				ordrVO.setApcSeCd(spmtCmndVO.getApcSeCd());
				ordrVO.setSysLastChgPrgrmId(spmtCmndVO.getSysLastChgPrgrmId());
				ordrVO.setSysLastChgUserId(spmtCmndVO.getSysLastChgUserId());
				int check = ordrService.selectOrdrCheck(ordrVO);

				if(check == 0) {
					ordrService.updateCmndno(ordrVO);
				}
			}
			insertedCnt += insertResult;
			sn++;
		}
		return insertedCnt;
	}
	
	@Override
	public HashMap<String, Object> regSpmtCmndList(List<OrdrVO> ordrList) throws Exception {
		// TODO Auto-generated method stub
		
		List<OrdrVO> rcptList = new ArrayList<>();
		String spmtCmndno = cmnsTaskNoService.selectSpmtCmndno(ordrList.get(0).getApcCd(), ordrList.get(0).getCmndYmd());
		int sn = 1;
		

		// 접수
		for ( OrdrVO ordrVO : ordrList ) {
			ordrVO.setSpmtCmndno(spmtCmndno);
			if (ComConstants.ROW_STS_UPDATE.equals(ordrVO.getRowSts())) {
				rcptList.add(ordrVO);
			}
		}

		HashMap<String, Object> rtnObj = ordrService.multiOrdrList(rcptList);
		if (rtnObj != null) {
			return rtnObj;
		}

		// 출하지시 등록
		for ( OrdrVO ordrVO : ordrList ) {
			if (ComConstants.ROW_STS_UPDATE.equals(ordrVO.getRowSts())) {
				ordrVO.setRowSts("I");
			}
		}

		for ( OrdrVO ordrVO : ordrList ) {
			SpmtCmndVO vo = new SpmtCmndVO();
			OrdrVO list = ordrVO;
			vo.setApcCd(list.getApcCd());
			vo.setSpmtCmndno(spmtCmndno);
			vo.setSpmtCmndSn(sn);
			vo.setCmndYmd(list.getCmndYmd());
			vo.setCnptCd(list.getApcCnptCd());
			vo.setDldtn(list.getDldtn());
			vo.setTrsprtCoCd(list.getTrsprtCoCd());
			vo.setGdsGrd(list.getGdsGrd());
			vo.setCmndQntt(list.getCmndQntt());
			vo.setCmndWght(list.getCmndWght());
			vo.setSpmtPckgUnitCd(list.getSpmtPckgUnitCd());
			vo.setOutordrno(list.getOutordrno());
			vo.setItemCd(list.getItemCd());
			vo.setVrtyCd(list.getVrtyCd());
			vo.setSpcfctCd(list.getSpcfctCd());
			vo.setRmrk(list.getRmrk());
			vo.setSysFrstInptPrgrmId(list.getSysFrstInptPrgrmId());
			vo.setSysFrstInptUserId(list.getSysFrstInptUserId());
			vo.setSysLastChgPrgrmId(list.getSysLastChgPrgrmId());
			vo.setSysLastChgUserId(list.getSysLastChgUserId());
			if(0 == insertSpmtCmnd(vo)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
			sn++;
		}
		
		return null;
	}
}
