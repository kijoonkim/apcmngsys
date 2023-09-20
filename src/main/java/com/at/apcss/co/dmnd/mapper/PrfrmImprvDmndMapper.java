package com.at.apcss.co.dmnd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.dmnd.vo.PrfrmImprvDmndVO;

/**
 * 프로그램개선요청 Mapper 인터페이스
 * @author 김호
 * @since 2023.09.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.20  김호        최초 생성
 * </pre>
 */
@Mapper
public interface PrfrmImprvDmndMapper {

	/**
	 * 프로그램개선요청 목록 조회
	 * @param PrfrmImprvDmndVO
	 * @return List<PrfrmImprvDmndVO>
	 * @throws Exception
	 */
	List<PrfrmImprvDmndVO> selectPrfrmImprvDmndList(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception;

	/**
	 * 프로그램개선요청 등록
	 * @param PrfrmImprvDmndVO
	 * @return integer
	 * @throws Exception
	 */
	int insertPrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception;

	/**
	 * 프로그램개선요청 수정
	 * @param PrfrmImprvDmndVO
	 * @return integer
	 * @throws Exception
	 */
	int updatePrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception;

	/**
	 * 프로그램개선요청 삭제
	 * @param PrfrmImprvDmndVO
	 * @return integer
	 * @throws Exception
	 */
	int deletePrfrmImprvDmnd(PrfrmImprvDmndVO prfrmImprvDmndVO) throws Exception;
}
