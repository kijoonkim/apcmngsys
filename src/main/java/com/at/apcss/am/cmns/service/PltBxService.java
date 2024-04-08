package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.PltBxVO;

/**
 * 팔레트/박스정보관리 Service 인터페이스
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
public interface PltBxService {

	/**
	 * 팔레트/박스 정보 단건 조회
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public PltBxVO selectPltBx(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보 목록 조회
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public List<PltBxVO> selectPltBxList(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보 등록
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public int insertPltBx(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보 변경
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public int updatePltBx(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보 삭제
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public int deletePltBx(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보생성 - APC 사용등록
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertPltBxSample(PltBxVO pltBxVO) throws Exception;

	public HashMap<String, Object> multiPltBxList(List<PltBxVO> pltBxList) throws Exception;
	/**
	 * APC 팔레트/박스 정보 업데이트
	 * @param PltBxVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateApcPltBx(PltBxVO pltBxVO) throws Exception;
	/**
	 * APC 팔레트/박스 정보 업데이트
	 * @param List<PltBxVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updatePltBxList(List<PltBxVO> pltBxList) throws Exception;

}