package com.at.apcss.am.apc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
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
	/**
	 * APC 정보 조회
	 * @param ComUserVO
	 * @return ApcEvrmntStngVO
	 */
	ApcEvrmntStngVO selectApcInfo(ComUserVO comUserVO) throws Exception;
	
	/**
	 * APC 내역 조회
	 * @param ApcEvrmntStngVO
	 * @return List<ApcEvrmntStngVO>
	 */
	List<ApcEvrmntStngVO> selectApcDsctnList(ApcEvrmntStngVO ApcEvrmntStngVO) throws Exception;

	/**
	 * APC 사용자 목록 조회
	 * @param ComUserVO
	 * @return List<ComUserVO>
	 */
	List<ComUserVO> selectApcUserList(ComUserVO comUserVO) throws Exception;

	/**
	 * APC 설비, 장비 목록 조회
	 * @param ComCdVO
	 * @return List<ComCdVO>
	 */
	List<ComUserVO> selectRsrcList(ComCdVO comCdVO) throws Exception;

}
