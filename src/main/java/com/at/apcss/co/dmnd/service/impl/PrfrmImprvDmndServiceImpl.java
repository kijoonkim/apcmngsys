package com.at.apcss.co.dmnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.dmnd.mapper.PrfrmImprvDmndMapper;
import com.at.apcss.co.dmnd.service.PrfrmImprvDmndService;
import com.at.apcss.co.dmnd.vo.PrfrmImprvDmndVO;
/**
 * @Class Name : PrfrmImprvDmndServiceImpl.java
 * @Description : 프로그램개선요청 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2023.09.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.20  김호        최초 생성
 * </pre>
 */
@Service("prfrmImprvDmndService")
public class PrfrmImprvDmndServiceImpl implements PrfrmImprvDmndService{

	@Autowired
	private PrfrmImprvDmndMapper prfrmImprvDmndMapper;

	@Override
	public List<PrfrmImprvDmndVO> selectPrfrmImprvDmndList(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception {

		List<PrfrmImprvDmndVO> resultList = prfrmImprvDmndMapper.selectPrfrmImprvDmndList(prfrmImprvDmndVO);

		return resultList;
	}

	@Override
	public int insertPrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception {
		int insertedCnt = prfrmImprvDmndMapper.insertPrfrmImprvDmnd(prfrmImprvDmndVO);
		return insertedCnt;
	}

	@Override
	public int updatePrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception {

		int updatedCnt = prfrmImprvDmndMapper.updatePrfrmImprvDmnd(prfrmImprvDmndVO);
		return updatedCnt;
	}

	@Override
	public int deletePrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception {

		int deletedCnt = prfrmImprvDmndMapper.deletePrfrmImprvDmnd(prfrmImprvDmndVO);

		return deletedCnt;
	}

	@Override
	public int multiSavePrfrmImprvDmndList(List<PrfrmImprvDmndVO> prfrmImprvDmndList) throws Exception {

		int savedCnt = 0;

		for (PrfrmImprvDmndVO prfrmImprvDmndVO : prfrmImprvDmndList) {

			if(ComConstants.ROW_STS_INSERT.equals(prfrmImprvDmndVO.getRowSts())) {
				savedCnt += insertPrfrmImprvDmnd(prfrmImprvDmndVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(prfrmImprvDmndVO.getRowSts())) {
				savedCnt += updatePrfrmImprvDmnd(prfrmImprvDmndVO);
			}
		}
		return savedCnt;
	}

}
