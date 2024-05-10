package com.at.apcss.fm.farm.service;

import java.util.List;

import com.at.apcss.fm.farm.vo.NonCompliantFarmerInfoVO;


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
public interface NonCompliantFarmerInfoService {

	/**
	 * 정보를 조회한다.
	 * @param NonCompliantFarmerInfoVO
	 * @return
	 * @throws Exception
	 */
	public NonCompliantFarmerInfoVO selectNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception;

	public List<NonCompliantFarmerInfoVO> selectNonCompliantFarmerInfoList(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception;

	public int updateNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception;

	public int multiSaveNonCompliantFarmerInfoList(List<NonCompliantFarmerInfoVO> NonCompliantFarmerInfoVOList) throws Exception;

	public int insertNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVOList) throws Exception;

	public int insertLogNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVOList) throws Exception;

	public int deleteNonCompliantFarmerInfo(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception;

	/**
	 * 전체 농업인 번호 리스트 조회
	 * @param
	 * @return List<FarmerInfoVO>
	 * @throws Exception
	 */
	public List<NonCompliantFarmerInfoVO> selectFrmerSnList(NonCompliantFarmerInfoVO NonCompliantFarmerInfoVO) throws Exception;

}
