package com.at.apcss.am.cmns.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.at.apcss.am.cmns.mapper.CmnsValidationMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.vo.CmnsValidationVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : CmnsValidationServiceImpl.java
 * @Description : 업무별 Validation 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.21  신정철        최초 생성
 * </pre>
 */
@Service("cmnsValidationService")
public class CmnsValidationServiceImpl extends BaseServiceImpl implements CmnsValidationService{

	@Autowired
	private CmnsValidationMapper cmnsValidationMapper;

	@Override
	public String selectChkCdDelible(String apcCd, String cdId, String cdVl) throws Exception {

		CmnsValidationVO paramVO = new CmnsValidationVO();
		paramVO.setApcCd(apcCd);
		paramVO.setCdId(cdId);
		paramVO.setCdVl(cdVl);

		CmnsValidationVO resultVO = cmnsValidationMapper.selectChkCdDelible(paramVO);

		if (resultVO != null) {
			return resultVO.getRtnMsg();
		} else {
			return "error";
		}
	}

	@Override
	public CmnsValidationVO selectChkCdDelible(CmnsValidationVO cmnsValidationVO) throws Exception {

		CmnsValidationVO resultVO = cmnsValidationMapper.selectChkCdDelible(cmnsValidationVO);

		return resultVO;
	}

}
