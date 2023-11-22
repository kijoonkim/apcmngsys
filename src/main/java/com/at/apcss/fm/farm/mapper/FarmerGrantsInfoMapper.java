package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.farm.vo.FarmerGrantsInfoVO;

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
public interface FarmerGrantsInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmerGrantsInfoVO selectFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO);

	public List<FarmerGrantsInfoVO> selectFarmerGrantsInfoList(FarmerGrantsInfoVO farmerGrantsInfoVO);

	public int insertFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO);

	public int updateFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO);

	public int insertMegerFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;
	public int insertMegerLogFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int insertMegerFarmerGrantsInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmerGrantsInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int deleteFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;
}
