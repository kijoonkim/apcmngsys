package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.BffaSortMapper;
import com.at.apcss.am.cmns.service.BffaSortService;
import com.at.apcss.am.cmns.vo.BffaSortVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : BffaSortServiceImpl.java
 * @Description : 상품정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("bffaSortService")
public class BffaSortServiceImpl extends BaseServiceImpl implements BffaSortService {

	@Autowired
	private BffaSortMapper bffaSortMapper;

	

	@Override
	public List<BffaSortVO> selectBffaSortTypeList(BffaSortVO bffaSortVO) throws Exception {
		List<BffaSortVO> result = bffaSortMapper.selectBffaSortTypeList(bffaSortVO);
		return result;
	}
	@Override
	public List<BffaSortVO> selectBffaSortKndList(BffaSortVO bffaSortVO) throws Exception {
		List<BffaSortVO> result = bffaSortMapper.selectBffaSortKndList(bffaSortVO);
		return result;
	}
	
	@Override
	public List<BffaSortVO> selectBffaSortDtlList(BffaSortVO bffaSortVO) throws Exception {
		List<BffaSortVO> result = bffaSortMapper.selectBffaSortDtlList(bffaSortVO);
		return result;
	}

	@Override
	public int insertBffaSortKnd(BffaSortVO bffaSortVO) throws Exception {
		bffaSortMapper.insertBffaSortKnd(bffaSortVO);
		return 0;
	}

	@Override
	public int updateBffaSortKnd(BffaSortVO bffaSortVO) throws Exception {
		bffaSortMapper.updateBffaSortKnd(bffaSortVO);
		return 0;
	}

	@Override
	public int deleteBffaSortKnd(BffaSortVO bffaSortVO) throws Exception {
		bffaSortMapper.deleteBffaSortKnd(bffaSortVO);
		bffaSortMapper.deleteBffaSortDtlAll(bffaSortVO);
		return 0;
	}
	
	@Override
	public int insertBffaSortDtl(BffaSortVO bffaSortVO) throws Exception {
		bffaSortMapper.insertBffaSortDtl(bffaSortVO);
		return 0;
	}

	@Override
	public int updateBffaSortDtl(BffaSortVO bffaSortVO) throws Exception {
		bffaSortMapper.updateBffaSortDtl(bffaSortVO);
		return 0;
	}

	@Override
	public int deleteBffaSortDtl(BffaSortVO bffaSortVO) throws Exception {
		bffaSortMapper.deleteBffaSortDtl(bffaSortVO);
		return 0;
	}
	
	

	

}
