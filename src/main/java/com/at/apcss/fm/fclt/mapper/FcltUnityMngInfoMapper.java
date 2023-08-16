package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.FcltUnityMngInfoVO;

/**
 * 통합관리시스템 Mapper 인터페이스
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
public interface FcltUnityMngInfoMapper {


	/**
	 * 통합관리시스템정보를 조회한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 */
	public FcltUnityMngInfoVO selectFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO);

	/**
	 * 통합관리시스템 목록을 조회한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 */
	public List<FcltUnityMngInfoVO> selectFcltUnityMngInfoList(FcltUnityMngInfoVO fcltUnityMngInfoVO);

	/**
	 * 통합관리시스템정보를 등록한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 */
	public int insertFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO);

	/**
	 * 통합관리시스템정보를 변경한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 */
	public int updateFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO);

	/**
	 * 통합관리시스템정보를 삭제한다.
	 * @param fcltUnityMngInfoVO
	 * @return
	 */
	public int deleteFcltUnityMngInfo(FcltUnityMngInfoVO fcltUnityMngInfoVO);
}
