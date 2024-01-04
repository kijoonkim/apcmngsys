package com.at.apcss.am.spmt.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.spmt.mapper.SpmtDocMapper;
import com.at.apcss.am.spmt.service.SpmtDocService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SpmtDocServiceImpl.java
 * @Description : 송품장 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("spmtDocService")
public class SpmtDocServiceImpl extends BaseServiceImpl implements SpmtDocService {

	@Autowired
	private SpmtDocMapper spmtDocMapper;

	@Override
	public List<HashMap<String, Object>> selectSpmtDocList(HashMap<String, Object> paramMap) throws Exception {
		
		List<HashMap<String, Object>> spmtDocList = spmtDocMapper.selectSpmtDocMapList(paramMap);
		
		if (spmtDocList != null) {
			for ( HashMap<String, Object> spmtDoc : spmtDocList) {
				List<HashMap<String, Object>> spmtDocDtlList = spmtDocMapper.selectSpmtDocDtlMapList(spmtDoc);
				spmtDoc.put("INVEN_DETAIL", spmtDocDtlList);
			}
		}
		
		return spmtDocList;
	}
}
