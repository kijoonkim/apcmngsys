package com.at.apcss.am.cmns.mapper;

import com.at.apcss.am.cmns.vo.PrdcrVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 생산자정보 Mapper 인터페이스
 *
 * @author 신정철
 * @version 1.0
 * @see <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 * @since 2023.06.21
 */
@Mapper
public interface PrdcrMapper {

    /**
     * 생산자정보 단건 조회
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	PrdcrVO selectPrdcr(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자정보 단건 조회 by 식별번호
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	PrdcrVO selectPrdcrByIdentno(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자정보 단건 조회
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	PrdcrVO selectPrdcrNm(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자정보 목록 조회
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	List<PrdcrVO> selectPrdcrList(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자정보 코드 목록 조회
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	List<PrdcrVO> selectPrdcrCdList(PrdcrVO prdcrVO) throws Exception;

    /**
     * 아그리스 생산자 마스터 목록 조회
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	List<PrdcrVO> selectAgrixPrdcrList(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자코드 발번
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	PrdcrVO selectNewPrdcrCd(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자정보 등록
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	int insertPrdcr(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자정보 변경
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	int updatePrdcr(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자정보 변경
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	int updatePrdcrNm(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자 대표정보 변경
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	int updatePrdcrRprs(PrdcrVO prdcrVO) throws Exception;


    /**
     * 생산자정보 삭제
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	int deletePrdcr(PrdcrVO prdcrVO) throws Exception;

    /**
     * APC 생산자 정보 업데이트
     *
     * @param prdcrVO
     * @return integer
     * @throws Exception
     */
	int updateApcPrdcr(PrdcrVO prdcrVO) throws Exception;

    /**
     * APC 생산자 농가 기본 정보 업데이트
     *
     * @param PrdcrVO
     * @return integer
     * @throws Exception
     */
	int updateApcPrdcrFrmhs(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자상세유형정보 목록 조회
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	List<PrdcrVO> selectPrdcrTypeDtlList(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자상세유형품종 목록 조회
     *
     * @param prdcrVO
     * @return
     * @throws Exception
     */
	List<PrdcrVO> selectPrdcrTypeDtlVrty(PrdcrVO prdcrVO) throws Exception;

    /**
     * 생산자상세유형정보 목록 등록
     *
     * @param PrdcrVO
     * @return integer
     * @throws Exception
     */
	int insertPrdcrTypeDtl(PrdcrVO prdcrVO);

    /**
     * 생산자상세유형정보 목록 수정
     *
     * @param PrdcrVO
     * @return integer
     * @throws Exception
     */
	int updatePrdcrTypeDtl(PrdcrVO prdcrVO);


    /**
     * 생산자상세유형정보 목록 삭제
     *
     * @param PrdcrVO
     * @return integer
     * @throws Exception
     */
	int deletePrdcrTypeDtl(PrdcrVO prdcrVO);

    /**
     * 생산자정보 삭제 가능 여부
     *
     * @param prdcrVO
     * @return List<PrdcrVO>
     * @throws Exception
     */
	List<PrdcrVO> prdcrDelible(PrdcrVO prdcrVO) throws Exception;
}
