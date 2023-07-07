package com.at.apcss.am.apc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
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
	 * @param ApcEvrmntStngVO
	 * @return ApcEvrmntStngVO
	 */
	ApcEvrmntStngVO selectApcInfo(ApcEvrmntStngVO apcEvrmntStngVO) throws Exception;
	/**
	 * APC 사용자 목록 조회
	 * @param ApcEvrmntStngVO
	 * @return List<ComUserVO>
	 */
	List<ComUserVO> selectApcUserList(ApcEvrmntStngVO apcEvrmntStngVO);

}
