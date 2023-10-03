package  com.at.apcss.fm.popup.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.popup.vo.ApcSelectPopupVO;
import com.at.apcss.fm.popup.vo.InvstmntSpmtPopupVO;

/**
 * apc선택 팝업 Mapper 인터페이스
 * @author ljw
 * @since 2023.10.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.03  ljw        최초 생성
 * </pre>
 */
@Mapper
public interface ApcSelectPopupMapper {

	/**
	 * 통합조직,출자출하조직 리스트 조회
	 * @param InvstmntSpmtPopupVO
	 * @return
	 * @throws Exception
	 */
	public List<ApcSelectPopupVO> selectApcList(ApcSelectPopupVO vo);

}
