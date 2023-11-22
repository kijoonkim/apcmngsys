package com.at.apcss.am.invntr.service;

import java.util.List;

import com.at.apcss.am.cmns.vo.PltBxVO;
import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;

/**
 * 팔레트 입출고 Service 인터페이스
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
public interface PltWrhsSpmtService {
	/**
	 * 팔레트/박스 재고현황 목록 조회
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public List<PltBxVO> selectPltBxMngList(PltBxVO pltBxVO) throws Exception;
	
	/**
	 * 팔레트 입출고 단건 조회
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public PltWrhsSpmtVO selectPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;

	/**
	 * 팔레트 입출고 목록 조회
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public List<PltWrhsSpmtVO> selectPltWrhsSpmtList(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;

	/**
	 * 팔레트 입출고 등록
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public int insertPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;

	/**
	 * 팔레트 입출고 변경
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public int updatePltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;

	/**
	 * 팔레트 입출고 delYn 변경
	 * @param pltWrhsSpmtVO
	 * @return
	 * @throws Exception
	 */
	public int updateDelYnPltWrhsSpmt(PltWrhsSpmtVO pltWrhsSpmtVO) throws Exception;
}
