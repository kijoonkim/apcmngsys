package com.at.apcss.am.trnsf.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.trnsf.mapper.InvntrTrnsfMapper;
import com.at.apcss.am.trnsf.service.InvntrTrnsfService;
import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : InvntrTrnsfServiceImpl.java
 * @Description : 재고이송 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("invntrTrnsfService")
public class InvntrTrnsfServiceImpl extends BaseServiceImpl implements InvntrTrnsfService {

	@Autowired
	private InvntrTrnsfMapper invntrTrnsfMapper;

	@Resource(name = "rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;

	@Resource(name = "sortInvntrService")
	private SortInvntrService sortInvntrService;

	@Resource(name = "gdsInvntrService")
	private GdsInvntrService gdsInvntrService;

	@Override
	public InvntrTrnsfVO selectInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception {

		InvntrTrnsfVO resultVO = invntrTrnsfMapper.selectInvntrTrnsf(invntrTrnsfVO);

		return resultVO;
	}

	@Override
	public List<InvntrTrnsfVO> selectInvntrTrnsfList(InvntrTrnsfVO invntrTrnsfVO) throws Exception {

		List<InvntrTrnsfVO> resultList = invntrTrnsfMapper.selectInvntrTrnsfList(invntrTrnsfVO);

		return resultList;
	}

	@Override
	public int insertInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception {

		int insertedCnt = invntrTrnsfMapper.insertInvntrTrnsf(invntrTrnsfVO);

		return insertedCnt;
	}

	@Override
	public int updateInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception {

		int updatedCnt = invntrTrnsfMapper.updateInvntrTrnsf(invntrTrnsfVO);

		return updatedCnt;
	}

	@Override
	public int deleteInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception {

		int deletedCnt = invntrTrnsfMapper.deleteInvntrTrnsf(invntrTrnsfVO);

		return deletedCnt ;
	}

	@Override
	public HashMap<String, Object> insertInvntrTrnsfList(List<InvntrTrnsfVO> invntrTrnsfList) throws Exception {

		int insertedCnt = 0;

		for (InvntrTrnsfVO invntrTrnsfVO : invntrTrnsfList) {
			insertedCnt += insertInvntrTrnsf(invntrTrnsfVO);
		}

		if(insertedCnt == 0) {
			return ComUtil.getResultMap("W0005", "재고이송");
		}

		return null;
	}

	@Override
	public HashMap<String, Object> deleteInvntrTrnsfList(List<InvntrTrnsfVO> invntrTrnsfList) throws Exception {

		List<RawMtrInvntrVO> rawMtrInvntrList = new ArrayList<>();
		List<SortInvntrVO> sortInvntrList = new ArrayList<>();
		List<GdsInvntrVO> gdsInvntrList = new ArrayList<>();
		List<InvntrTrnsfVO> updateinvntrTrnsfList = new ArrayList<>();

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		for (InvntrTrnsfVO invntrTrnsfVO : invntrTrnsfList) {

			if("Y".equals(invntrTrnsfVO.getCfmtnYn())) {
				return ComUtil.getResultMap("E0000", "이송 확정 된 실적 입니다.");	// E0001	{}
			}

			if(ComConstants.INVNTR_SE_CD_RAWMTR.equals(invntrTrnsfVO.getInvntrSeCd())) {

				RawMtrInvntrVO rawMtrInvntr = new RawMtrInvntrVO();
				BeanUtils.copyProperties(invntrTrnsfVO, rawMtrInvntr);

				rawMtrInvntr = rawMtrInvntrService.selectRawMtrInvntr(rawMtrInvntr);
				rawMtrInvntr.setSysLastChgPrgrmId(invntrTrnsfVO.getSysLastChgPrgrmId());
				rawMtrInvntr.setSysLastChgUserId(invntrTrnsfVO.getSysLastChgUserId());

				int qntt = rawMtrInvntr.getInvntrQntt() + invntrTrnsfVO.getTrnsfQntt();
				Double wght = rawMtrInvntr.getInvntrWght() + invntrTrnsfVO.getTrnsfWght();
				rawMtrInvntr.setInvntrQntt(qntt);
				rawMtrInvntr.setInvntrWght(wght);
				rawMtrInvntr.setRowSts(ComConstants.ROW_STS_UPDATE);

				rawMtrInvntrList.add(rawMtrInvntr);
				updateinvntrTrnsfList.add(invntrTrnsfVO);
			}
			if(ComConstants.INVNTR_SE_CD_SORT.equals(invntrTrnsfVO.getInvntrSeCd())) {
				SortInvntrVO sortInvntrVO = new SortInvntrVO();
				BeanUtils.copyProperties(invntrTrnsfVO, sortInvntrVO);

				sortInvntrVO = sortInvntrService.selectSortInvntr(sortInvntrVO);

				int qntt = sortInvntrVO.getInvntrQntt() + invntrTrnsfVO.getTrnsfQntt();
				Double wght = sortInvntrVO.getInvntrWght() + invntrTrnsfVO.getTrnsfWght();

				sortInvntrVO.setSysLastChgPrgrmId(invntrTrnsfVO.getSysLastChgPrgrmId());
				sortInvntrVO.setSysLastChgUserId(invntrTrnsfVO.getSysLastChgUserId());

				sortInvntrVO.setInvntrQntt(qntt);
				sortInvntrVO.setInvntrWght(wght);

				sortInvntrVO.setRowSts(ComConstants.ROW_STS_UPDATE);
				sortInvntrList.add(sortInvntrVO);
				updateinvntrTrnsfList.add(invntrTrnsfVO);
			}

			if(ComConstants.INVNTR_SE_CD_GDS.equals(invntrTrnsfVO.getInvntrSeCd())) {
				GdsInvntrVO gdsInvntrVO = new GdsInvntrVO();
				BeanUtils.copyProperties(invntrTrnsfVO, gdsInvntrVO);

				gdsInvntrVO = gdsInvntrService.selectGdsInvntr(gdsInvntrVO);
				gdsInvntrVO.setSysLastChgPrgrmId(invntrTrnsfVO.getSysLastChgPrgrmId());
				gdsInvntrVO.setSysLastChgUserId(invntrTrnsfVO.getSysLastChgUserId());

				int qntt = gdsInvntrVO.getInvntrQntt() + invntrTrnsfVO.getTrnsfQntt();
				Double wght = gdsInvntrVO.getInvntrWght() + invntrTrnsfVO.getTrnsfWght();

				gdsInvntrVO.setInvntrQntt(qntt);
				gdsInvntrVO.setInvntrWght(wght);

				gdsInvntrVO.setRowSts(ComConstants.ROW_STS_UPDATE);
				gdsInvntrList.add(gdsInvntrVO);
				updateinvntrTrnsfList.add(invntrTrnsfVO);
			}
		}

		if(rawMtrInvntrList.size() > 0 ) {
			resultMap = rawMtrInvntrService.updateRawMtrInvntrList(rawMtrInvntrList);
		}

		if(resultMap != null) {
			return resultMap;
		}

		if(sortInvntrList.size() > 0 ) {
			resultMap = sortInvntrService.updateSortInvntrList(sortInvntrList);
		}

		if(resultMap != null) {
			return resultMap;
		}

		if(gdsInvntrList.size() > 0 ) {
			resultMap = gdsInvntrService.updateGdsInvntrList(gdsInvntrList);
		}

		if(resultMap != null) {
			return resultMap;
		}

		for (InvntrTrnsfVO invntrTrnsf : updateinvntrTrnsfList) {
			int deleteCnt = deleteInvntrTrnsf(invntrTrnsf);
			if(deleteCnt > 0) {
				return ComUtil.getResultMap("E0003", "재고이송 취소");	// W0009	{0} 시 오류가 발생하였습니다.
			}
		}

		return null;
	}
}
