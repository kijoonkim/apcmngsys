package com.at.apcss.fm.farm.service;

import java.util.List;

import com.at.apcss.fm.farm.vo.FarmerGrantsInfoVO;


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
public interface FarmerGrantsInfoService {

	/**
	 * 정보를 조회한다.
	 * @param FarmerGrantsInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmerGrantsInfoVO selectFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVO) throws Exception;

	public List<FarmerGrantsInfoVO> selectFarmerGrantsInfoList(FarmerGrantsInfoVO FarmerGrantsInfoVO) throws Exception;

	public int updateFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVO) throws Exception;

	public int multiSaveFarmerGrantsInfoList(List<FarmerGrantsInfoVO> FarmerGrantsInfoVOList) throws Exception;

	public int insertFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVOList) throws Exception;

	public int insertLogFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVOList) throws Exception;

	public int deleteFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVO) throws Exception;

	/**
	 * 전체 농업인 번호 리스트 조회
	 * @param
	 * @return List<FarmerInfoVO>
	 * @throws Exception
	 */
	public List<FarmerGrantsInfoVO> selectFrmerSnList(FarmerGrantsInfoVO FarmerGrantsInfoVO) throws Exception;

}
