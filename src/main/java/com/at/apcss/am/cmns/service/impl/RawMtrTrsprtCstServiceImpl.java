package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.RawMtrTrsprtCstMapper;
import com.at.apcss.am.cmns.service.RawMtrTrsprtCstService;
import com.at.apcss.am.cmns.vo.RawMtrTrsprtCstVO;

/**
 * @Class Name : RawMtrTrsprtCstServiceImpl.java
 * @Description : 원물운임비용등록 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 하민우
 * @since 2023.08.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.04  하민우        최초 생성
 * </pre>
 */
@Service("rawMtrTrsprtCstService")
public class RawMtrTrsprtCstServiceImpl implements RawMtrTrsprtCstService {
	
	@Autowired
	private RawMtrTrsprtCstMapper rawMtrTrsprtCstMapper;

	@Override
	public List<RawMtrTrsprtCstVO> selectRawMtrTrsprtCstList(RawMtrTrsprtCstVO RawMtrTrsprtCstVO) throws Exception {
		return rawMtrTrsprtCstMapper.selectRawMtrTrsprtCstList(RawMtrTrsprtCstVO);
	}

	@Override
	public int insertRawMtrTrsprtCst(RawMtrTrsprtCstVO RawMtrTrsprtCstVO) throws Exception {
		return rawMtrTrsprtCstMapper.insertRawMtrTrsprtCst(RawMtrTrsprtCstVO);
	}

	@Override
	public int updateRawMtrTrsprtCst(RawMtrTrsprtCstVO RawMtrTrsprtCstVO) throws Exception {
		return rawMtrTrsprtCstMapper.updateRawMtrTrsprtCst(RawMtrTrsprtCstVO);
	}

	@Override
	public int deleteRawMtrTrsprtCst(RawMtrTrsprtCstVO RawMtrTrsprtCstVO) throws Exception {
		return rawMtrTrsprtCstMapper.deleteRawMtrTrsprtCst(RawMtrTrsprtCstVO);
	}

}
