package com.at.apcss.fm.farm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoLogVO;

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
public interface FarmerGrantsInfoLogMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmerGrantsInfoLogVO selectFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO);

	public List<FarmerGrantsInfoLogVO> selectFarmerGrantsInfoLogList(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO);

	public int insertFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO);

	public int updateFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO);

	public int insertMegerFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;
	public int insertMegerLogFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;
	public int updateMegerFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;

	public int deleteFarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;
}
