package com.at.apcss.pd.sprt.mapper;

import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegMngVO;
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
}
