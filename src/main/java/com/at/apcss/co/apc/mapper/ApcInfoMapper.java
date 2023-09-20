package com.at.apcss.co.apc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.apc.vo.ApcInfoVO;
/**
 * APC정보 Mapper
 * @author FINEVT 개발팀 김호
 * @since 2023.07.07
 * @version 1.0
 * @see
 *
 * <pre>
 *
 *  수정일      	수정자      	수정내용
 *  ----------  --------	---------------------------
 *  2023.07.07  김호       	최초 생성
 *
 *  </pre>
 */
@Mapper
public interface ApcInfoMapper {

	/**
	 * APC 정보 조회
	 * @param ApcInfoVO
	 * @return ApcInfoVO
	 */
	ApcInfoVO selectApcInfo(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC 내역 조회
	 * @param ApcInfoVO
	 * @return List<ApcInfoVO>
	 */
	List<ApcInfoVO> selectApcInfoList(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC 관리내역 조회
	 * @param ApcInfoVO
	 * @return List<ApcInfoVO>
	 */
	List<ApcInfoVO> selectApcMngList(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC 내역 조회
	 * @param ApcInfoVO
	 * @return List<ApcInfoVO>
	 */
	public List<ApcInfoVO> selectApcDsctnList(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC 내역 수정
	 * @param ApcInfoVO
	 * @return
	 */
	public int updateApcDsctn(ApcInfoVO apcInfoVO) throws Exception;

	/**
	 * APC 내역 등록
	 * @param ApcInfoVO
	 * @return
	 */
	public int insertApcDsctn(ApcInfoVO apcInfoVO) throws Exception;
}
