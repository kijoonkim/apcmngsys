package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.farm.vo.FarmerInfoVO;

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
public interface FarmerInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmerInfoVO selectFarmerInfo(FarmerInfoVO farmerInfoVO);

	public List<FarmerInfoVO> selectFarmerInfoList(FarmerInfoVO farmerInfoVO);
	public List<FarmerInfoVO> selectFarmerInfoEvApoList(FarmerInfoVO farmerInfoVO);

	public int insertFarmerInfo(FarmerInfoVO farmerInfoVO);

	public int updateFarmerInfo(FarmerInfoVO farmerInfoVO);

	public int insertMergeFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;
	public int insertMergeLogFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;

	public int insertMergeFarmerInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMergeLogFarmerInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMergeFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;

	public int deleteFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;
}
