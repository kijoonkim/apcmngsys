package com.at.apcss.fm.farm.mapper;

import java.util.List;

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
	public FarmerSnCertificationInfoVO selectFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO);

	public List<FarmerSnCertificationInfoVO> selectFarmerSnCertificationInfoList(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO);

	public int insertFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO);

	public int updateFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO);

	public int insertLogFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO) throws Exception;

	public int deleteFarmerSnCertificationInfo(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO) throws Exception;

	/**
	 * 전체 농업인 번호 리스트 조회
	 * @param
	 * @return List<FarmerInfoVO>
	 * @throws Exception
	 */
	public List<FarmerSnCertificationInfoVO> selectFrmerSnList(FarmerSnCertificationInfoVO FarmerSnCertificationInfoVO) throws Exception;
}
