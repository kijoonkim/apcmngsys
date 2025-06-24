package com.at.apcss.am.clcln.mapper;

import com.at.apcss.am.clcln.vo.ClclnDtlVO;
import com.at.apcss.am.clcln.vo.ClclnMstrVO;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface ClclnSortMapper {

    /**
     * 선별 정산 마스터정보 저장
     * @param mstrList
     * @return int
     * @throws Exception
     */
    int insertSortClclnMstr(@Param("list") List<ClclnMstrVO> mstrList) throws Exception;
    /**
     * 선별 정산 상세정보 저장
     * @param dtlList
     * @return int
     * @throws Exception
     */
    int insertSortClclnDtl(@Param("list") List<ClclnDtlVO> dtlList) throws Exception;
    /**
     * 선별 정산 결과조회
     * @param clclnMstrVO
     * @return List<ClclnDtlVO>
     * @throws Exception
     */
    List<ClclnDtlVO> selectSortClclnList(ClclnMstrVO clclnMstrVO) throws Exception;
}
