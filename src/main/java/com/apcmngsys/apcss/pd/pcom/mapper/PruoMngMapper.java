package com.apcmngsys.apcss.pd.pcom.mapper;

import com.apcmngsys.apcss.pd.pcom.vo.PruoMstVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.sql.SQLException;
import java.util.List;


/**
 * 생산유통통합조직등록관리 Mapper 인터페이스
 * @author
 * @since 2025.09.24
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.24  신정철       최초 생성
 * </pre>
 */
@Mapper
public interface PruoMngMapper {

    public PruoMstVO selectPruoRegMst(PruoMstVO pruoMstVO);
    public List<PruoMstVO> selectPruoRegMstList(PruoMstVO pruoMstVO);

}
