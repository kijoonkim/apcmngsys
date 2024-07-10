package com.at.apcss.am.wrhs.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.wrhs.vo.CltvtnBscInfoVO;
import com.at.apcss.am.wrhs.vo.CltvtnFrmhsQltVO;
import com.at.apcss.am.wrhs.vo.CltvtnHstryVO;
import com.at.apcss.am.wrhs.vo.CltvtnListVO;
import com.at.apcss.am.wrhs.vo.FrmhsExpctWrhsDtlVO;
import com.at.apcss.am.wrhs.vo.FrmhsExpctWrhsVO;

/**
 * 영농관리 Service 인터페이스
 * @author 김  호
 * @since 2024.06.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.06.25  김  호        최초 생성
 * </pre>
 */
public interface FrmerInfoService {

	/**
	 * 재배기본정보 목록 조회
	 * @param cltvtnBscInfoVO
	 * @return List<CltvtnBscInfoVO>
	 * @throws Exception
	 */
	public List<CltvtnBscInfoVO> selectCltvtnBscInfoList(CltvtnBscInfoVO cltvtnBscInfoVO) throws Exception;

	/**
	 * 재배기본정보 등록
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertCltvtnBscInfo(CltvtnBscInfoVO cltvtnBscInfoVO) throws Exception;

	/**
	 * 재배기본정보 수정
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateCltvtnBscInfo(CltvtnBscInfoVO cltvtnBscInfoVO) throws Exception;

	/**
	 * 재배이력 목록 조회
	 * @param cltvtnBscInfoVO
	 * @return List<CltvtnBscInfoVO>
	 * @throws Exception
	 */
	public List<CltvtnHstryVO> selectCltvtnHstryList(CltvtnHstryVO cltvtnHstryVO) throws Exception;

	/**
	 * 재배이력 등록
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertCltvtnHstry(CltvtnHstryVO cltvtnHstryVO) throws Exception;

	/**
	 * 재배이력 수정
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateCltvtnHstry(CltvtnHstryVO cltvtnHstryVO) throws Exception;

	/**
	 * 재배이력 삭제
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCltvtnHstry(CltvtnHstryVO cltvtnHstryVO) throws Exception;


	/**
	 * 재배정보 다중 저장
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public HashMap<String, Object> multiFrmerInfoList(CltvtnListVO cltvtnListVO) throws Exception;

	/**
	 * 재배농가품질 목록 조회
	 * @param cltvtnFrmhsQltVO
	 * @return List<CltvtnFrmhsQltVO>
	 * @throws Exception
	 */
	public List<CltvtnFrmhsQltVO> selectCltvtnFrmhsQltList(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception;

	/**
	 * 재배농가품질 등록
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertCltvtnFrmhsQlt(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception;

	/**
	 * 재배농가품질 수정
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateCltvtnFrmhsQlt(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception;
	/**
	 * 재배농가품질 삭제
	 * @param cltvtnBscInfoVO
	 * @return Integer
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCltvtnFrmhsQlt(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception;

	/**
<<<<<<< HEAD
=======
	 * 재배농가품질 다중 저장
	 * @param List<CltvtnFrmhsQltVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> multiCltvtnFrmhsQltList(List<CltvtnFrmhsQltVO> cltvtnFrmhsQltList) throws Exception;

	/**
>>>>>>> main
	 * 농가예상입고 목록 조회
	 * @param frmhsExpctWrhsVO
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	public List<FrmhsExpctWrhsVO> selectFrmhsExpctWrhsList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

	/**
	 * 농가예상입고 등록
	 * @param frmhsExpctWrhsVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertFrmhsExpctWrhs(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

	/**
	 * 농가예상입고 수정
	 * @param frmhsExpctWrhsVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateFrmhsExpctWrhs(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

	/**
	 * 농가예상입고 삭제
	 * @param frmhsExpctWrhsVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteFrmhsExpctWrhs(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

	/**
	 * 농가예상입고상세 등록
	 * @param frmhsExpctWrhsVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertFrmhsExpctWrhsDtl(FrmhsExpctWrhsDtlVO frmhsExpctWrhsDtlVO) throws Exception;

	/**
	 * 농가예상입고상세 수정
	 * @param frmhsExpctWrhsVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateFrmhsExpctWrhsDtl(FrmhsExpctWrhsDtlVO frmhsExpctWrhsDtlVO) throws Exception;

	/**
	 * 농가예상입고상세 삭제
	 * @param frmhsExpctWrhsVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteFrmhsExpctWrhsDtl(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

	/**
	 * 농가예상입고 다중 저장
	 * @param List<FrmhsExpctWrhsVO>
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	public HashMap<String, Object> multiFrmhsExpctWrhsList(List<FrmhsExpctWrhsVO> frmhsExpctWrhsList) throws Exception;

	/**
	 * 농가예상입고 전체 삭제
	 * @param frmhsExpctWrhsVO
	 * @return Integer
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteFrmhsExpct(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

}
