package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerSnCertificationInfoVO;


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
public interface FarmerSnCertificationInfoService {

	/**
	 * 정보를 조회한다.
	 * @param farmerSnCertificationInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmerSnCertificationInfoVO selectFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;

	public List<FarmerSnCertificationInfoVO> selectFarmerSnCertificationInfoList(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;

	public int insertFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;

	public int updateFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;

	public int multiSaveFarmerSnCertificationInfoList(List<FarmerSnCertificationInfoVO> farmerSnCertificationInfoVOList) throws Exception;

	public int insertMegerFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVOList) throws Exception;
	public int insertMegerLogFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVOList) throws Exception;

	public int insertMegerFarmerSnCertificationInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmerSnCertificationInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVOList) throws Exception;

	public int deleteFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;

}
