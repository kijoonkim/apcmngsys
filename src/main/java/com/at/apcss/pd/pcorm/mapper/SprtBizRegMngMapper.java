package com.at.apcss.pd.pcorm.mapper;

import com.at.apcss.pd.pcorm.vo.SprtBizRegFileVO;
import com.at.apcss.pd.pcorm.vo.SprtBizRegMngVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;


/**
 * 산지조직지원신청관리 인터페이스
 * @author 유민지
 * @since 2025.06.09
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.06.09  유민지        최초 생성
 * </pre>
 */
@Mapper
public interface SprtBizRegMngMapper {


	/**
	 * 산지조직지원신청관리 신청목록 조회
	 * @param sprtBizRegMngVO
	 * @return List<SprtBizRegMngVO>
	 * @throws Exception
	 */
	public List<SprtBizRegMngVO> selectApoSprtAplyList(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

	/**
	 * 지원사업마스터 조회
	 * @param sprtBizParamVO
	 * @return SprtBizRegMngVO
	 * @throws Exception
	 */
	public SprtBizRegMngVO selectSprtBizMstr(SprtBizRegMngVO sprtBizParamVO) throws Exception;

	/**
	 * 지원사업 조직아이디 조회 프로시저
	 * @param sprtBizRegMngVO
	 * @return
	 * @throws Exception
	 */
	public void selectSpSprtBizOgnzId(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

	/**
	 * 지원사업신청 조회
	 * @param sprtBizRegMngVO
	 * @return
	 * @throws Exception
	 */
	public SprtBizRegMngVO selectSprtBizAply(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

	/**
	 * 지원사업신청 등록
	 * @param sprtBizRegMngVO
	 * @return
	 * @throws Exception
	 */
	public int insertSprtBizAply(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

	/**
	 * 지원사업신청 수정
	 * @param sprtBizRegMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSprtBizAply(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

	/**
	 * 지원사업신청문서 조회
	 * @param sprtBizRegFile
	 * @return
	 * @throws Exception
	 */
	public SprtBizRegFileVO selectSprtBizAplyDoc(SprtBizRegFileVO sprtBizRegFile) throws Exception;

	/**
	 * 지원사업신청문서 등록
	 * @param sprtBizRegFile
	 * @return
	 * @throws Exception
	 */
	public int insertSprtAplyDoc(SprtBizRegFileVO sprtBizRegFile) throws Exception;

	/**
	 * 지원사업신청문서 수정
	 * @param sprtBizRegFile
	 * @return
	 * @throws Exception
	 */
	public int updateSprtAplyDoc(SprtBizRegFileVO sprtBizRegFile) throws Exception;

	/**
	 * 지원사업신청첨부파일 등록
	 * @param sprtBizRegFile
	 * @return
	 * @throws Exception
	 */
	public int insertSprtAplyAtchfl(SprtBizRegFileVO sprtBizRegFile) throws Exception;

	/**
	 * 지원사업신청 - 첨부파일일련번호 시퀀스
	 * @param
	 * @return
	 * @throws Exception
	 */
	public long selectNewSqEvSprtBizAtchflSn();

	/**
	 * 지원사업신청 파일경로 조회
	 * @param
	 * @return
	 * @throws Exception
	 */
    public List<SprtBizRegMngVO> selectSprtBizFilePath(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

	/**
	 * 지원사업신청 파일경로 조회
	 * @param
	 * @return
	 * @throws Exception
	 */
	public SprtBizRegMngVO selectSprtBizAplyDocForUpdate(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

	/**
	 * 지원사업신청 팝업 - 확인/미확인 업데이트
	 * @param sprtBizRegMngVO
	 * @return
	 * @throws Exception
	 */
	public int updateSprtBizAplyDoc(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;

	/**
	 * 지원사업신청 팝업 - 파일정보조회
	 * @param sprtBizRegFileVO
	 * @return
	 * @throws Exception
	 */
	public SprtBizRegFileVO selectSprtBizAtchfl(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;

	/**
	 * 지원사업신청 - 제출서류일괄다운로드
	 * @param sprtBizRegFileVO
	 * @return
	 * @throws Exception
	 */
    public List<SprtBizRegFileVO> selectSprtFileInfoList(SprtBizRegFileVO sprtBizRegFileVO) throws Exception;

	/**
	 * 지원사업신청 - 로우데이터조회
	 * @param sprtBizRegMngVO
	 * @return
	 * @throws Exception
	 */
    public List<SprtBizRegMngVO> selectSprtBizRawData(SprtBizRegMngVO sprtBizRegMngVO) throws Exception;
}
