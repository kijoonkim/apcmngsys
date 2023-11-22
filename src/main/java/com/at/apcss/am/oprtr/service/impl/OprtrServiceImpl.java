package com.at.apcss.am.oprtr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.oprtr.mapper.OprtrMapper;
import com.at.apcss.am.oprtr.service.OprtrService;
import com.at.apcss.am.oprtr.vo.OprtrVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
/**
 * @Class Name : OprtrServiceImpl.java
 * @Description : 작업생산자 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김 호        최초 생성
 * </pre>
 */
@Service("oprtrService")
public class OprtrServiceImpl extends BaseServiceImpl implements OprtrService {

	@Autowired
	private OprtrMapper oprtrMapper;

	@Override
	public OprtrVO selectOprtr(OprtrVO oprtrVO) throws Exception {
		return oprtrMapper.selectOprtr(oprtrVO);
	}

	@Override
	public List<OprtrVO> selectOprtrList(OprtrVO oprtrVO) throws Exception {
		return oprtrMapper.selectOprtrList(oprtrVO);
	}

	@Override
	public int insertOprtr(OprtrVO oprtrVO) throws Exception {
		return oprtrMapper.insertOprtr(oprtrVO);
	}

	@Override
	public int updateOprtr(OprtrVO oprtrVO) throws Exception {
		return oprtrMapper.updateOprtr(oprtrVO);
	}

	@Override
	public int deleteOprtr(OprtrVO oprtrVO) throws Exception {
		return oprtrMapper.deleteOprtr(oprtrVO);
	}
}
