package com.at.apcss.fm.farm.service;

import java.util.List;

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
	 * @param FarmerSnCertificationInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmerSnCertificationInfoVO selectFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO) throws Exception;

	public List<FarmerSnCertificationInfoVO> selectFarmerSnCertificationInfoList(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO) throws Exception;

	public int updateFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO) throws Exception;

	public int multiSaveFarmerSnCertificationInfoList(List<FarmerSnCertificationInfoVO> FarmerSnCertificationInfoVOList) throws Exception;

	public int insertFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVOList) throws Exception;

	public int insertLogFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVOList) throws Exception;

	public int deleteFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO) throws Exception;

	/**
	 * 전체 농업인 번호 리스트 조회
	 * @param
	 * @return List<FarmerInfoVO>
	 * @throws Exception
	 */
	public List<FarmerSnCertificationInfoVO> selectFrmerSnList(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO) throws Exception;

}
