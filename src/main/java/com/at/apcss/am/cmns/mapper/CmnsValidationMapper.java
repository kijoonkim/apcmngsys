package com.at.apcss.am.cmns.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.cmns.vo.CmnsTaskNoVO;
import com.at.apcss.am.cmns.vo.CmnsValidationVO;

/**
 * 업무 Validation Mapper 인터페이스
 * @author 신정철
 * @since 2023.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface CmnsValidationMapper {

	/**
	 * APC 업무별 코드삭제 가능여부 단건 조회
	 * @param cmnsTaskNoVO
	 * @return
	 * @throws Exception
	 */
	public CmnsValidationVO selectChkCdDelible(CmnsValidationVO cmnsValidationVO) throws Exception;
}
