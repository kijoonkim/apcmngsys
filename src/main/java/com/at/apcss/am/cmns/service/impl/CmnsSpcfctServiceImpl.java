package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.CmnsSpcfctMapper;
import com.at.apcss.am.cmns.service.CmnsSpcfctService;
import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.vo.CmnsSpcfctVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : CmnsSpcfctServiceImpl.java
 * @Description : 규격정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cmnsSpcfctService")
public class CmnsSpcfctServiceImpl extends BaseServiceImpl implements CmnsSpcfctService {

	@Autowired
	private CmnsSpcfctMapper cmnsSpcfctMapper;

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;

	@Override
	public CmnsSpcfctVO selectCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		CmnsSpcfctVO resultVO = cmnsSpcfctMapper.selectCmnsSpcfct(cmnsSpcfctVO);

		return resultVO;
	}

	@Override
	public List<CmnsSpcfctVO> selectCmnsSpcfctList(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		List<CmnsSpcfctVO> resultList = cmnsSpcfctMapper.selectCmnsSpcfctList(cmnsSpcfctVO);

		return resultList;
	}

	@Override
	public int insertCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int insertedCnt = cmnsSpcfctMapper.insertCmnsSpcfct(cmnsSpcfctVO);

		return insertedCnt;
	}

	@Override
	public int updateCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int updatedCnt = cmnsSpcfctMapper.updateCmnsSpcfct(cmnsSpcfctVO);

		return updatedCnt;
	}

	@Override
	public int deleteCmnsSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int deletedCnt = cmnsSpcfctMapper.deleteCmnsSpcfct(cmnsSpcfctVO);

		return deletedCnt;
	}

	@Override
	public CmnsSpcfctVO selectApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		CmnsSpcfctVO resultVO = cmnsSpcfctMapper.selectApcSpcfct(cmnsSpcfctVO);

		return resultVO;
	}

	@Override
	public List<CmnsSpcfctVO> selectApcSpcfctList(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		List<CmnsSpcfctVO> resultList = cmnsSpcfctMapper.selectApcSpcfctList(cmnsSpcfctVO);

		return resultList;
	}

	@Override
	public int insertApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int insertedCnt = cmnsSpcfctMapper.insertApcSpcfct(cmnsSpcfctVO);

		return insertedCnt;
	}

	@Override
	public int updateApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		int updatedCnt = cmnsSpcfctMapper.updateApcSpcfct(cmnsSpcfctVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteApcSpcfct(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		String errMsg = spcfctDelible(cmnsSpcfctVO);
		if(errMsg == null) {
			if(0 == cmnsSpcfctMapper.deleteApcSpcfct(cmnsSpcfctVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
			}

		}else {
			return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errMsg); // E0000	{0}
		}
		return null;
	}

	@Override
	public int deleteApcSpcfctAll(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {
		return cmnsSpcfctMapper.deleteApcSpcfctAll(cmnsSpcfctVO);
	}

	@Override
	public HashMap<String, Object> multiApcSpcfct(List<CmnsSpcfctVO> cmnsSpcfctList) throws Exception {
		for (CmnsSpcfctVO cmnsSpcfctVO : cmnsSpcfctList) {
			if(ComConstants.ROW_STS_INSERT.equals(cmnsSpcfctVO.getRowSts())) {

				if(0 == insertApcSpcfct(cmnsSpcfctVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
			if(ComConstants.ROW_STS_UPDATE.equals(cmnsSpcfctVO.getRowSts())) {

				if(0 == updateApcSpcfct(cmnsSpcfctVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		return null;
	}

	@Override
	public String spcfctDelible(CmnsSpcfctVO cmnsSpcfctVO) throws Exception {

		List<CmnsSpcfctVO> resultList = cmnsSpcfctMapper.spcfctDelible(cmnsSpcfctVO);

		if(resultList.size() > 0) {
			String delible = "해당 규격은 ";
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
