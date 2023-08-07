package com.at.apcss.am.apc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.apc.vo.ApcInfoVO;
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
	 * @param ApcEvrmntStngVO
	 * @return List<ApcEvrmntStngVO>
	 */
	List<ApcInfoVO> selectApcInfoList(ApcInfoVO apcInfoVO) throws Exception;

}
