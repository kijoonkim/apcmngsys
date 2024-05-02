package com.at.apcma.com.mapper;

import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 공통으로 처리하는 Mapper 인터페이스
 * @author 		: 장성주
 * @since 		: 2024.04.29
 * @version 	: 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일      수정자   	수정내용
 * ----------  ----------  	---------------------------
 * 2024.04.29  장성주       최초 생성
 * </pre>
 */
@Mapper
public interface ProcMapper {

	/**
	 * 공통으로 처리하는 Mapper
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> callProcTibero(Map<String, Object> param) throws Exception;

}
