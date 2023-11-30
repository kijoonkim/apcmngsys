package com.at.apcss.am.trnsf.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.trnsf.vo.TrnsfGdsInvntrVO;

/**
 * 상품재고이송관리 Mapper 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface TrnsfGdsInvntrMapper {

	/**
	 * 상품재고 이송 목록 조회
	 * @param TrnsfGdsInvntrVO
	 * @return List<TrnsfGdsInvntrVO>
	 * @throws Exception
	 */
	public List<TrnsfGdsInvntrVO> selectUpdateTrnsfGdsInvntrList(TrnsfGdsInvntrVO trnsfGdsInvntrVO) throws Exception;
	/**
	 * 이송확정 목록 조회
	 * @param TrnsfGdsInvntrVO
	 * @return List<TrnsfGdsInvntrVO>
	 * @throws Exception
	 */
	public List<TrnsfGdsInvntrVO> selectTrnsfCfmtnGdsInvntrList(TrnsfGdsInvntrVO trnsfGdsInvntrVO) throws Exception;

	/**
	 * 상품재고 변경
	 * @param gdsInvntrVO
	 * @return
	 * @throws Exception
	 */
	public int updateTrnsfGdsInvntrList(TrnsfGdsInvntrVO trnsfGdsInvntrVO) throws Exception;

}
