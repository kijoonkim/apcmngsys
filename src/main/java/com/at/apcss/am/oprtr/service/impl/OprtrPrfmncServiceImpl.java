package com.at.apcss.am.oprtr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.oprtr.mapper.OprtrPrfmncMapper;
import com.at.apcss.am.oprtr.service.OprtrPrfmncService;
import com.at.apcss.am.oprtr.vo.OprtrPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : OprtrPrfmncServiceImpl.java
 * @Description : 작업자실적등록 프로그램에 대한 ServiceImpl 클래스
 * @author 김호
 * @since 2023.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.17     김호        최초 생성
 * </pre>
 */
@Service("oprtrPrfmncService")
public class OprtrPrfmncServiceImpl extends BaseServiceImpl implements OprtrPrfmncService{

	@Autowired
	private OprtrPrfmncMapper oprtrPrfmncMapper;

	@Override
	public List<OprtrPrfmncVO> selectRegPrfmncList(OprtrPrfmncVO oprtrPrfmncVO) throws Exception {

		List<OprtrPrfmncVO> resultList = oprtrPrfmncMapper.selectRegPrfmncList(oprtrPrfmncVO);

		return resultList;
	}

	@Override
	public List<OprtrPrfmncVO> selectOprtrPrfmncList(OprtrPrfmncVO oprtrPrfmncVO) throws Exception {

		List<OprtrPrfmncVO> resultList = oprtrPrfmncMapper.selectOprtrPrfmncList(oprtrPrfmncVO);

		return resultList;
	}

	@Override
	public int insertOprtrPrfmnc(OprtrPrfmncVO oprtrPrfmncVO) throws Exception {
		int insertedCnt = oprtrPrfmncMapper.insertOprtrPrfmnc(oprtrPrfmncVO);
		return insertedCnt;
	}

	@Override
	public int updateOprtrPrfmnc(OprtrPrfmncVO oprtrPrfmncVO) throws Exception {
		int updatedCnt = oprtrPrfmncMapper.updateOprtrPrfmnc(oprtrPrfmncVO);
		return updatedCnt;
	}

	@Override
	public int deleteOprtrPrfmnc(OprtrPrfmncVO oprtrPrfmncVO) throws Exception {
		int deletedCnt = oprtrPrfmncMapper.deleteOprtrPrfmnc(oprtrPrfmncVO);
		return deletedCnt;
	}

	@Override
	public int multiSaveOprtrPrfmnc(List<OprtrPrfmncVO> oprtrPrfmncList) throws Exception {
		int savedCnt = 0;
		for (OprtrPrfmncVO oprtrPrfmncVO : oprtrPrfmncList) {

			if(ComConstants.ROW_STS_INSERT.equals(oprtrPrfmncVO.getRowSts())) {
				int prfmncSn = getoprtrPrfmncno(oprtrPrfmncVO);
				oprtrPrfmncVO.setPrfmncSn(prfmncSn);
				savedCnt += insertOprtrPrfmnc(oprtrPrfmncVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(oprtrPrfmncVO.getRowSts())) {
				savedCnt += updateOprtrPrfmnc(oprtrPrfmncVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int getoprtrPrfmncno(OprtrPrfmncVO oprtrPrfmncVO) throws Exception {

		int prfmncSn = oprtrPrfmncMapper.getoprtrPrfmncno(oprtrPrfmncVO);
		return prfmncSn;
	}

}
