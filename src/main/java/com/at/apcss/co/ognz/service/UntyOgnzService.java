package com.at.apcss.co.ognz.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.co.ognz.vo.UntyOgnzVO;

/**
 * 통합조직 Service 인터페이스
 * @author 신정철
 * @since 2024.07.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.22  신정철        최초 생성
 * </pre>
 */
public interface UntyOgnzService {

	/**
	 * 통합조직 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public UntyOgnzVO selectUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 목록 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyOgnzVO> selectUntyOgnzList(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 트리 목록 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyOgnzVO> selectUntyOgnzTreeList(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 등록
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 변경
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 삭제
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception;
			
}
