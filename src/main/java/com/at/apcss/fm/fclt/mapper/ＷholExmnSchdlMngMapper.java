package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.ＷholExmnSchdlMngVO;

/**
 * 전수조사일정관리 Mapper 인터페이스
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
public interface ＷholExmnSchdlMngMapper {


	/**
	 * 전수조사일정관리정보를 조회한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 */
	public ＷholExmnSchdlMngVO selectＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO);

	/**
	 * 전수조사일정관리 목록을 조회한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 */
	public List<ＷholExmnSchdlMngVO> selectＷholExmnSchdlMngList(ＷholExmnSchdlMngVO wholExmnSchdlMngVO);

	/**
	 * 전수조사일정관리정보를 등록한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 */
	public int insertＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO);

	/**
	 * 전수조사일정관리정보를 변경한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 */
	public int updateＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO);

	/**
	 * 전수조사일정관리정보를 삭제한다.
	 * @param wholExmnSchdlMngVO
	 * @return
	 */
	public int deleteＷholExmnSchdlMng(ＷholExmnSchdlMngVO wholExmnSchdlMngVO);
}
