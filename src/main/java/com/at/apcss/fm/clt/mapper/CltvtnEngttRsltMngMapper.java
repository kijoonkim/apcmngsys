package  com.at.apcss.fm.clt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.clt.vo.CltvtnEngttRsltMngVO;

/**
 * 재배약정결과관리 Mapper 인터페이스
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
public interface CltvtnEngttRsltMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 */
	public CltvtnEngttRsltMngVO selectCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO);

	/**
	 * 메시지 목록을 조회한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 */
	public List<CltvtnEngttRsltMngVO> selectCltvtnEngttRsltMngList(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO);

	/**
	 * 메시지정보를 등록한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 */
	public int insertCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO);

	/**
	 * 메시지정보를 변경한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 */
	public int updateCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO);
	public int updateCltvtnEngttRsltMng2(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO);

	/**
	 * 메시지정보를 삭제한다.
	 * @param cltvtnEngttRsltMngVO
	 * @return
	 */
	public int deleteCltvtnEngttRsltMng(CltvtnEngttRsltMngVO cltvtnEngttRsltMngVO);
}
