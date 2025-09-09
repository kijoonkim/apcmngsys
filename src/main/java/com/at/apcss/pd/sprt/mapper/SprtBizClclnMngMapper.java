package com.at.apcss.pd.sprt.mapper;

import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegMngVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnDmndDtlVO;
import com.at.apcss.pd.sprt.vo.SprtBizClclnMngVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface SprtBizClclnMngMapper {

    /**
     * 산지조직지원 정산관리 목록 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtBizDtbnMngList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 - 정산신청문서조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public SprtBizClclnMngVO selectSprtBizClclnDoc(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 - 정산신청문서신규등록
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public int insertSprtBizClclnDoc(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 - 정산신청문서수정
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public int updateSprtBizClclnDoc(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 정산관리 첨부파일 조회
     * @param sprtBizRegFileVO
     * @return
     * @throws Exception
     */
    public SprtBizRegFileVO selectSprtBizClclnAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;

    /**
     * 산지조직지원 정산관리 - 정산신청 목록조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtBizClclnAplyList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 정산관리 - 지원사업정산 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public SprtBizClclnMngVO selectSprtBizClcln(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 정산관리 - 지원사업정산 등록
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public int insertSprtBizClcln(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 정산관리 - 정산문서파일경로 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtClclnFilePath(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 산지조직지원 정산관리 - 증빙코드 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtPrufCdList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 지원사업정산 팝업 - 파일정보조회
     * @param sprtBizRegFileVO
     * @return
     * @throws Exception
     */
    public SprtBizRegFileVO selectSprtClclnBizAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;

    /**
     * 지원사업정산문서 승인업데이트
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public int updateSprtClclnDoc(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 지원사업정산요청 요청순서
     * @param clclnDmnd
     * @return
     * @throws Exception
     */
    public int selectClclnDmndSeq(SprtBizClclnDmndDtlVO clclnDmnd) throws Exception;

    /**
     * 지원사업정산요청 단건 조회
     * @param clclnDmnd
     * @return
     * @throws Exception
     */
    public SprtBizClclnDmndDtlVO selectClclnDmnd(SprtBizClclnDmndDtlVO clclnDmnd) throws Exception;

    /**
     * 지원사업정산요청 등록
     * @param clclnDmnd
     * @return
     * @throws Exception
     */
    public int insertClclnDmnd(SprtBizClclnDmndDtlVO clclnDmnd) throws Exception;

    /**
     * 지원사업정산요청문서 단건 조회
     * @param docVO
     * @return
     * @throws Exception
     */
    public SprtBizClclnDmndDtlVO selectClclnDmndDoc(SprtBizClclnDmndDtlVO docVO) throws Exception;

    /**
     * 지원사업정산요청문서 등록
     * @param docVO
     * @return
     * @throws Exception
     */
    public int insertClclnDmndDoc(SprtBizClclnDmndDtlVO docVO) throws Exception;

    /**
     * 지원사업 - 정산결과 목록 조회
     * @param sprtBizClclnMngVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnMngVO> selectSprtClclnRsltList(SprtBizClclnMngVO sprtBizClclnMngVO) throws Exception;

    /**
     * 정산결과 정산인정액 수정
     * @param clclnVO
     * @return
     * @throws Exception
     */
    public int updateClclnAprvAmt(SprtBizClclnMngVO clclnVO) throws Exception;

    /**
     * 정산신청 증빙조회
     * @param sprtBizClclnDmndDtlVO
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnDmndDtlVO> selectClclnPrufList(SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO) throws Exception;

    /**
     * 지원사업정산요청 수정
     * @param clclnDmnd
     * @return
     * @throws Exception
     */
    public int updateClclnDmnd(SprtBizClclnDmndDtlVO clclnDmnd) throws Exception;

    /**
     * 지원사업정산요청 문서순번
     * @param clclnDmnd
     * @return
     * @throws Exception
     */
    public int selectDocSeq(SprtBizClclnDmndDtlVO clclnDmnd) throws Exception;

    /**
     * 지원사업정산요청문서 증빙서류 삭제
     * @param sprtBizClclnDmndDtlVO
     * @return
     * @throws Exception
     */
    public int deleteClclnPrufDoc(SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO) throws Exception;

    /**
     * 지원사업 첨부파일삭제
     * @param dmndDocInfo
     * @return
     * @throws Exception
     */
    public int deleteSprtAtchFile(SprtBizClclnDmndDtlVO dmndDocInfo) throws Exception;

    /**
     * 지원사업정산 증빙서류 팝업 - 파일정보조회
     * @param sprtBizRegFileVO
     * @return
     * @throws Exception
     */
    public SprtBizRegFileVO selectSprtClclnPrufAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;

    /**
     * 지원사업정산 증빙서류 전체 목록 조회
     * @param sprtBizClclnDmndDtlVO
     * @return
     * @throws Exception
     */
    List<SprtBizClclnDmndDtlVO> selectSprtClclnPrufDocList(SprtBizClclnDmndDtlVO sprtBizClclnDmndDtlVO);

    /**
     * 지원사업정산요청 삭제
     * @param
     * @return
     * @throws Exception
     */
    public int deleteClclnDmnd(SprtBizClclnDmndDtlVO deleteVO) throws Exception;

    /**
     * 지원사업정산요청문서 삭제시 조회
     * @param
     * @return
     * @throws Exception
     */
    public List<SprtBizClclnDmndDtlVO> selectClclnDmndDocList(SprtBizClclnDmndDtlVO deleteVO) throws Exception;

    /**
     * 지원사업첨부파일 조회
     * @param
     * @return
     * @throws Exception
     */
    public SprtBizClclnDmndDtlVO selectSprtBizAtchfl(SprtBizClclnDmndDtlVO clclnDmndDocVO) throws Exception;
}
