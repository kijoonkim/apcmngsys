package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;

/**
 * 운영자개요 Mapper 인터페이스
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
public interface FcltOperInfoMapper {


	/**
	 * 운영자개요정보를 조회한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public FcltOperInfoVO selectFcltOperInfo(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요 목록을 조회한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public List<FcltOperInfoVO> selectFcltOperInfoList(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요정보를 등록한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public int insertFcltOperInfo(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요정보를 변경한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public int updateFcltOperInfo(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요정보를 삭제한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public int deleteFcltOperInfo(FcltOperInfoVO fcltOperInfoVO);
}































