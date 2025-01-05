package com.at.apcss.am.spmt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.spmt.mapper.SpmtPurSalCrtrInfoMapper;
import com.at.apcss.am.spmt.service.SpmtPurSalCrtrInfoService;
import com.at.apcss.am.spmt.vo.SpmtPurSalCrtrInfoVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

@Service("spmtPurSalCrtrInfoService")
public class SpmtPurSalCrtrInfoServiceImpl extends BaseServiceImpl implements SpmtPurSalCrtrInfoService {

	@Autowired
	private SpmtPurSalCrtrInfoMapper spmtPurSalCrtrInfoMapper;
	
	@Override
	public List<SpmtPurSalCrtrInfoVO> selectSpmtPusrSalCrtrInfoList(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO) throws Exception {
		List<SpmtPurSalCrtrInfoVO> result = spmtPurSalCrtrInfoMapper.selectSpmtPusrSalCrtrInfoList(spmtPurSalCrtrInfoVO);
		return result;
	}
	
	@Override
	public List<SpmtPurSalCrtrInfoVO> selectSpmtPusrSalCrtrInfoDtlList(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO) throws Exception {
		List<SpmtPurSalCrtrInfoVO> result = spmtPurSalCrtrInfoMapper.selectSpmtPusrSalCrtrInfoDtlList(spmtPurSalCrtrInfoVO);
		return result;
	}

	@Override
	public int insertSlsCrtrInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO) throws Exception {
		String status = spmtPurSalCrtrInfoVO.getGubun();
		int result = 0;
		if(status.equals("insert")) {
			result = spmtPurSalCrtrInfoMapper.insertSlsCrtrInfo(spmtPurSalCrtrInfoVO);
		}else if(status.equals("update")) {
			result = spmtPurSalCrtrInfoMapper.updateSlsCrtrInfo(spmtPurSalCrtrInfoVO);
		}
		return result;
	}

	@Override
	public int insertSlsCrtrDtlInfo(List<SpmtPurSalCrtrInfoVO> slsDtlVOList) throws Exception {
		// TODO Auto-generated method stub
		int result =0;
		slsDtlVOList.forEach(item->{
		String status =item.getGubun();
			if(status.equals("insert")) {
				spmtPurSalCrtrInfoMapper.insertSlsCrtrDtlInfo(item);
			}else if(status.equals("update")) {
				spmtPurSalCrtrInfoMapper.updateSlsCrtrDtlInfo(item);
			}
		});
		return result;
	}

	@Override
	public int deleteSpmtPurSalCrtrInfo(SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO) {
		int result = spmtPurSalCrtrInfoMapper.deleteSpmtPurSalCrtrInfo(spmtPurSalCrtrInfoVO);
		result = spmtPurSalCrtrInfoMapper.deleteSpmtPurSalCrtrDtlInfo(spmtPurSalCrtrInfoVO);
		return result;
	}
	
	
}
