package  com.at.apcss.am.bbs.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.bbs.vo.apcBbsCmntVO;
import com.at.apcss.am.bbs.vo.apcBbsFileVO;
import com.at.apcss.am.bbs.vo.apcBbsVO;

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
public interface apcBbsMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public apcBbsVO selectBbs(apcBbsVO bbsVO);

	/**
	 * 메시지 목록을 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public List<apcBbsVO> selectBbsList(apcBbsVO bbsVO);

	/**
	 * 메시지정보를 등록한다.
	 * @param bbsVO
	 * @return
	 */
	public int insertBbs(apcBbsVO bbsVO);

	/**
	 * 게시판댓글정보를 등록한다.
	 * @param BbsCmntVO
	 * @return
	 */
	public int insertBbsCmnt(apcBbsCmntVO bbsCmntVO);

	/**
	 * 게시판대댓글정보를 등록한다.
	 * @param BbsCmntVO
	 * @return
	 */
	public int insertBbsChildCmnt(apcBbsCmntVO bbsCmntVO);
	/**
	 * 게시판댓글정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 */
	public int deleteBbsCmnt(apcBbsCmntVO bbsCmntVO);

	/**
	 * 게시판댓글전체정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 */
	public int deleteBbsAllCmnt(apcBbsVO bbsVO);


	/**
	 * 댓글 목록을 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public List<apcBbsCmntVO> selectBbsCmntList(apcBbsVO bbsVO);

	/**
	 * 메시지정보를 변경한다.
	 * @param bbsVO
	 * @return
	 */
	public int updateBbs(apcBbsVO bbsVO);

	/**
	 * 메시지정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 */
	public int deleteBbs(apcBbsVO bbsVO);

	/**
	 * 첨부파일을 등록한다.
	 * @param bbsFileVO
	 * @return
	 */
	public int insertAttach(apcBbsFileVO apcBbsFileVO);

	/**
	 * 첨부파일 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public apcBbsFileVO selectBbsAttaches(apcBbsFileVO apcBbsFileVO);

	/**
	 * 첨부파일 목록을 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public List<apcBbsFileVO> selectBbsAttachesList(apcBbsVO bbsVO);

	/**
	 * 첨부파일을 삭제한다.
	 * @param bbsVO
	 * @return
	 */
	public int deleteBbsAttache(apcBbsFileVO apcBbsFileVO);
}
