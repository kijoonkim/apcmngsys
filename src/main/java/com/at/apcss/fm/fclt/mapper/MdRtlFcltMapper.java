package com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.MdRtlFcltVO;

/**
 * APC전수조사 대시보드 Mapper 인터페이스
 * @author 김현호
 * @since 2023.11.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.15  김현호        최초 생성
 * </pre>
 */

@Mapper
public interface MdRtlFcltMapper {
	/**
	 * 통합관리시스템 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectFirstGridList(MdRtlFcltVO mdRtlFcltVO);
}
