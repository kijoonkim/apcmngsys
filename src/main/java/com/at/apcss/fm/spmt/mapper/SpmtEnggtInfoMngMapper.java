package  com.at.apcss.fm.spmt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.spmt.vo.SpmtEnggtInfoMngVO;

/**
 * 스마트자동화 Mapper 인터페이스
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
public interface SpmtEnggtInfoMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 */
	public SpmtEnggtInfoMngVO selectSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO);

	/**
	 * 메시지 목록을 조회한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 */
	public List<SpmtEnggtInfoMngVO> selectSpmtEnggtInfoMngList(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO);

	/**
	 * 메시지정보를 등록한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 */
	public int insertSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO);

	/**
	 * 메시지정보를 변경한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 */
	public int updateSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO);

	/**
	 * 메시지정보를 삭제한다.
	 * @param spmtEnggtInfoMngVO
	 * @return
	 */
	public int deleteSpmtEnggtInfoMng(SpmtEnggtInfoMngVO spmtEnggtInfoMngVO);
}
