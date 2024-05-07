package com.at.apcss.am.ordr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.ordr.mapper.OrdrMapper;
import com.at.apcss.am.ordr.service.OrdrService;
import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : OrdrServiceImpl.java
 * @Description : 발주정보 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("ordrService")
public class OrdrServiceImpl extends BaseServiceImpl implements OrdrService {

	@Autowired
	private OrdrMapper ordrMapper;

	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Override
	public OrdrVO selectOrdr(OrdrVO ordrVO) throws Exception {

		OrdrVO resultVO = ordrMapper.selectOrdr(ordrVO);

		return resultVO;
	}

	@Override
	public List<OrdrVO> selectOrdrList(OrdrVO ordrVO) throws Exception {

		List<OrdrVO> resultList = ordrMapper.selectOrdrList(ordrVO);

		return resultList;
	}

	@Override
	public int insertOrdr(OrdrVO ordrVO) throws Exception {
		int insertedCnt =  0;
		String outordrno = cmnsTaskNoService.selectOutordrno(ordrVO.getApcCd(), ordrVO.getOutordrYmd());

		ordrVO.setOutordrno(outordrno);

		insertedCnt = ordrMapper.insertOrdr(ordrVO);

		return insertedCnt;
	}

	@Override
	public int updateOrdr(OrdrVO ordrVO) throws Exception {

		int updatedCnt = ordrMapper.updateOrdr(ordrVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> multiOrdrList(List<OrdrVO> ordrList) throws Exception {
		// TODO Auto-generated method stub

		List<OrdrVO> insertList = new ArrayList<>();
		List<OrdrVO> updateList = new ArrayList<>();

		for ( OrdrVO OrdrVO : ordrList ) {
			OrdrVO vo = new OrdrVO();
			BeanUtils.copyProperties(OrdrVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(OrdrVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(OrdrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for ( OrdrVO OrdrVO : insertList ) {
			if(0 == ordrMapper.insertOrdr(OrdrVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}

		for ( OrdrVO OrdrVO : updateList ) {
			if(0 == ordrMapper.updateOrdr(OrdrVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}
		return null;
	}

	@Override
	public int deleteOrdr(OrdrVO ordrVO) throws Exception {

		int deletedCnt = ordrMapper.deleteOrdr(ordrVO);

		return deletedCnt;
	}

	@Override
	public List<OrdrVO> selectOrdrHandwritingList(OrdrVO ordrVO) throws Exception {

		List<OrdrVO> resultList = ordrMapper.selectOrdrHandwritingList(ordrVO);

		return resultList;
	}

	@Override
	public int deleteOrdrList(List<OrdrVO> ordrList) throws Exception {
		int deletedCnt = 0;
		for (OrdrVO ordrVO : ordrList) {

			deletedCnt += deleteOrdr(ordrVO);
		}

		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> deleteOutordrList(List<OrdrVO> ordrList) throws Exception {
		
		// FIXME validation check 추가할 것
		for (OrdrVO ordrVO : ordrList) {
			ordrMapper.deleteOrdr(ordrVO);
		}
		
		return null;
	}

	
	@Override
	public int selectOrdrCheck(OrdrVO ordrVO) throws Exception {
		return ordrMapper.selectOrdrCheck(ordrVO);
	}

	@Override
	public void updateCmndno(OrdrVO ordrVO) throws Exception {
		ordrMapper.updateCmndno(ordrVO);
	}


}
