package com.at.apcss.am.apc.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.apc.vo.ApcLinkVO;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.user.vo.ComUserVO;
/**
 * APC환경설정 Mapper
 * @author FINEVT 개발팀 김호
 * @since 2023.07.07
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.07.07  김호       최초 생성
 *
 *  </pre>
 */
@Mapper
public interface ApcEvrmntStngMapper {


	public ApcLinkVO selectApcLink(ApcLinkVO apcLinkVO) throws Exception;

	/**
	 * APC 연계정보 확인
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcLinkIdnty(ApcLinkVO apcLinkVO) throws Exception;
	
	/**
	 * APC 정보 조회
	 * @param apcEvrmntStngVO
	 * @return ApcEvrmntStngVO
	 */
	public ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 환경설정 정보 조회
	 * @param apcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	public ApcEvrmntStngVO selectApcEvrmntStng(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 사용자 목록 조회
	 * @param ComUserVO
	 * @return List<ComUserVO>
	 */
	public List<ComUserVO> selectApcUserList(ComUserVO comUserVO) throws Exception;

	/**
	 * APC 설비, 장비 목록 조회
	 * @param ComCdVO
	 * @return List<ComCdVO>
	 */
	public List<ComUserVO> selectRsrcList(ComCdVO comCdVO) throws Exception;

	/**
	 * APC 환경설정 초기정보 등록
	 * @param apcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	public int insertApcEvrmntStngInit(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 환경설정 메뉴사용여부 update
	 * @param apcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcEvrmntStngAuthrt(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 환경설정 정보 수정
	 * @param apcEvrmntStngVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcEvrmntStng(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;

	/**
	 * APC 연계정보 업데이트
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcWrhsLink(ApcLinkVO apcLinkVO) throws Exception;

	/**
	 * APC 연계정보 업데이트
	 * @param apcLinkVO
	 * @return
	 * @throws Exception
	 */
	public int updateApcSortLink(ApcLinkVO apcLinkVO) throws Exception;

	
	/**
	 * APC 연계 상태 변경
	 * @param apcLinkVO
	 * @throws Exception
	 */
	public void updateSpApcLinkSttsUpdt(ApcLinkVO apcLinkVO) throws Exception;
	
}
