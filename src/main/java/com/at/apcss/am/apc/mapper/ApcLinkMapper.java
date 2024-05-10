package com.at.apcss.am.apc.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.apc.vo.ApcLinkVO;

/**
 * APC연계 Mapper
 * @author FINEVT 신정철
 * @since 2024.04.29
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      	수정자      수정내용
 *  ----------  --------  ---------------------------
 *  2024.04.29  신정철      최초 생성
 *
 *  </pre>
 */
@Mapper
public interface ApcLinkMapper {


	/**
	 * APC 연계 정보 조회
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	public ApcLinkVO selectApcLink(ApcLinkVO apcLinkVO) throws Exception;

	/**
	 * APC 연계기기 정보 조회
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	public ApcLinkVO selectApcLinkTrsmMat(ApcLinkVO apcLinkVO) throws Exception;
	
	public ApcLinkVO selectApcLinkTrsmMatById(ApcLinkVO apcLinkVO) throws Exception;
	
	
	public List<ApcLinkVO> selectApcLinkTrsmMatList(ApcLinkVO apcLinkVO) throws Exception;
	
	/**
	 * APC 연계기기 정보 조회
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	public List<ApcLinkVO> selectApcLinkTrsmMatSttsList(ApcLinkVO apcLinkVO) throws Exception;
	
	/**
	 * APC 연계정보 확인 (UPDATE)
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcLinkIdnty(ApcLinkVO apcLinkVO) throws Exception;
	
	/**
	 * APC 연계기기정보 확인 (UPDATE)
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcLinkTrsmMatIdnty(ApcLinkVO apcLinkVO) throws Exception;
	
	
	/**
	 * APC 연계 상태 변경
	 * @param apcLinkVO
	 * @throws Exception
	 */
	public void updateSpApcLinkSttsUpdt(ApcLinkVO apcLinkVO) throws Exception;
	
	/**
	 * APC 연계기기 상태 변경
	 * @param apcLinkVO
	 * @throws Exception
	 */
	public void updateSpApcLinkTrsmMatSttsUpdt(ApcLinkVO apcLinkVO) throws Exception;
	
	
	public int insertApcLinkTrsmMat(ApcLinkVO apcLinkVO) throws Exception;
	public int updateApcLinkTrsmMat(ApcLinkVO apcLinkVO) throws Exception;
	public int deleteApcLinkTrsmMat(ApcLinkVO apcLinkVO) throws Exception;
	
}
