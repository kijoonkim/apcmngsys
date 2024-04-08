package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.WrhsVhclVO;

/**
 * 입고차량정보관리 Service 인터페이스
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
public interface WrhsVhclService {

	/**
	 * 입고차량정보 단건 조회
	 * @param wrhsVhclVO
	 * @return
	 * @throws Exception
	 */
	public WrhsVhclVO selectWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 목록 조회
	 * @param wrhsVhclVO
	 * @return
	 * @throws Exception
	 */
	public List<WrhsVhclVO> selectWrhsVhclList(WrhsVhclVO wrhsVhclVO) throws Exception;
	
	/**
	 * 입고차량정보 코드 목록 조회
	 * @param wrhsVhclVO
	 * @return
	 * @throws Exception
	 */
	public List<WrhsVhclVO> selectWrhsVhclCdList(WrhsVhclVO wrhsVhclVO) throws Exception;
	
	/**
	 * 입고차량정보 등록
	 * @param wrhsVhclVO
	 * @return
	 * @throws Exception
	 */
	public int insertWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 변경
	 * @param wrhsVhclVO
	 * @return
	 * @throws Exception
	 */
	public int updateWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 삭제
	 * @param wrhsVhclVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 등록
	 * @param vhclList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiVhclList(List<WrhsVhclVO> vhclList) throws Exception;

	/**
	 * 입고차량정보 삭제 가능 여부
	 * @param wrhsVhclVO
	 * @return
	 * @throws Exception
	 */
	public String vhclDelible(WrhsVhclVO wrhsVhclVO) throws Exception;
	
	/**
	 * APC기준 차량정보 업데이트
	 * @param wrhsVhclVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateVhclInfo(WrhsVhclVO wrhsVhclVO) throws Exception;
	/**
	 * APC기준 차량정보 업데이트 목록
	 * @param List<WrhsVhclVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> updateVhclInfoList(List<WrhsVhclVO> WrhsVhclList) throws Exception;
}
