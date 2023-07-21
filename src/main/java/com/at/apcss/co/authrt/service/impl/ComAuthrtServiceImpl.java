package com.at.apcss.co.authrt.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.co.authrt.mapper.ComAuthrtMapper;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUiVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUserVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

@Service("comAuthrtService")
public class ComAuthrtServiceImpl extends BaseServiceImpl implements ComAuthrtService {

	
	
	@Autowired
	private ComAuthrtMapper comAuthrtMapper;
	
	@Override
	public ComAuthrtVO selectComAuthrt(ComAuthrtVO comAuthrtVO) {
		
		ComAuthrtVO rtnVO = comAuthrtMapper.selectComAuthrt(comAuthrtVO);
		
		return rtnVO;
	}

	@Override
	public ComAuthrtVO selectComAuthrt(String authrtId) {
		
		ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
		comAuthrtVO.setAuthrtId(authrtId);
		
		ComAuthrtVO rtnVO = comAuthrtMapper.selectComAuthrt(comAuthrtVO);
		
		return rtnVO;
	}

	@Override
	public List<ComAuthrtVO> selectComAuthrtList(ComAuthrtVO comAuthrtVO) {
		
		List<ComAuthrtVO> rtnList = comAuthrtMapper.selectComAuthrtList(comAuthrtVO);
		
		return rtnList;
	}


	@Override
	public int insertComAuthrt(ComAuthrtVO comAuthVO) throws Exception {
		
		int insertedCnt = comAuthrtMapper.insertComAuthrt(comAuthVO);
		
		return insertedCnt;
	}

	@Override
	public int updateComAuthrt(ComAuthrtVO comAuthVO) throws Exception {
		
		int updatedCnt = comAuthrtMapper.updateComAuthrt(comAuthVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteComAuthrt(ComAuthrtVO comAuthVO) throws Exception {
		
		int deletedCnt = comAuthrtMapper.deleteComAuthrt(comAuthVO);
		
		return deletedCnt;
	}
	
	@Override
	public ComAuthrtMenuVO selectComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {
		
		return comAuthrtMapper.selectComAuthrtMenu(comAuthrtMenuVO);
	}
	
	@Override
	public List<ComAuthrtMenuVO> selectComAuthrtMenuList(ComAuthrtMenuVO comAuthrtMenuVO) {
		
		List<ComAuthrtMenuVO> rtnList = comAuthrtMapper.selectComAuthrtMenuList(comAuthrtMenuVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthrtUiVO> selectComAuthrtUiList(ComAuthrtUiVO comAuthrtUiVO) {
		
		List<ComAuthrtUiVO> rtnList = comAuthrtMapper.selectComAuthrtUiList(comAuthrtUiVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthrtMenuVO> selectComAuthrtMenuTreeList(ComAuthrtMenuVO comAuthrtMenuVO) {
		
		List<ComAuthrtMenuVO> rtnList = comAuthrtMapper.selectComAuthrtMenuTreeList(comAuthrtMenuVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthrtUserVO> selectComAuthrtUserList(ComAuthrtUserVO comAuthrtUserVO) {
		
		List<ComAuthrtUserVO> rtnList = comAuthrtMapper.selectComAuthrtUserList(comAuthrtUserVO);
		
		return rtnList;
	}

	@Override
	public int insertComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {
		
		int insertedCnt = comAuthrtMapper.insertComAuthrtMenu(comAuthrtMenuVO);
		
		return insertedCnt;
	}

	@Override
	public int updateComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {
		
		int updatedCnt = comAuthrtMapper.updateComAuthrtMenu(comAuthrtMenuVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {
		
		int deletedCnt = comAuthrtMapper.deleteComAuthrtMenu(comAuthrtMenuVO);
		
		return deletedCnt;
	}

	@Override
	public ComAuthrtUserVO selectComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> insertComAuthrtMenuList(ComAuthrtVO comAuthrtVO) throws Exception {
		
		logger.debug("$$$$$	333	$$$$$$$$$$$$$$");
		
		List<ComAuthrtMenuVO> comAuthrtMenuList = comAuthrtVO.getComAuthrtMenuList();
		
		logger.debug("$$$$$	444	$$$$$$$$$$$$$$");
		if (comAuthrtMenuList == null) {
			logger.debug("comAuthrtMenuList is null");
		}
		logger.debug("comAuthrtMenuList.size {}", comAuthrtMenuList.size());
		
		for ( ComAuthrtMenuVO menu : comAuthrtMenuList ) {
			
			ComAuthrtMenuVO comAuthrtMenuVO = new ComAuthrtMenuVO();
			BeanUtils.copyProperties(comAuthrtVO, comAuthrtMenuVO);
			
			BeanUtils.copyProperties(menu, comAuthrtMenuVO,
						ComConstants.PROP_COL_AUTHRT_ID,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID
					);
			logger.debug("$$$$$	555	$$$$$$$$$$$$$$");
			ComAuthrtMenuVO orgnVO = selectComAuthrtMenu(comAuthrtMenuVO);
			logger.debug("$$$$$	666	$$$$$$$$$$$$$$");
			boolean voExists = orgnVO != null && StringUtils.hasText(orgnVO.getAuthrtId());
			// FIXME ComAuthUi 정보 등록			
			if (ComConstants.CON_YES.equals(menu.getUseYn())) {
				// 기등록 메뉴id 인지 확인
				if (voExists) {
					// update
					// updateComAuthrtMenu(comAuthrtMenuVO);
				} else {
					// insert
					insertComAuthrtMenu(comAuthrtMenuVO);
				}
			} else {
				if (voExists) {
					// delete 권한메뉴
					deleteComAuthrtMenu(comAuthrtMenuVO);
				}
			}
			
			logger.debug("$$$$$	aaaa	$$$$$$$$$$$$$$");
		}
		
		return null;
	}




}
