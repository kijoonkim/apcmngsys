package com.apcmngsys.apcss.am.cmns.service.impl;


import com.apcmngsys.apcss.am.cmns.service.ApcCrtrUntprcService;
import com.apcmngsys.apcss.am.cmns.mapper.ApcCrtrUntprcMapper;
import com.apcmngsys.apcss.am.cmns.vo.ApcCrtrUntprcVO;
import com.apcmngsys.apcss.co.constants.ComConstants;
import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;
import com.apcmngsys.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : ApcCrtrUntprcServiceImpl.java
 * @Description : APC기준단가 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2025.11.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.11.07  김호        최초 생성
 * </pre>
 */
@Service("apcCrtrUntprcService")
public class ApcCrtrUntprcServiceImpl extends BaseServiceImpl implements ApcCrtrUntprcService {

	@Autowired
	private ApcCrtrUntprcMapper apcCrtrUntprcMapper;

	@Override
	public List<ApcCrtrUntprcVO> selectApcCrtrUntprcList(ApcCrtrUntprcVO apcCrtrUntprcVO) throws Exception {
		return apcCrtrUntprcMapper.selectApcCrtrUntprcList(apcCrtrUntprcVO);
	}

	@Override
	public int insertApcCrtrUntprc(ApcCrtrUntprcVO apcCrtrUntprcVO) throws Exception {
		return apcCrtrUntprcMapper.insertApcCrtrUntprc(apcCrtrUntprcVO);
	}

	@Override
	public int updateApcCrtrUntprc(ApcCrtrUntprcVO apcCrtrUntprcVO) throws Exception {
		return apcCrtrUntprcMapper.updateApcCrtrUntprc(apcCrtrUntprcVO);
	}

	@Override
	public HashMap<String, Object> deleteApcCrtrUntprc(ApcCrtrUntprcVO apcCrtrUntprcVO) throws Exception {
		HashMap<String, Object> rtnObj = new HashMap<>();

		if (0 == apcCrtrUntprcMapper.deleteApcCrtrUntprc(apcCrtrUntprcVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}
		return null;
	}

	@Override
	public HashMap<String, Object> multiSaveApcCrtrUntprcList(List<ApcCrtrUntprcVO> apcCrtrUntprcList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();
		List<ApcCrtrUntprcVO> insertApcCrtrUntprcList = new ArrayList<>();
		List<ApcCrtrUntprcVO> updateApcCrtrUntprcList = new ArrayList<>();

		for (ApcCrtrUntprcVO apcCrtrUntprcVO : apcCrtrUntprcList) {
			if (ComConstants.ROW_STS_INSERT.equals(apcCrtrUntprcVO.getRowSts())) {
				insertApcCrtrUntprcList.add(apcCrtrUntprcVO);
			}
			if (ComConstants.ROW_STS_UPDATE.equals(apcCrtrUntprcVO.getRowSts())) {
				updateApcCrtrUntprcList.add(apcCrtrUntprcVO);
			}
		}

		if (!insertApcCrtrUntprcList.isEmpty()) {
			for (ApcCrtrUntprcVO apcCrtrUntprcVO : insertApcCrtrUntprcList) {
				if (0 == insertApcCrtrUntprc(apcCrtrUntprcVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		if (!updateApcCrtrUntprcList.isEmpty()) {
			for (ApcCrtrUntprcVO apcCrtrUntprcVO : updateApcCrtrUntprcList) {
				if (0 == updateApcCrtrUntprc(apcCrtrUntprcVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		return null;
	}
}
