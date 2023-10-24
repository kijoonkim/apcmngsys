package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
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
	public FarmerInfoVO selectfarmerInfo(FarmerInfoVO farmerInfoVO);

	public List<FarmerInfoVO> selectfarmerInfoList(FarmerInfoVO farmerInfoVO);

	public int insertfarmerInfo(FarmerInfoVO farmerInfoVO);

	public int updatefarmerInfo(FarmerInfoVO farmerInfoVO);

	public int insertMegerfarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;
	public int insertMegerLogfarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;

	public int insertMegerfarmerInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogfarmerInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerfarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;

	public int deletefarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;
}
