package com.at.apcss.am.apc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.apc.mapper.ApcEvrmntStngMapper;
import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.user.vo.ComUserVO;

@Service("apcEvrmntStngService")
public class ApcEvrmntStngServiceImpl implements ApcEvrmntStngService{

	@Autowired
	private ApcEvrmntStngMapper apcEvrmntStngMapper;

	@Override
	public ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.selectApcInfo(ApcEvrmntStngVO);
	}

	@Override
	public List<ApcEvrmntStngVO> selectApcDsctnList(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.selectApcDsctnList(ApcEvrmntStngVO);
	}

	@Override
	public int updateApcDsctn(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.updateApcDsctn(ApcEvrmntStngVO);
	}

	@Override
	public int insertApcDsctn(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception {
		return apcEvrmntStngMapper.insertApcDsctn(ApcEvrmntStngVO);
	}
	
	@Override
	public HashMap<String, Object> multiApcDsctnList(List<ApcEvrmntStngVO> apcDsctnList) throws Exception {
		// TODO Auto-generated method stub
	
		List<ApcEvrmntStngVO> insertList = new ArrayList<>();
		List<ApcEvrmntStngVO> updateList = new ArrayList<>();
		
		for ( ApcEvrmntStngVO ApcEvrmntStngVO : apcDsctnList ) {
			ApcEvrmntStngVO vo = new ApcEvrmntStngVO();
			BeanUtils.copyProperties(ApcEvrmntStngVO, vo);
			
			if (ComConstants.ROW_STS_INSERT.equals(ApcEvrmntStngVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(ApcEvrmntStngVO.getRowSts())) {
				updateList.add(vo);
			}
		}
		
		for ( ApcEvrmntStngVO ApcEvrmntStngVO : insertList ) {
			apcEvrmntStngMapper.insertApcDsctn(ApcEvrmntStngVO);
		}
		
		for ( ApcEvrmntStngVO ApcEvrmntStngVO : updateList ) {
			apcEvrmntStngMapper.updateApcDsctn(ApcEvrmntStngVO);
		}
		return null;
	}

	@Override
	public List<ComUserVO> selectApcUserList(ComUserVO comUserVO) throws Exception {
		return apcEvrmntStngMapper.selectApcUserList(comUserVO);
	}

	@Override
	public List<ComUserVO> selectRsrcList(ComCdVO comCdVO) throws Exception {
		return apcEvrmntStngMapper.selectRsrcList(comCdVO);
	}

	@Override
	public ApcEvrmntStngVO selectUserAprvReg(ComUserVO comUserVO) throws Exception {
		return null;
	}

	@Override
	public List<ComCdVO> selectVrtyList(ComCdVO comCdVO) throws Exception {
		return apcEvrmntStngMapper.selectVrtyList(comCdVO);
	}

}
