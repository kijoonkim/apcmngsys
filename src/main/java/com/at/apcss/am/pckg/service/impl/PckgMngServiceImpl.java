package com.at.apcss.am.pckg.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.pckg.mapper.PckgInptMapper;
import com.at.apcss.am.pckg.service.PckgCmndService;
import com.at.apcss.am.pckg.service.PckgInptService;
import com.at.apcss.am.pckg.service.PckgMngService;
import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.pckg.vo.PckgMngVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : PckgInptServiceImpl.java
 * @Description : 포장투입 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("pckgMngService")
public class PckgMngServiceImpl extends BaseServiceImpl implements PckgMngService {

	
	@Resource(name = "pckgCmndService")
	private PckgCmndService pckgCmndService;
	
	@Resource(name = "pckgInptService")
	private PckgInptService pckgInptService;
	
	@Resource(name = "pckgPrfmncService")
	private PckgPrfmncService pckgPrfmncService;

	@Override
	public HashMap<String, Object> insertPckgInpt(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> insertPckgPrfmnc(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> updatePckgInpt(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> updatePckgPrfmnc(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deletePckgInpt(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deletePckgPrfmnc(PckgMngVO pckgMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
