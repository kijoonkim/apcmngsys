package  com.at.apcss.fm.popup.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.popup.vo.InvstmntSpmtPopupVO;

/**
 * 통합조직,출자출하조직 팝업 Mapper 인터페이스
 * @author ljw
 * @since 2023.09.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.22  ljw        최초 생성
 * </pre>
 */
@Mapper
public interface InvstmntSpmtPopupMapper {

	/**
	 * 통합조직,출자출하조직 리스트 조회
	 * @param InvstmntSpmtPopupVO
	 * @return
	 * @throws Exception
	 */
	public List<InvstmntSpmtPopupVO> selectInvstmntSpmtList(InvstmntSpmtPopupVO vo);

}
