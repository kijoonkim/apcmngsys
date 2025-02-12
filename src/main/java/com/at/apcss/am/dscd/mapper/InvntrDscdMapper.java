package com.at.apcss.am.dscd.mapper;

import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.dscd.vo.DscdPrfmncVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface InvntrDscdMapper {

    /**
     * 폐기 등록 - 재고 목록 조회 (원물)
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectRawMtrInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 등록 - 재고 목록 조회 (선별)
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectSortInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 등록 - 재고 목록 조회 (상품)
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectGdsInvntrList(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 등록 - 폐기 등록 목록 추가
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public int insertDscdRegList(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기등록- 원물재고차감
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public int updateRawInvntr(DscdPrfmncVO dscdPrfmncVO) throws  Exception;

    /**
     * 폐기등록- 선별재고차감
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public int updateSortInvntrCnt(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기등록- 상품재고차감
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public int updateGdsInvntrCnt(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회 - 폐기 실적 목록 조회
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public List<DscdPrfmncVO> selectDscdPrfmncList(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회 - 폐기삭제시 원물재고 조회
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public DscdPrfmncVO selectRawMtrInvntr(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회 - 폐기삭제시 원물재고 복원
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public int updatePrfmncRawInvntr(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회 - 폐기삭제시 선별재고 조회
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public DscdPrfmncVO selectSortInvntr(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회 - 폐기삭제시 선별재고 복원
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public int updatePrfmncSortInvntr(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회 - 폐기삭제시 상품재고 조회
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public DscdPrfmncVO selectGdsInvntr(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회 - 폐기삭제시 상품재고 복원
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public int updatePrfmncGdsInvntr(DscdPrfmncVO dscdPrfmncVO) throws Exception;

    /**
     * 폐기 실적 조회 - 폐기삭제
     * @param dscdPrfmncVO
     * @return
     * @throws Exception
     */
    public int deleteDscdPrfmnc(DscdPrfmncVO dscdPrfmncVO) throws Exception;

}
