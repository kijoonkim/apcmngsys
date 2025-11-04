package com.at.apcss.am.unty.mapper;

import com.at.apcss.am.unty.vo.RegSpmtPrfmncVO;
import com.at.apcss.am.unty.vo.UntyPrfmncVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 통합실적 Mapper 인터페이스
 * @author 김 호
 * @since 2025.08.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.18  김 호        최초 생성
 * </pre>
 */
@Mapper
public interface UntyPrfmncMapper {

	/**
	 * 통합실적 목록 조회
	 * @param untyPrfmncVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyPrfmncVO> selectRawDlngPrfmncList(UntyPrfmncVO untyPrfmncVO) throws Exception;

	/**
	 * 양송이출고등록조회(참사랑)
	 * @param regSpmtPrfmncVO
	 * @return
	 * @throws Exception
	 */
	List<RegSpmtPrfmncVO> selectRegSpmtPrfmncList(RegSpmtPrfmncVO regSpmtPrfmncVO) throws Exception;
}
