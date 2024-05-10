package com.at.apcss.fm.farm.service;

import java.util.List;

import com.at.apcss.fm.farm.vo.FarmerEducationInfoRegVO;


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
public interface FarmerEducationInfoRegService {

	/**
	 * 정보를 조회한다.
	 * @param farmerEducationInfoRegVO
	 * @return
	 * @throws Exception
	 */
	public FarmerEducationInfoRegVO selectFarmerEducationInfoReg(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception;

	public List<FarmerEducationInfoRegVO> selectFarmerEducationInfoRegList(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception;

	public int insertFarmerEducationInfoReg(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception;

	//public int updateFarmerEducationInfoReg(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception;

	//public int multiSaveFarmerEducationInfoRegList(List<FarmerEducationInfoRegVO> farmerEducationInfoRegVOList) throws Exception;

	public int deleteFarmerEducationInfoReg(FarmerEducationInfoRegVO farmerEducationInfoRegVO) throws Exception;

}
