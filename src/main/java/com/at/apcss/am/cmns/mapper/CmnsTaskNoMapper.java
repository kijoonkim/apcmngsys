package com.at.apcss.am.cmns.mapper;

import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.CmnsTaskNoVO;

/**
 * 업무별 번호 Mapper 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface CmnsTaskNoMapper {
	
	/**
	 * APC 업무별 번호 자동 발번 단건 조회
	 * @param cmnsTaskNoVO
	 * @return
	 * @throws Exception
	 */
	public CmnsTaskNoVO selectFnGetIdTaskNo(CmnsTaskNoVO cmnsTaskNoVO) throws Exception;

	/**
	 * APC 업무별 파레트 번호 발번
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public String selectFnGetPltNo(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;
}
