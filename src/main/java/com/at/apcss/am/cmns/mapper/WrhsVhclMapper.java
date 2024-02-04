package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.WrhsVhclVO;

/**
 * 입고차량정보 Mapper 인터페이스
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
public interface WrhsVhclMapper {

	/**
	 * 입고차량정보 단건 조회
	 * @param wrhsVhclVO
	 * @return WrhsVhclVO
	 * @throws Exception
	 */
	public WrhsVhclVO selectWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 목록 조회
	 * @param wrhsVhclVO
	 * @return List<WrhsVhclVO>
	 * @throws Exception
	 */
	public List<WrhsVhclVO> selectWrhsVhclList(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 코드 목록 조회
	 * @param wrhsVhclVO
	 * @return List<WrhsVhclVO>
	 * @throws Exception
	 */
	public List<WrhsVhclVO> selectWrhsVhclCdList(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 등록
	 * @param wrhsVhclVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 변경
	 * @param wrhsVhclVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 삭제
	 * @param wrhsVhclVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception;

	/**
	 * 입고차량정보 삭제 가능 여부
	 * @param wrhsVhclVO
	 * @return List<WrhsVhclVO>
	 * @throws Exception
	 */
	public List<WrhsVhclVO> vhclDelible(WrhsVhclVO wrhsVhclVO) throws Exception;
}
