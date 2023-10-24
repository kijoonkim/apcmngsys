package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoVO;


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
public interface FarmerEducationInfoService {

	/**
	 * 정보를 조회한다.
	 * @param farmerEducationInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmerEducationInfoVO selectfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

	public List<FarmerEducationInfoVO> selectfarmerEducationInfoList(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

	public int insertFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

	public int updateFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

	public int multiSavefarmerEducationInfoList(List<FarmerEducationInfoVO> farmerEducationInfoVOList) throws Exception;

	public int insertMegerfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVOList) throws Exception;
	public int insertMegerLogfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVOList) throws Exception;

	public int insertMegerfarmerEducationInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogfarmerEducationInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVOList) throws Exception;

	public int deletefarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

}
