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
	public FarmerEducationInfoVO selectfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO);

	public List<FarmerEducationInfoVO> selectfarmerEducationInfoList(FarmerEducationInfoVO farmerEducationInfoVO);

	public int insertfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO);

	public int updatefarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO);

	public int insertMegerfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;
	public int insertMegerLogfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

	public int insertMegerfarmerEducationInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogfarmerEducationInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerfarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;

	public int deletefarmerEducationInfo(FarmerEducationInfoVO farmerEducationInfoVO) throws Exception;
}
