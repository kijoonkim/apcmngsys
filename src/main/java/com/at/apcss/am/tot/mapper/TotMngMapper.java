package  com.at.apcss.am.tot.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.tot.vo.TotMngVO;


/**
 * 게시판 Mapper 인터페이스
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
public interface TotMngMapper {


	/**
	 * 부자재 기준정보를 조회한다.
	 * @param totMngVO
	 * @return
	 */
	public List<TotMngVO> selectTotMngInfoList(TotMngVO TotMngVO);

	/**
	 * 부자재 기준정보상세를 조회한다.
	 * @param totMngVO
	 * @return
	 */
	public List<TotMngVO> selectTotMngInfoDtlList(TotMngVO TotMngVO);

	/**
	 * 부자재 기준정보 등록.
	 * @param TotMngVO
	 * @return
	 */
	public int insertTotMngInfo(TotMngVO TotMngVO);

	/**
	 * 부자재 기준정보 수정.
	 * @param TotMngVO
	 * @return
	 */
	public int updateTotMngInfo(TotMngVO TotMngVO);

	/**
	 * 부자재 기준상세정보 등록.
	 * @param TotMngVO
	 * @return
	 */
	public int insertTotMngDtlInfo(TotMngVO TotMngVO);

	/**
	 * 부자재 기준상세정보 수정.
	 * @param TotMngVO
	 * @return
	 */
	public int updateTotMngDtlInfo(TotMngVO TotMngVO);

	/**
	 * 부자재 기준정보 삭제.
	 * @param TotMngVO
	 * @return
	 */
	public int deleteTotMngInfo(TotMngVO TotMngVO);

	/**
	 * 부자재 기준상세정보 삭제.
	 * @param TotMngVO
	 * @return
	 */
	public int deleteTotMngDtlInfo(TotMngVO TotMngVO);


}
