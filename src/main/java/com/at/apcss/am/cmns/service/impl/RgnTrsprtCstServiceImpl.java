package com.at.apcss.am.cmns.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.RgnTrsprtCstMapper;
import com.at.apcss.am.cmns.service.RgnTrsprtCstService;
import com.at.apcss.am.cmns.service.WrhsVhclService;
import com.at.apcss.am.cmns.vo.RgnTrsprtCstVO;
import com.at.apcss.am.cmns.vo.WrhsVhclVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : RgnTrsprtCstServiceImpl.java
 * @Description : 지역별운임비정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rgnTrsprtCstService")
public class RgnTrsprtCstServiceImpl extends BaseServiceImpl implements RgnTrsprtCstService {
	
	@Autowired
	private RgnTrsprtCstMapper rgnTrsprtCstMapper;
	
	@Resource(name = "wrhsVhclService")
	private WrhsVhclService wrhsVhclService;
	
	@Override
	public RgnTrsprtCstVO selectRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {
		
		RgnTrsprtCstVO resultVO = rgnTrsprtCstMapper.selectRgnTrsprtCst(rgnTrsprtCstVO);
		
		return resultVO;
	}

	@Override
	public List<RgnTrsprtCstVO> selectRgnTrsprtCstList(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {
		
		List<RgnTrsprtCstVO> resultList = rgnTrsprtCstMapper.selectRgnTrsprtCstList(rgnTrsprtCstVO);

		return resultList;
	}
	
	@Override
	public int insertRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {
		
		int insertedCnt = rgnTrsprtCstMapper.insertRgnTrsprtCst(rgnTrsprtCstVO);
		
		return insertedCnt;
	}

	@Override
	public int updateRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {

		int updatedCnt = rgnTrsprtCstMapper.updateRgnTrsprtCst(rgnTrsprtCstVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {

		int deletedCnt = rgnTrsprtCstMapper.deleteRgnTrsprtCst(rgnTrsprtCstVO);
		
		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> multiRgnTrsprtCst(List<RgnTrsprtCstVO> vhclList) throws Exception {
		// TODO Auto-generated method stub

		List<RgnTrsprtCstVO> insertList = new ArrayList<>();
		List<RgnTrsprtCstVO> updateList = new ArrayList<>();

		for (RgnTrsprtCstVO rgnTrsprtCstVO : vhclList) {
			RgnTrsprtCstVO vo = new RgnTrsprtCstVO();
			BeanUtils.copyProperties(rgnTrsprtCstVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(rgnTrsprtCstVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(rgnTrsprtCstVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for (RgnTrsprtCstVO rgnTrsprtCstVO : insertList) {
			rgnTrsprtCstMapper.insertRgnTrsprtCst(rgnTrsprtCstVO);
		}

		for (RgnTrsprtCstVO rgnTrsprtCstVO : updateList) {
			rgnTrsprtCstMapper.updateRgnTrsprtCst(rgnTrsprtCstVO);
		}
		return null;
	}
	
	@Override
	public HashMap<String, Object> multiApcVhclMngList(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception {
		// TODO Auto-generated method stub

		List<WrhsVhclVO> wrhsVhclList = rgnTrsprtCstVO.getWrhsVhclList();
		List<RgnTrsprtCstVO> rgnTrsprtCstList = rgnTrsprtCstVO.getRgnTrsprtCstList();

		if (wrhsVhclList.size() > 0) {
			HashMap<String, Object> rtnObjWrhsVhcl = wrhsVhclService.multiVhclList(wrhsVhclList);
			if (rtnObjWrhsVhcl != null) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}
		if (rgnTrsprtCstList.size() > 0) {
			HashMap<String, Object> rtnObjRgnTrsprtCst = multiRgnTrsprtCst(rgnTrsprtCstList);
			if (rtnObjRgnTrsprtCst != null) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}
		
		return null;
	}

}
