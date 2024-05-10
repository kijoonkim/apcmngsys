package com.at.apcss.fm.farm.service;

import java.util.List;

import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoRegVO;


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
public interface FarmLandGrantsInfoRegService {

	/**
	 * 정보를 조회한다.
	 * @param FarmLandGrantsInfoRegVO
	 * @return
	 * @throws Exception
	 */
	public FarmLandGrantsInfoRegVO selectFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO) throws Exception;

	public List<FarmLandGrantsInfoRegVO> selectFarmLandGrantsInfoRegList(FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO) throws Exception;

	public int insertFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO) throws Exception;

	public int deleteFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO) throws Exception;

}
