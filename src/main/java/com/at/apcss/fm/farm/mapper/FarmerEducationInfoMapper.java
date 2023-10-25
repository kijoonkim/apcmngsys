package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoVO;

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
public interface FarmerEducationInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmerEducationInfoVO selectFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO);

	public List<FarmerEducationInfoVO> selectFarmerEducationInfoList(FarmerEducationInfoVO farmerEducationInfoVO);

	public int insertFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO);

	public int updateFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO);

	public int insertMegerFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;
	public int insertMegerLogFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

	public int insertMegerFarmerEducationInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmerEducationInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

	public int deleteFarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;
}
