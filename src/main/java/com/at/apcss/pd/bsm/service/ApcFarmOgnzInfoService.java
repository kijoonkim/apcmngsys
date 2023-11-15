package com.at.apcss.pd.bsm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.ApcFarmOgnzInfoVO;


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
public interface ApcFarmOgnzInfoService {

	/**
	 * 정보를 조회한다.
	 * @param apcFarmOgnzInfoVO
	 * @return
	 * @throws Exception
	 */
	public ApcFarmOgnzInfoVO selectApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;

	public List<ApcFarmOgnzInfoVO> selectApcFarmOgnzInfoList(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;

	public int insertApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;

	public int updateApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;

	public int multiSaveApcFarmOgnzInfoList(List<ApcFarmOgnzInfoVO> apcFarmOgnzInfoVOList) throws Exception;

	public int insertMegerApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVOList) throws Exception;
	public int insertMegerLogApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVOList) throws Exception;

	public int insertMegerApcFarmOgnzInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogApcFarmOgnzInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVOList) throws Exception;

	public int deleteApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;

}
