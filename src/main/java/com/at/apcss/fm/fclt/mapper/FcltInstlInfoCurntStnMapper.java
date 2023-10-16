package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.FcltInstlInfoCurntStnVO;

/**
 * 시설설치보완 Mapper 인터페이스
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
public interface FcltInstlInfoCurntStnMapper {


	/**
	 * 시설설치보완정보를 조회한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 */
	public FcltInstlInfoCurntStnVO selectFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO);

	/**
	 * 시설설치보완 목록을 조회한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 */
	public List<FcltInstlInfoCurntStnVO> selectFcltInstlInfoCurntStnList(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO);

	/**
	 * 시설설치보완정보를 등록한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 */
	public int insertFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO);

	/**
	 * 시설설치보완정보를 변경한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 */
	public int updateFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO);

	/**
	 * 시설설치보완정보를 삭제한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 */
	public int deleteFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO);
}
