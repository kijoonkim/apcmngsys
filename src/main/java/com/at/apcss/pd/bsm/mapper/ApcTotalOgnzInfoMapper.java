package com.at.apcss.pd.bsm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.ApcTotalOgnzInfoVO;

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
public interface ApcTotalOgnzInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public ApcTotalOgnzInfoVO selectApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO);

	public List<ApcTotalOgnzInfoVO> selectApcTotalOgnzInfoList(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO);

	public int insertApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO);

	public int updateApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO);

	public int insertMegerApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;
	public int insertMegerLogApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;

	public int insertMegerApcTotalOgnzInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogApcTotalOgnzInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;

	public int deleteApcTotalOgnzInfo(ApcTotalOgnzInfoVO apcTotalOgnzInfoVO) throws Exception;
}
