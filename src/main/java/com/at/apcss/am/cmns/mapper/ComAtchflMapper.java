package com.at.apcss.am.cmns.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.ComAtchflVO;

/**
 * 첨부파일 Mapper 인터페이스
 * @author 김호
 * @since 2024.07.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.11  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface ComAtchflMapper {

	/**
	 * 첨부파일 등록
	 * @param comAtchflVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertComAtchfl(ComAtchflVO comAtchflVO) throws Exception;

	/**
	 * 첨부파일 수정
	 * @param comAtchflVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateComAtchfl(ComAtchflVO comAtchflVO) throws Exception;

	/**
	 * 첨부파일번호 발번
	 * @param comAtchflVO
	 * @return String
	 * @throws Exception
	 */
	public String selectGetComAtchflNo(ComAtchflVO comAtchflVO) throws Exception;

	/**
	 * 첨부파일 파일 정보 갖고 오기
	 * @param comAtchflVO
	 * @return ComAtchflVO
	 * @throws Exception
	 */
	public ComAtchflVO selectComAtchfl(ComAtchflVO comAtchflVO) throws Exception;

	/**
	 * 첨부파일 삭제
	 * @param comAtchflVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteComAtchfl(ComAtchflVO comAtchflVO) throws Exception;
}
