package com.at.apcss.co.apc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.apc.mapper.ApcInfoMapper;
import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.apc.vo.ApcInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

@Service("apcInfoService")
public class ApcInfoServiceImpl extends BaseServiceImpl implements ApcInfoService{

	@Autowired
	private ApcInfoMapper apcInfoMapper;

	@Override
	public ApcInfoVO selectApcInfo(ApcInfoVO apcInfoVO) throws Exception {
		
		ApcInfoVO resultVO = apcInfoMapper.selectApcInfo(apcInfoVO);
		
		return resultVO;
	}

	@Override
	public List<ApcInfoVO> selectApcInfoList(ApcInfoVO apcInfoVO) throws Exception {

		List<ApcInfoVO> resultList = apcInfoMapper.selectApcInfoList(apcInfoVO);
		
		return resultList;
	}
	
	@Override
	public List<ApcInfoVO> selectApcDsctnList(ApcInfoVO apcInfoVO) throws Exception {
		return apcInfoMapper.selectApcDsctnList(apcInfoVO);
	}

	@Override
	public int updateApcDsctn(ApcInfoVO apcInfoVO) throws Exception {
		return apcInfoMapper.updateApcDsctn(apcInfoVO);
	}

	@Override
	public int insertApcDsctn(ApcInfoVO apcInfoVO) throws Exception {
		return apcInfoMapper.insertApcDsctn(apcInfoVO);
	}

	@Override
	public HashMap<String, Object> multiApcDsctnList(List<ApcInfoVO> apcDsctnList) throws Exception {
		// TODO Auto-generated method stub

		List<ApcInfoVO> insertList = new ArrayList<>();
		List<ApcInfoVO> updateList = new ArrayList<>();

		for ( ApcInfoVO apcInfoVO : apcDsctnList ) {
			ApcInfoVO vo = new ApcInfoVO();
			BeanUtils.copyProperties(apcInfoVO, vo);

			if (ComConstants.ROW_STS_INSERT.equals(apcInfoVO.getRowSts())) {
				insertList.add(vo);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(apcInfoVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for ( ApcInfoVO apcInfoVO : insertList ) {
			apcInfoMapper.insertApcDsctn(apcInfoVO);
		}

		for ( ApcInfoVO apcInfoVO : updateList ) {
			apcInfoMapper.updateApcDsctn(apcInfoVO);
		}
		return null;
	}
}
