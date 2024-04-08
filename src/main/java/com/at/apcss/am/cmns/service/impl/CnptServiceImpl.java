package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.mapper.CnptMapper;
import com.at.apcss.am.cmns.service.CnptService;
import com.at.apcss.am.cmns.vo.CnptVO;
import com.at.apcss.am.cmns.vo.LgszMrktVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.ComCryptoService;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : CnptServiceImpl.java
 * @Description : 거래처정보관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("cnptService")
public class CnptServiceImpl extends BaseServiceImpl implements CnptService {

	@Autowired
	private CnptMapper cnptMapper;

	/** 암호화서비스 */
    @Resource(name="comCryptoService")
    ComCryptoService comCryptoService;

	@Override
	public CnptVO selectCnpt(CnptVO cnptVO) throws Exception {

		CnptVO resultVO = cnptMapper.selectCnpt(cnptVO);

		return resultVO;
	}

	@Override
	public List<CnptVO> selectCnptList(CnptVO cnptVO) throws Exception {

		List<CnptVO> resultList = cnptMapper.selectCnptList(cnptVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertCnptList(List<CnptVO> cnptList) throws Exception {

		if (cnptList == null || cnptList.isEmpty()) {
			ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상");	// W0005	{0}이/가 없습니다.
		}

		for ( CnptVO cnptVO : cnptList ) {
			cnptMapper.insertCnpt(cnptVO);
		}

		return null;
	}

	@Override
	public int insertCnpt(CnptVO cnptVO) throws Exception {

		int insertedCnt = cnptMapper.insertCnpt(cnptVO);

		return insertedCnt;
	}

	@Override
	public int updateCnpt(CnptVO cnptVO) throws Exception {

		int updatedCnt = cnptMapper.updateCnpt(cnptVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> deleteCnpt(CnptVO cnptVO) throws Exception {


		String errMsg = cnptDelible(cnptVO);
		if(errMsg == null) {
			if(0 == cnptMapper.deleteCnpt(cnptVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
			}

		}else {
			return ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, errMsg); // E0000	{0}
		}

		return null;
	}

	@Override
	public LgszMrktVO selectLgszMrkt(String apcCd, String lgszMrktCd) throws Exception {

		LgszMrktVO lgszMrktVO = new LgszMrktVO();
		lgszMrktVO.setApcCd(apcCd);
		lgszMrktVO.setLgszMrktCd(lgszMrktCd);

		LgszMrktVO resultVO = selectLgszMrkt(lgszMrktVO);

		if (StringUtils.hasText(resultVO.getPswd())) {
			String decryptedPswd = comCryptoService.decrypt(resultVO.getPswd());
			resultVO.setPswd(decryptedPswd);
		}

		return resultVO;
	}

	@Override
	public LgszMrktVO selectLgszMrkt(LgszMrktVO lgszMrktVO) throws Exception {

		LgszMrktVO resultVO = cnptMapper.selectLgszMrkt(lgszMrktVO);

		return resultVO;
	}


	@Override
	public List<LgszMrktVO> selectLgszMrktList(LgszMrktVO lgszMrktVO) throws Exception {

		List<LgszMrktVO> resultList = cnptMapper.selectLgszMrktList(lgszMrktVO);

		return resultList;
	}

	@Override
	public int updateLgszMrkt(LgszMrktVO lgszMrktVO) throws Exception {

		int updatedCnt = cnptMapper.updateLgszMrkt(lgszMrktVO);

		return updatedCnt;
	}

	@Override
	public HashMap<String, Object> insertLgszMrktList(List<LgszMrktVO> lgszMrktList) throws Exception {

		if (lgszMrktList == null || lgszMrktList.isEmpty()) {
			ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상");	// W0005	{0}이/가 없습니다.
		}

		for ( LgszMrktVO lgszMrktVO : lgszMrktList ) {
			cnptMapper.insertLgszMrkt(lgszMrktVO);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> multiCnptLgszMrktList(List<CnptVO> cnptList, List<LgszMrktVO> lgszMrktList) throws Exception{

		if(lgszMrktList.size() > 0) {
			for (LgszMrktVO lgszMrktVO : lgszMrktList) {

				if (StringUtils.hasText(lgszMrktVO.getPswd())) {
					String hashedPswd = comCryptoService.encrypt(lgszMrktVO.getPswd());
					lgszMrktVO.setPswd(hashedPswd);
				}

				if(0 == updateLgszMrkt(lgszMrktVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}

		if(cnptList.size() > 0) {
			for (CnptVO cnptVO : cnptList) {

				if (ComConstants.ROW_STS_INSERT.equals(cnptVO.getRowSts())) {
					if(0 == insertCnpt(cnptVO)){
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
				if (ComConstants.ROW_STS_UPDATE.equals(cnptVO.getRowSts())) {
					if(0 == updateCnpt(cnptVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}
		}

		return null;
	}

	@Override
	public String cnptDelible(CnptVO cnptVO) throws Exception {
		List<CnptVO> resultList = cnptMapper.cnptDelible(cnptVO);

		if(resultList.size() > 0) {
			String delible = "해당 거래처는 ";
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

	@Override
	public HashMap<String, Object> updateCnptList(List<CnptVO> cnptList) throws Exception {
		for (CnptVO cnptVO : cnptList) {
			updateApcCnpt(cnptVO);
		}
		return null;
	}

	@Override
	public int updateApcCnpt(CnptVO cnptVO) throws Exception {
		cnptMapper.updateApcCnpt(cnptVO);
		return 0;
	}

}
