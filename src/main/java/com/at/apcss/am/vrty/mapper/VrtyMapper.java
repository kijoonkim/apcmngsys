package com.at.apcss.am.vrty.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.vrty.vo.VrtyVO;
import com.at.apcss.co.cd.vo.ComCdVO;
/**
 * 품종팝업 Mapper
 * @author FINEVT 개발팀 김호
 * @since 2023.09.07
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.09.07  김현호       최초 생성
 *
 *  </pre>
 */
@Mapper
public interface VrtyMapper {
	/**
	 * 품종 팝업에서 조회
	 * @param ComCdVO
	 * @return
	 * @throws Exception
	 */

	public List<VrtyVO> selectVrtyList(VrtyVO vrtyVO) throws Exception;
}
