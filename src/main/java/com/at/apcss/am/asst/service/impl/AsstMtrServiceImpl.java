package com.at.apcss.am.asst.service.impl;

import java.util.Arrays;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.asst.mapper.AsstMtrMapper;
import com.at.apcss.am.asst.service.AsstMtrService;
import com.at.apcss.am.asst.vo.AsstMtrVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : SortFcltServiceImpl.java
 * @Description : 선별설비정보 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @param <SortFcltVO>
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.03  박승진        최초 생성
 * </pre>
 */
@Service("asstMtrService")
public class AsstMtrServiceImpl extends BaseServiceImpl implements AsstMtrService {

	@Autowired
	private AsstMtrMapper asstMtrMapper;

	@Override
	public List<AsstMtrVO> selectAsstMtrCrtrInfoList(AsstMtrVO asstMtrVO) throws Exception {
		// TODO Auto-generated method stub
		List<AsstMtrVO> result = asstMtrMapper.selectAsstMtrCrtrInfoList(asstMtrVO);

		return result;
	}

	@Override
	public int insertAsstMtrCrtrInfo(AsstMtrVO asstMtrVO) throws Exception {
		// TODO Auto-generated method stub
		String status = asstMtrVO.getStatus();
		int result = 0;
		if(status.equals("3")) {
			result = asstMtrMapper.insertAsstMtrCrtrInfo(asstMtrVO);
		}else if(status.equals("2")) {
			result = asstMtrMapper.updateAsstMtrCrtrInfo(asstMtrVO);
		}
		return result;
	}

	@Override
	public int insertAsstMtrCrtrDtlInfo(List<AsstMtrVO> asstMtrVOList) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		asstMtrVOList.forEach(item->{
		String status = item.getStatus();
			if(status.equals("3")) {
				asstMtrMapper.insertAsstMtrCrtrDtlInfo(item);
			}else if(status.equals("2")) {
				asstMtrMapper.updateAsstMtrCrtrDtlInfo(item);
			}
		});
		return result;
	}

	@Override
	public List<AsstMtrVO> selectAsstMtrCrtrInfoDtlList(AsstMtrVO asstMtrVO) throws Exception {
		// TODO Auto-generated method stub
		List<AsstMtrVO> result = asstMtrMapper.selectAsstMtrCrtrInfoDtlList(asstMtrVO);
		return result;
	}






}
