package com.at.apcss.am.fclt.mapper;

import java.util.List;

import com.at.apcss.am.fclt.vo.FcltVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 창고현황 Mapper 인터페이스
 * @author 김호
 * @since 2024.12.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.12.03  김호        최초 생성
 * </pre>
 */
@Mapper
public interface FcltMapper {
	/**
	 * 창고현황 조회
	 * @param FcltVO
	 * @return List<FcltVO>
	 */
	public List<FcltVO> selectWarehouseCurSiList(FcltVO FcltVO) throws Exception;
}
