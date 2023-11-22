package com.at.apcss.am.trnsf.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.trnsf.vo.TrnsfRawMtrInvntrVO;

/**
 * 원물재고 Mapper 인터페이스
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
public interface TrnsfRawMtrInvntrMapper {

	/**
	 * 원물재고 목록 조회
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
	public List<TrnsfRawMtrInvntrVO> selectTrnsfRawMtrInvntrList(TrnsfRawMtrInvntrVO trnsfrawMtrInvntrVO) throws Exception;


	/**
	 * 원물재고내역 변경
	 * @param rawMtrInvntrVO
	 * @return
	 * @throws Exception
	 */
//	public int updateRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) throws Exception;
	public int updateTrnsfRawMtrInvntrList(TrnsfRawMtrInvntrVO trnsfrawMtrInvntrVO) throws Exception;
//	public HashMap<String, Object> updateRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception;

}
