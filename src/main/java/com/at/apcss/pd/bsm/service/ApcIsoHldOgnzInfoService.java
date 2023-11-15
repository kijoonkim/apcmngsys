package com.at.apcss.pd.bsm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.ApcIsoHldOgnzInfoVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface ApcIsoHldOgnzInfoService {

	/**
	 * 정보를 조회한다.
	 * @param apcIsoHldOgnzInfoVO
	 * @return
	 * @throws Exception
	 */
	public ApcIsoHldOgnzInfoVO selectApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;

	public List<ApcIsoHldOgnzInfoVO> selectApcIsoHldOgnzInfoList(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;

	public int insertApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;

	public int updateApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;

	public int multiSaveApcIsoHldOgnzInfoList(List<ApcIsoHldOgnzInfoVO> apcIsoHldOgnzInfoVOList) throws Exception;

	public int insertMegerApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVOList) throws Exception;
	public int insertMegerLogApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVOList) throws Exception;

	public int insertMegerApcIsoHldOgnzInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogApcIsoHldOgnzInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVOList) throws Exception;

	public int deleteApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;

}
