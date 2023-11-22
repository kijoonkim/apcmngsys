package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.farm.vo.FarmerSnCertificationInfoVO;

/**
 * 게시판 Mapper 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Mapper
public interface FarmerSnCertificationInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmerSnCertificationInfoVO selectFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO);

	public List<FarmerSnCertificationInfoVO> selectFarmerSnCertificationInfoList(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO);

	public int insertFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO);

	public int updateFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO);

	public int insertMegerFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;
	public int insertMegerLogFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;

	public int insertMegerFarmerSnCertificationInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmerSnCertificationInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;

	public int deleteFarmerSnCertificationInfo(FarmerSnCertificationInfoVO farmerSnCertificationInfoVO) throws Exception;
}
