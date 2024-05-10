package com.at.apcss.fm.farm.service;

import java.util.List;

import com.at.apcss.fm.farm.vo.FarmerEducationInfoVO;


/**
 * 농업인 교육 이수 연계 정보 Service 인터페이스
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
	 * @param FarmerEducationInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmerEducationInfoVO selectFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception;

	public List<FarmerEducationInfoVO> selectFarmerEducationInfoList(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception;

	public int insertFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception;

	public int updateFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception;

	public int multiSaveFarmerEducationInfoList(List<FarmerEducationInfoVO> FarmerEducationInfoVOList) throws Exception;

	public int insertMergeFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVOList) throws Exception;

	public int insertLogFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVOList) throws Exception;

	public int deleteFarmerEducationInfo(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception;

	/**
	 * 전체 농업인 번호 리스트 조회
	 * @param
	 * @return List<FarmerInfoVO>
	 * @throws Exception
	 */
	public List<FarmerEducationInfoVO> selectFrmerSnList(FarmerEducationInfoVO FarmerEducationInfoVO) throws Exception;

}
