package com.at.apcss.am.spmt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.ordr.service.OrdrService;
import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.mapper.SpmtCmndMapper;
import com.at.apcss.am.spmt.service.SpmtCmndService;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

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
}
