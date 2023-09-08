package com.at.apcss.am.invntr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.beans.BeanUtils;

import com.at.apcss.am.invntr.mapper.RawMtrInvntrMapper;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : RawMtrInvntrServiceImpl.java
 * @Description : 원물재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rawMtrInvntrService")
public class RawMtrInvntrServiceImpl extends BaseServiceImpl implements RawMtrInvntrService {

	@Autowired
	private RawMtrInvntrMapper rawMtrInvntrMapper;

	@Override
	public RawMtrInvntrVO selectRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO resultVO = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		return resultVO;
	}

	@Override
	public List<RawMtrInvntrVO> selectRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		List<RawMtrInvntrVO> resultList = rawMtrInvntrMapper.selectRawMtrInvntrList(rawMtrInvntrVO);

		return resultList;
	}


	@Override
	public HashMap<String, Object> insertRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		int insertedCnt = rawMtrInvntrMapper.insertRawMtrInvntr(rawMtrInvntrVO);
		if (insertedCnt != 0) {

		}
		return null;
	}


	@Override
	public HashMap<String, Object> insertRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {

		int insertedCnt = 0;
		for ( RawMtrInvntrVO rawMtrInvntrVO : rawMtrInvntrList ) {

			insertedCnt = rawMtrInvntrMapper.insertRawMtrInvntr(rawMtrInvntrVO);

			if (insertedCnt != 0) {

			}
		}

		return null;
	}


//	@Override
//	public HashMap<String, Object> updateRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {
//
//		int updatedCnt = rawMtrInvntrMapper.updateRawMtrInvntr(rawMtrInvntrVO);
//
//		return null;
//	}
//
//
//	@Override
//	public HashMap<String, Object> updateRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {
//
//		int updatedCnt = rawMtrInvntrMapper.updateRawMtrInvntrList(rawMtrInvntrVO);
//
//		return null;
//	}

	@Override
	public HashMap<String, Object> deleteRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		// 재고상태 확인
		RawMtrInvntrVO invntrInfo = selectRawMtrInvntr(rawMtrInvntrVO);
		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			return ComUtil.getResultMap("W0005", "원물재고정보");	// W0005	{0}이/가 없습니다.
		}

		logger.debug("invntrInfo.getInvntrWght(): {}", invntrInfo.getInvntrWght());
		logger.debug("invntrInfo.getWrhsWght(): {}", invntrInfo.getWrhsWght());
		logger.debug("invntrInfo.getCmndWght(): {}", invntrInfo.getCmndWght());
		logger.debug("invntrInfo.getCmndQntt(): {}", invntrInfo.getCmndQntt());

		if (invntrInfo.getInvntrWght() < invntrInfo.getWrhsWght()) {
			return ComUtil.getResultMap("W0009", "진행량");	// W0009	{0}이/가 있습니다.
		}

		// 선별지시 확인 추가
		if (invntrInfo.getCmndWght() > 0 || invntrInfo.getCmndQntt() > 0) {
			return ComUtil.getResultMap("W0009", "투입지시");	// W0009	{0}이/가 있습니다.
		}

		int deletedCnt = rawMtrInvntrMapper.deleteRawMtrInvntr(rawMtrInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntrSortPrfmnc(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO invntrInfo = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getWrhsno())) {
			logger.debug("원물재고 없음");
			return ComUtil.getResultMap("W0005", "원물재고");
		}

		if (rawMtrInvntrVO.getInptWght() > invntrInfo.getInvntrWght()) {
			logger.debug("원물재고 대비 투입량 over");
			return ComUtil.getResultMap("W0008", "재고량||투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - rawMtrInvntrVO.getInptQntt();
		double invntrWght = invntrInfo.getInvntrWght() - rawMtrInvntrVO.getInptWght();
		rawMtrInvntrVO.setInvntrQntt(invntrQntt);
		rawMtrInvntrVO.setInvntrWght(invntrWght);

		// 투입량
		int inptQntt = invntrInfo.getInptQntt() + rawMtrInvntrVO.getInptQntt();
		double inptWght = invntrInfo.getInptWght() + rawMtrInvntrVO.getInptWght();
		rawMtrInvntrVO.setInptQntt(inptQntt);
		rawMtrInvntrVO.setInptWght(inptWght);

		int updatedCnt = rawMtrInvntrMapper.updateInvntrSortPrfmnc(rawMtrInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

//	@Override
//	public HashMap<String, Object> updateRawMtrInvntr(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {
//		// TODO Auto-generated method stub
//		int updatedCnt = rawMtrInvntrMapper.updateRawMtrInvntr(rawMtrInvntrList);
//
//		return null;
//	}

	@Override
	public HashMap<String, Object> updateRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {
		// TODO Auto-generated method stub
		//포문 돌ㄹ리기 예제 참고

		List<RawMtrInvntrVO> updateList = new ArrayList<>();

		for (RawMtrInvntrVO rawMtrInvntrVO : rawMtrInvntrList) {
			RawMtrInvntrVO vo = new RawMtrInvntrVO();
	         BeanUtils.copyProperties(rawMtrInvntrVO, vo);

	         if (ComConstants.ROW_STS_UPDATE.equals(rawMtrInvntrVO.getRowSts())) {
	            updateList.add(vo);
	         }
	      }

		for (RawMtrInvntrVO rawMtrInvntrVO : updateList) {
			rawMtrInvntrMapper.updateRawMtrInvntrList(rawMtrInvntrVO);
	     }

//		int updatedCnt = rawMtrInvntrMapper.updateRawMtrInvntrList(rawMtrInvntrList);

		return null;
	}

	@Override
	public HashMap<String, Object> updateRawMtrInvntr(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> updateRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
