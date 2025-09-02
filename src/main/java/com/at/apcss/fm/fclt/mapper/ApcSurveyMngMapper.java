package com.at.apcss.fm.fclt.mapper;


import com.at.apcss.fm.fclt.vo.ApcSurveyMstVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;
import java.util.List;

/**
 * APC전수조사관리 Mapper 인터페이스
 * @author
 * @since 2025.05.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------   ----------  ---------------------------
 * 2025.05.12   신정철       최초 생성
 * </pre>
 */
@Mapper
public interface ApcSurveyMngMapper {

    /**
     * APC전수조사 마스터 조회
     * @param apcSurveyMstVO
     * @return
     * @throws Exception
     */
    public ApcSurveyMstVO selectApcSurveyMaster(ApcSurveyMstVO apcSurveyMstVO) throws Exception;

    /**
     * APC전수조사 마스터 리스트 조회
     * @param
     * @return
     * @throws Exception
     */
    public List<ApcSurveyMstVO> selectApcSurveyMasterList(ApcSurveyMstVO apcSurveyMstVO) throws Exception;

    /**
     * APC전수조사마스터 저장
     * @param apcSurveyMstVO
     * @return
     * @throws Exception
     */
    public int updateApcCmsuMst(ApcSurveyMstVO apcSurveyMstVO) throws Exception;

    /**
     * APC전수조사마스터 기준연도 조회
     * @param
     * @return
     * @throws Exception
     */
    public List<ApcSurveyMstVO> selectApcCmsuCrtrYr() throws Exception;
}
