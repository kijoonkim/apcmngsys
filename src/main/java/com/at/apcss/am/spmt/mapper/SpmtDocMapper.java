package com.at.apcss.am.spmt.mapper;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.spmt.vo.SpmtDocDtlVO;
import com.at.apcss.am.spmt.vo.SpmtDocVO;

/**
 * 출고실적 Mapper 인터페이스
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
public interface SpmtDocMapper {

	/**
	 * 전자송품장 조회
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectSpmtDocMapList(HashMap<String, Object> paramMap) throws Exception;

	public List<SpmtDocVO> selectSpmtDocList(SpmtDocVO spmtDocVO) throws Exception;

	/**
	 * 전자송품장 상세 조회
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> selectSpmtDocDtlMapList(HashMap<String, Object> paramMap) throws Exception;
	
	public List<SpmtDocDtlVO> selectSpmtDocDtlList(SpmtDocVO spmtDocVO) throws Exception;
	
}
