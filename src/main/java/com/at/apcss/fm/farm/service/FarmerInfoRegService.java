package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
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
	public FarmerInfoRegVO selectfarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

	public List<FarmerInfoRegVO> selectfarmerInfoRegList(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

	public int insertFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

	public int updateFarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

	public int multiSavefarmerInfoRegList(List<FarmerInfoRegVO> farmerInfoRegVOList) throws Exception;

	public int deletefarmerInfoReg(FarmerInfoRegVO farmerInfoRegVO) throws Exception;

}
