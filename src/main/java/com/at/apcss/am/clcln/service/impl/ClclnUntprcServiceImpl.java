package com.at.apcss.am.clcln.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.clcln.mapper.ClclnUntprcMapper;
import com.at.apcss.am.clcln.service.ClclnUntprcService;
import com.at.apcss.am.clcln.vo.ClclnUntprcVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : ClclnUntprcServiceImpl.java
 * @Description : 정산단가 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
@Service("clclnUntprcService")
public class ClclnUntprcServiceImpl extends BaseServiceImpl implements ClclnUntprcService {

	@Autowired
	private ClclnUntprcMapper clclnUntprcMapper;

	@Override
	public ClclnUntprcVO selectClclnUntprc(ClclnUntprcVO clclnUntprcVO) throws Exception {
		
		ClclnUntprcVO rtnVO = clclnUntprcMapper.selectClclnUntprc(clclnUntprcVO);
		
		return rtnVO;
	}

	@Override
	public List<ClclnUntprcVO> selectClclnUntprcList(ClclnUntprcVO clclnUntprcVO) throws Exception {

		List<ClclnUntprcVO> rtnList = clclnUntprcMapper.selectClclnUntprcList(clclnUntprcVO);
		
		return rtnList;
	}

	@Override
	public HashMap<String, Object> updateClclnUntprcList(List<ClclnUntprcVO> clclnUntprcList) throws Exception {
		
		for ( ClclnUntprcVO clclnUntprcVO : clclnUntprcList ) {
			
			ClclnUntprcVO chkVO = selectClclnUntprc(clclnUntprcVO);
			
			if (chkVO == null || !StringUtils.hasText(chkVO.getApcCd())) {
				clclnUntprcMapper.insertClclnUntprc(clclnUntprcVO);
			} else {
				clclnUntprcMapper.updateClclnUntprc(clclnUntprcVO);
			}
		}
		
		return null;
	}
	
	


}
