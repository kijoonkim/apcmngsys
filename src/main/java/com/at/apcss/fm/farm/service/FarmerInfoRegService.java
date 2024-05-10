package com.at.apcss.fm.farm.service;

import java.util.List;

import com.at.apcss.fm.farm.vo.FarmerInfoRegVO;


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
public interface FarmerInfoRegService {

	/**
	 * 정보를 조회한다.
	 * @param farmerInfoRegVO
	 * @return
	 * @throws Exception
	 */
	public FarmerInfoRegVO selectFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

	public List<FarmerInfoRegVO> selectFarmerInfoRegList(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

	public int insertFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

	public int updateFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

	public int multiSaveFarmerInfoRegList(List<FarmerInfoRegVO> farmerInfoRegVOList) throws Exception;

	public int deleteFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

}
