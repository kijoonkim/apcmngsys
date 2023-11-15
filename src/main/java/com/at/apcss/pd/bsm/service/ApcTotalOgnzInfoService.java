package com.at.apcss.pd.bsm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.ApcTotalOgnzInfoVO;


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
public interface ApcTotalOgnzInfoService {

	/**
	 * 정보를 조회한다.
	 * @param apcTotalOgnzInfoVO
	 * @return
	 * @throws Exception
	 */
	public ApcTotalOgnzInfoVO selectApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;

	public List<ApcTotalOgnzInfoVO> selectApcTotalOgnzInfoList(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;

	public int insertApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;

	public int updateApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;

	public int multiSaveApcTotalOgnzInfoList(List<ApcTotalOgnzInfoVO> apcTotalOgnzInfoVOList) throws Exception;

	public int insertMegerApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVOList) throws Exception;
	public int insertMegerLogApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVOList) throws Exception;

	public int insertMegerApcTotalOgnzInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogApcTotalOgnzInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVOList) throws Exception;

	public int deleteApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;

}
