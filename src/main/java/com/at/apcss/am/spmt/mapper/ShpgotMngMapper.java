package com.at.apcss.am.spmt.mapper;

import com.at.apcss.am.spmt.vo.ShpgotApcCrtrDtlVO;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrVO;
import com.at.apcss.am.spmt.vo.ShpgotApcRawMtrVO;
import org.apache.ibatis.annotations.Select;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * @Class Name : ShpgotMngMapper.java
 * @Description : 반품 기준 관리에 대한 Mapper 클래스
 * @author 손민성
 * @since 2025.01.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.04  손민성        최초 생성
 * </pre>
 */
@Mapper
public interface ShpgotMngMapper {

    /**
     * 반품기준 목록 기준코드 발번
     * @param apcCd
     * @return int
     * @throws Exception
     */
    @Select("SELECT FN_GET_ID_WGH_FCLT(#{apcCd}) FROM DUAL")
    String selectWghFcltCd(String apcCd) throws Exception;

    /**
     * 반품기준 목록 생성
     * @param shpgotApcCrtrVOList
     * @return int
     * @throws Exception
     */
    int insertShpgotApcCrtr(List<ShpgotApcCrtrVO> shpgotApcCrtrVOList) throws Exception;

    /**
     * 반품기준 상세목록 생성
     * @param shpgotApcCrtrDtlVOList
     * @return int
     * @throws Exception
     */
    int insertShpgotApcCrtrDtl(List<ShpgotApcCrtrDtlVO> shpgotApcCrtrDtlVOList) throws Exception;
    /**
     * 반품기준 상세목록 생성
     * @param shpgotApcCrtrVo
     * @return int
     * @throws Exception
     */
    int insertShpgotApcCrtrSingle(ShpgotApcCrtrVO shpgotApcCrtrVo) throws Exception;
    /**
     * 반품기준 상세목록 조회
     * @param shpgotApcCrtrVO
     * @return List<ShpgotApcCrtrVO>
     * @throws Exception
     */
    List<ShpgotApcCrtrVO> selectShpgotApcCrtrList(ShpgotApcCrtrVO shpgotApcCrtrVO) throws Exception;
    /**
     * 반품기준 상세목록 조회
     * @param shpgotApcCrtrVO
     * @return List<ShpgotApcCrtrVO>
     * @throws Exception
     */
    List<ShpgotApcCrtrDtlVO> selectShpgotApcCrtrDtlList(ShpgotApcCrtrVO shpgotApcCrtrVO) throws Exception;
    /**
     * 원물재고 반품이력 조회
     * @param shpgotApcRawMtrVO
     * @return List<ShpgotApcRawMtrVO>
     * @throws Exception
     */
    List<ShpgotApcRawMtrVO> selectShpgotRawMtr(ShpgotApcRawMtrVO shpgotApcRawMtrVO) throws Exception;
}
