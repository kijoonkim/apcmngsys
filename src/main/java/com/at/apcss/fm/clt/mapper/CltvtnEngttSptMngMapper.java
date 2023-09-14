package  com.at.apcss.fm.clt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.clt.vo.CltvtnEngttSptMngVO;

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
public interface CltvtnEngttSptMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 */
	public CltvtnEngttSptMngVO selectCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO);

	/**
	 * 메시지 목록을 조회한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 */
	public List<CltvtnEngttSptMngVO> selectCltvtnEngttSptMngList(CltvtnEngttSptMngVO cltvtnEngttSptMngVO);

	/**
	 * 메시지정보를 등록한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 */
	public int insertCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO);
	public int insertCltvtnEngttSptMng2(CltvtnEngttSptMngVO cltvtnEngttSptMngVO);

	/**
	 * 메시지정보를 변경한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 */
	public int updateCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO);
	public int updateCltvtnEngttSptMng2(CltvtnEngttSptMngVO cltvtnEngttSptMngVO);

	/**
	 * 메시지정보를 삭제한다.
	 * @param cltvtnEngttSptMngVO
	 * @return
	 */
	public int deleteCltvtnEngttSptMng(CltvtnEngttSptMngVO cltvtnEngttSptMngVO);
}
