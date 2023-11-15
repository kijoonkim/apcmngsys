package com.at.apcss.pd.bsm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.ApcFarmOgnzInfoVO;

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
public interface ApcFarmOgnzInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public ApcFarmOgnzInfoVO selectApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO);

	public List<ApcFarmOgnzInfoVO> selectApcFarmOgnzInfoList(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO);

	public int insertApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO);

	public int updateApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO);

	public int insertMegerApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;
	public int insertMegerLogApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;

	public int insertMegerApcFarmOgnzInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogApcFarmOgnzInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;

	public int deleteApcFarmOgnzInfo(ApcFarmOgnzInfoVO apcFarmOgnzInfoVO) throws Exception;
}
