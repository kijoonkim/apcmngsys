package  com.at.apcss.fm.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.bbs.vo.BbsVO;

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
public interface BbsMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public BbsVO selectBbs(BbsVO bbsVO);

	/**
	 * 메시지 목록을 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public List<BbsVO> selectBbsList(BbsVO bbsVO);

	/**
	 * 메시지정보를 등록한다.
	 * @param bbsVO
	 * @return
	 */
	public int insertBbs(BbsVO bbsVO);

	/**
	 * 메시지정보를 변경한다.
	 * @param bbsVO
	 * @return
	 */
	public int updateBbs(BbsVO bbsVO);

	/**
	 * 메시지정보를 삭제한다.
	 * @param bbsVO
	 * @return
	 */
	public int deleteBbs(BbsVO bbsVO);
}
