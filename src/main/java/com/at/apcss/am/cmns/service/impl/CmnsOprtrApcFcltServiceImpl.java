package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.at.apcss.am.sort.vo.SortBffaGrdVO;
import com.at.apcss.am.sort.vo.SortBffaWrhsStdGrdVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsItemMapper;
import com.at.apcss.am.cmns.mapper.CmnsOprtrApcFcltMapper;
import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.service.CmnsOprtrApcFcltService;
import com.at.apcss.am.cmns.service.CmnsSpcfctService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.service.StdGrdService;
import com.at.apcss.am.cmns.vo.CmnsItemVO;
import com.at.apcss.am.cmns.vo.CmnsOprtrApcFcltVO;
import com.at.apcss.am.cmns.vo.CmnsSpcfctVO;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.am.cmns.vo.StdGrdJgmtVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : CmnsItemServiceImpl.java
 * @Description : 품목정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cmnsOprtrApcFcltService")
public class CmnsOprtrApcFcltServiceImpl extends BaseServiceImpl implements CmnsOprtrApcFcltService {

	@Autowired
	private CmnsOprtrApcFcltMapper cmnsOprtrApcFcltMapper;





	@Override
	public List<CmnsOprtrApcFcltVO> selectCmnsOprtrApcSortFcltList(CmnsOprtrApcFcltVO cmnsOprtrApcFcltVO) throws Exception {
		// TODO Auto-generated method stub
		List<CmnsOprtrApcFcltVO> result = cmnsOprtrApcFcltMapper.selectCmnsOprtrApcSortFcltList(cmnsOprtrApcFcltVO);
		return result;
	}





	@Override
	public HashMap<String, Object> updateCmnsOprtrApcSortFclt(CmnsOprtrApcFcltVO cmnsOprtrApcFcltVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}





	@Override
	public HashMap<String, Object> deleteCmnsOprtrApcSortFclt(CmnsOprtrApcFcltVO cmnsOprtrApcFcltVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}




}
