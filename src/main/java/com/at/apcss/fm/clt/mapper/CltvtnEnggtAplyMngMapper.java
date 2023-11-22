package  com.at.apcss.fm.clt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.clt.vo.CltvtnApcItemVO;
import com.at.apcss.fm.clt.vo.CltvtnEnggtAplyMngVO;

/**
 * 재배약정신청관리 Mapper 인터페이스
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
public interface CltvtnEnggtAplyMngMapper {


	/**
	 * 재배약정계획을 조회한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 */
	public CltvtnEnggtAplyMngVO selectCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO);

	/**
	 * 재배약정계획을 조회한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 */
	public List<CltvtnEnggtAplyMngVO> selectCltvtnEnggtAplyMngList(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO);

	/**
	 * 재배약정계획을 등록한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 */
	public int insertCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO);

	/**
	 * 재배약정계획을 변경한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 */
	public int updateCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO);

	/**
	 * 재배약정계획을 삭제한다.
	 * @param cltvtnEnggtAplyMngVO
	 * @return
	 */
	public int deleteCltvtnEnggtAplyMng(CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO);

	/**
	 * APC 목록 조회
	 * @param CltvtnApcItemVO
	 * @return
	 * @throws Exception
	 */
	public List<CltvtnApcItemVO> selectApcList(CltvtnApcItemVO vo);

}
