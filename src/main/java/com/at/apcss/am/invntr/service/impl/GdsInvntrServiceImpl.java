package com.at.apcss.am.invntr.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.invntr.mapper.GdsInvntrMapper;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : GdsInvntrServiceImpl.java
 * @Description : 상품재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("gdsInvntrService")
public class GdsInvntrServiceImpl extends BaseServiceImpl implements GdsInvntrService {


	@Autowired
	private GdsInvntrMapper gdsInvntrMapper;

	@Override
	public GdsInvntrVO selectGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO resultVO = gdsInvntrMapper.selectGdsInvntr(gdsInvntrVO);

		return resultVO;
	}

	@Override
	public List<GdsInvntrVO> selectGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectGdsInvntrList(gdsInvntrVO);

		return resultList;
	}

	@Override
	public int insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		int insertedCnt = gdsInvntrMapper.insertGdsInvntr(gdsInvntrVO);

		return insertedCnt;
	}

	@Override
	public int updateGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		int updatedCnt = gdsInvntrMapper.updateGdsInvntr(gdsInvntrVO);

		return updatedCnt;
	}

	@Override
	public int deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		int deletedCnt = gdsInvntrMapper.deleteGdsInvntr(gdsInvntrVO);

		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> insertGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) throws Exception {

		int insertedCnt;

		for ( GdsInvntrVO gdsInvntrVO : gdsInvntrList ) {

			insertedCnt = gdsInvntrMapper.insertGdsInvntr(gdsInvntrVO);

			if (insertedCnt != 0) {

			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmnc(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getPckgno())) {
			logger.debug("상품재고 없음");
			return ComUtil.getResultMap("W0005", "상품재고");
		}

		if (gdsInvntrVO.getSpmtWght() > invntrInfo.getInvntrWght()) {
			logger.debug("상품재고 대비 출하량 over");
			return ComUtil.getResultMap("W0008", "재고량||출하량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - gdsInvntrVO.getSpmtQntt();
		double invntrWght = invntrInfo.getInvntrWght() - gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		// 포장량
		int spmtQntt = invntrInfo.getSpmtQntt() + gdsInvntrVO.getSpmtQntt();
		double spmtWght = invntrInfo.getSpmtWght() + gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setSpmtQntt(spmtQntt);
		gdsInvntrVO.setSpmtWght(spmtWght);

		int updatedCnt = gdsInvntrMapper.updateGdsInvntrSpmtPrfmnc(gdsInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateGdsInvntrSpmtPrfmncCncl(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO invntrInfo = selectGdsInvntr(gdsInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getPckgno())) {
			logger.debug("상품재고정보 없음");
			return ComUtil.getResultMap("W0005", "상품재고정보");
		}

		if (gdsInvntrVO.getSpmtWght() > invntrInfo.getSpmtWght()) {
			logger.debug("상품재고 대비 출하량 over");
			return ComUtil.getResultMap("W0008", "출하량||취소량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() + gdsInvntrVO.getSpmtQntt();
		double invntrWght = invntrInfo.getInvntrWght() + gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setInvntrQntt(invntrQntt);
		gdsInvntrVO.setInvntrWght(invntrWght);

		// 포장량
		int spmtQntt = invntrInfo.getSpmtQntt() - gdsInvntrVO.getSpmtQntt();
		double spmtWght = invntrInfo.getSpmtWght() - gdsInvntrVO.getSpmtWght();
		gdsInvntrVO.setSpmtQntt(spmtQntt);
		gdsInvntrVO.setSpmtWght(spmtWght);

		int updatedCnt = gdsInvntrMapper.updateGdsInvntrSpmtPrfmnc(gdsInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

}
