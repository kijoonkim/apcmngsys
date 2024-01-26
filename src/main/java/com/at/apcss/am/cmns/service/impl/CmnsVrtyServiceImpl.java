package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsVrtyMapper;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : CmnsVrtyServiceImpl.java
 * @Description : 품종정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cmnsVrtyService")
public class CmnsVrtyServiceImpl extends BaseServiceImpl implements CmnsVrtyService {

	@Autowired
	private CmnsVrtyMapper cmnsVrtyMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public CmnsVrtyVO selectCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		CmnsVrtyVO resultVO = cmnsVrtyMapper.selectCmnsVrty(cmnsVrtyVO);

		return resultVO;
	}

	@Override
	public List<CmnsVrtyVO> selectCmnsVrtyList(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		List<CmnsVrtyVO> resultList = cmnsVrtyMapper.selectCmnsVrtyList(cmnsVrtyVO);

		return resultList;
	}

	@Override
	public int insertCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int insertedCnt = cmnsVrtyMapper.insertCmnsVrty(cmnsVrtyVO);

		return insertedCnt;
	}

	@Override
	public int updateCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int updatedCnt = cmnsVrtyMapper.updateCmnsVrty(cmnsVrtyVO);

		return updatedCnt;
	}

	@Override
	public int deleteCmnsVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int deletedCnt = cmnsVrtyMapper.deleteCmnsVrty(cmnsVrtyVO);

		return deletedCnt;
	}

	@Override
	public CmnsVrtyVO selectApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		CmnsVrtyVO resultVO = cmnsVrtyMapper.selectApcVrty(cmnsVrtyVO);

		return resultVO;
	}

	@Override
	public List<CmnsVrtyVO> selectApcVrtyList(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		List<CmnsVrtyVO> resultList = cmnsVrtyMapper.selectApcVrtyList(cmnsVrtyVO);

		return resultList;
	}

	@Override
	public int insertApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int insertedCnt = cmnsVrtyMapper.insertApcVrty(cmnsVrtyVO);

		return insertedCnt;
	}

	@Override
	public int updateApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		int updatedCnt = cmnsVrtyMapper.updateApcVrty(cmnsVrtyVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteApcVrty(CmnsVrtyVO cmnsVrtyVO) throws Exception {

		String errMsg = vrtyDelible(cmnsVrtyVO);

		if(errMsg == null ) {

			if(0 == cmnsVrtyMapper.deleteApcVrty(cmnsVrtyVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
			}

		}else {
			return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errMsg); // E0000	{0}
		}
		return null;
	}

	@Override
	public int deleteApcVrtyAll(CmnsVrtyVO cmnsVrtyVO) throws Exception {
		int deletedCnt = cmnsVrtyMapper.deleteApcVrtyAll(cmnsVrtyVO);
		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> multiSaveApcVrtyList(List<CmnsVrtyVO> cmnsVrtyList) throws Exception {
		for (CmnsVrtyVO cmnsVrtyVO : cmnsVrtyList) {
			if(ComConstants.ROW_STS_INSERT.equals(cmnsVrtyVO.getRowSts())) {

				if(0 == insertApcVrty(cmnsVrtyVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
				}

			}
			if(ComConstants.ROW_STS_UPDATE.equals(cmnsVrtyVO.getRowSts())) {

				if(0 == updateApcVrty(cmnsVrtyVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}
		return null;
	}

	// 품종 삭제 가능 여부
	@Override
	public String vrtyDelible(CmnsVrtyVO cmnsVrtyVO) throws Exception {
		// 품종 관련 테이블 등록 리스트 찾기
		List<CmnsVrtyVO> resultList = cmnsVrtyMapper.vrtyDelible(cmnsVrtyVO);


		if(resultList.size() > 0) {
			String delible = "해당 품종은 ";
			for (int i = 0; i < resultList.size(); i++) {
				if(i == 0) {
					delible += resultList.get(i).getDelible();
				}else {
					delible += ", "+resultList.get(i).getDelible();
				}
			}
			delible += "이/가 존재 합니다.";

			return delible;
		}

		return null;
	}

}
