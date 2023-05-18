package com.at.apcss.co.cd.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.user.vo.ComUserVO;
/**
 * 공통코드 Mapper
 * @author FINEVT 개발팀 김호
 * @since 2023.05.18
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.05.18  김호       최초 생성
 *
 *  </pre>
 */
@Mapper
public interface ComCdMapper {

	/**
	 * 공통코드 조회
	 * @param ComCd
	 * @return
	 */
	public ComUserVO selectComCd(ComCdVO comCdVO);

}
