package com.at.apcss.am.pckg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.pckg.mapper.PckgCmndMapper;
import com.at.apcss.am.pckg.service.PckgCmndService;
import com.at.apcss.am.pckg.vo.PckgCmndVO;

/**
 * @Class Name : PckgCmndServiceImpl.java
 * @Description : 포장지시 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("pckgCmndService")
public class PckgCmndServiceImpl implements PckgCmndService {

	@Autowired
	private PckgCmndMapper pckgCmndMapper;

	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Override
	public PckgCmndVO selectPckgCmnd(PckgCmndVO pckgCmndVO) throws Exception {

		PckgCmndVO resultVO = pckgCmndMapper.selectPckgCmnd(pckgCmndVO);

		return resultVO;
	}

	@Override
	public List<PckgCmndVO> selectPckgCmndList(PckgCmndVO pckgCmndVO) throws Exception {

		List<PckgCmndVO> resultList = pckgCmndMapper.selectPckgCmndList(pckgCmndVO);

		return resultList;
	}

	@Override
	public int insertPckgCmnd(PckgCmndVO pckgCmndVO) throws Exception {

		int insertedCnt = pckgCmndMapper.insertPckgCmnd(pckgCmndVO);

		return insertedCnt;
	}

	@Override
	public int updatePckgCmnd(PckgCmndVO pckgCmndVO) throws Exception {

		int updatedCnt = pckgCmndMapper.updatePckgCmnd(pckgCmndVO);

		return updatedCnt;
	}

	@Override
	public int deletePckgCmnd(PckgCmndVO pckgCmndVO) throws Exception {

		int deletedCnt = pckgCmndMapper.deletePckgCmnd(pckgCmndVO);

		return deletedCnt;
	}

	@Override
	public int insertPckgCmndList(List<PckgCmndVO> pckgCmndList) throws Exception {
		int insertedCnt = 0;
		String pckgCmndno = cmnsTaskNoService.selectPckgCmndno(pckgCmndList.get(0).getApcCd(), pckgCmndList.get(0).getPckgCmndYmd());
		int sn = 1;
		for (PckgCmndVO pckgCmndVO : pckgCmndList) {
			pckgCmndVO.setPckgCmndno(pckgCmndno);
			pckgCmndVO.setPckgCmndSn(sn);
			insertPckgCmnd(pckgCmndVO);
			sn++;
		}
		for (PckgCmndVO pckgCmndVO : pckgCmndList) {
			insertPckgCmnd(pckgCmndVO);
		}
		return insertedCnt;
	}

	@Override
	public int deletePckgCmndList(List<PckgCmndVO> pckgCmndList) throws Exception {
		int deletedCnt = 0;

		for (PckgCmndVO pckgCmndVO : pckgCmndList) {
			deletedCnt = deletePckgCmnd(pckgCmndVO);
		}
		return deletedCnt;
	}

}
