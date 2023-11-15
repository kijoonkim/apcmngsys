package com.at.apcss.pd.bsm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.ApcOgnzInfoVO;


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
public interface ApcOgnzInfoService {

	/**
	 * 정보를 조회한다.
	 * @param apcOgnzInfoVO
	 * @return
	 * @throws Exception
	 */
	public ApcOgnzInfoVO selectApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;

	public List<ApcOgnzInfoVO> selectApcOgnzInfoList(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;

	public int insertApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;

	public int updateApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;

	public int multiSaveApcOgnzInfoList(List<ApcOgnzInfoVO> apcOgnzInfoVOList) throws Exception;

	public int insertMegerApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVOList) throws Exception;
	public int insertMegerLogApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVOList) throws Exception;

	public int insertMegerApcOgnzInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogApcOgnzInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVOList) throws Exception;

	public int deleteApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;

}
