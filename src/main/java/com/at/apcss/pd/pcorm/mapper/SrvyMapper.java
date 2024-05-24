package com.at.apcss.pd.pcorm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcorm.vo.SrvyVO;

/**
 * 세류제츨 등록 관리 Mapper 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Mapper
public interface SrvyMapper {

	/**
	 * 서류제츨 리스트 조회
	 * @param SrvyVO
	 * @return List<SrvyVO>
	 * @throws Exception
	 */
	public List<SrvyVO> selectSrvyList(SrvyVO srvyVO);

}
