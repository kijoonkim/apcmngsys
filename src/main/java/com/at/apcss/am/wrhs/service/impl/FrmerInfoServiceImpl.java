package com.at.apcss.am.wrhs.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.ComAtchflService;
import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.vo.ComAtchflVO;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.am.wrhs.mapper.FrmerInfoMapper;
import com.at.apcss.am.wrhs.service.FrmerInfoService;
import com.at.apcss.am.wrhs.service.PrdcrLandInfoService;
import com.at.apcss.am.wrhs.vo.CltvtnBscInfoVO;
import com.at.apcss.am.wrhs.vo.CltvtnFrmhsQltVO;
import com.at.apcss.am.wrhs.vo.CltvtnHstryVO;
import com.at.apcss.am.wrhs.vo.CltvtnListVO;
import com.at.apcss.am.wrhs.vo.FrmhsExpctWrhsDdlnVO;
import com.at.apcss.am.wrhs.vo.FrmhsExpctWrhsDtlVO;
import com.at.apcss.am.wrhs.vo.FrmhsExpctWrhsVO;
import com.at.apcss.am.wrhs.vo.PrdcrLandInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : FrmerInfoServiceServiceImpl.java
 * @Description : 영농관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("frmerInfoService")
public class FrmerInfoServiceImpl extends BaseServiceImpl implements FrmerInfoService {

	@Resource(name="comAtchflService")
	private ComAtchflService comAtchflService;

	@Resource(name="frmerInfoMapper")
	private FrmerInfoMapper frmerInfoMapper;

	@Resource(name="prdcrService")
	private PrdcrService prdcrService;

	@Resource(name="prdcrLandInfoService")
	private PrdcrLandInfoService prdcrLandInfoService;

	/**
	 * 재배기준정보 조회
	 * @param CltvtnBscInfoVO
	 * @param request
	 * @return List<CltvtnBscInfoVO>
	 * @throws Exception
	 */
	@Override
	public List<CltvtnBscInfoVO> selectCltvtnBscInfoList(CltvtnBscInfoVO cltvtnBscInfoVO) throws Exception {
		List<CltvtnBscInfoVO> resultList = frmerInfoMapper.selectCltvtnBscInfoList(cltvtnBscInfoVO);
		return resultList;
	}

	/**
	 * 재배기준정보 등록
	 * @param cltvtnBscInfoVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int insertCltvtnBscInfo(CltvtnBscInfoVO cltvtnBscInfoVO) throws Exception {
		int insertedCnt = frmerInfoMapper.insertCltvtnBscInfo(cltvtnBscInfoVO);
		return insertedCnt;
	}

	/**
	 * 재배기준정보 수정
	 * @param cltvtnBscInfoVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int updateCltvtnBscInfo(CltvtnBscInfoVO cltvtnBscInfoVO) throws Exception {
		int updatedCnt = frmerInfoMapper.updateCltvtnBscInfo(cltvtnBscInfoVO);
		return updatedCnt;
	}

	/**
	 * 재배이력 목록 조회
	 * @param cltvtnHstryVO
	 * @param request
	 * @return List<CltvtnBscInfoVO>
	 * @throws Exception
	 */
	@Override
	public List<CltvtnHstryVO> selectCltvtnHstryList(CltvtnHstryVO cltvtnHstryVO) throws Exception {
		List<CltvtnHstryVO> resultList = frmerInfoMapper.selectCltvtnHstryList(cltvtnHstryVO);
		return resultList;
	}

	/**
	 * 재배이력 등록
	 * @param cltvtnHstryVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int insertCltvtnHstry(CltvtnHstryVO cltvtnHstryVO) throws Exception {
		String cltvtnHstryNo = frmerInfoMapper.selectGetCltvtnHstryNo(cltvtnHstryVO);
		cltvtnHstryVO.setCltvtnHstryNo(cltvtnHstryNo);

		int insertedCnt = frmerInfoMapper.insertCltvtnHstry(cltvtnHstryVO);
		return insertedCnt;
	}

	/**
	 * 재배이력 수정
	 * @param cltvtnHstryVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int updateCltvtnHstry(CltvtnHstryVO cltvtnHstryVO) throws Exception {
		int updatedCnt = frmerInfoMapper.updateCltvtnHstry(cltvtnHstryVO);
		return updatedCnt;
	}

	/**
	 * 영농관리 다중 저장
	 * @param CltvtnListVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> multiFrmerInfoList(CltvtnListVO cltvtnListVO) throws Exception {

		PrdcrVO	prdcrVO	= cltvtnListVO.getPrdcrVO();
		CltvtnFrmhsQltVO cltvtnFrmhsQltVO = cltvtnListVO.getCltvtnFrmhsQltVO();
		List<CltvtnHstryVO> cltvtnHstryList = cltvtnListVO.getCltvtnHstryList();
		List<PrdcrLandInfoVO> prdcrLandInfoVOList = cltvtnListVO.getPrdcrLandInfoList();

		String prgrmId  = cltvtnListVO.getSysLastChgPrgrmId();
		String userId  = cltvtnListVO.getSysLastChgUserId();

		if (prdcrVO != null) {
			prdcrVO.setSysLastChgPrgrmId(prgrmId);
			prdcrVO.setSysLastChgUserId(userId);

			// 필수 값 체크
			if (prdcrVO.getApcCd().isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드"); // W0005	{0}이/가 없습니다.
			}

			if (prdcrVO.getPrdcrCd().isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자"); // W0005	{0}이/가 없습니다.
			}

			if (0 == prdcrService.updateApcPrdcrFrmhs(prdcrVO)) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}

		if (cltvtnFrmhsQltVO != null) {

			// 필수 값 체크
			if (cltvtnFrmhsQltVO.getApcCd().isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드"); // W0005	{0}이/가 없습니다.
			}

			if (cltvtnFrmhsQltVO.getPrdcrCd().isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자"); // W0005	{0}이/가 없습니다.
			}

			cltvtnFrmhsQltVO.setSysLastChgPrgrmId(prgrmId);
			cltvtnFrmhsQltVO.setSysLastChgUserId(userId);

			if (ComConstants.ROW_STS_INSERT.equals(cltvtnFrmhsQltVO.getRowSts())) {
				// 재배농가품질번호 발번
				String cltvtnFrmhsQltNo = frmerInfoMapper.selectGetCltvtnFrmhsQltNo(cltvtnFrmhsQltVO);
				cltvtnFrmhsQltVO.setCltvtnFrmhsQltNo(cltvtnFrmhsQltNo);
				cltvtnFrmhsQltVO.setSysFrstInptPrgrmId(prgrmId);
				cltvtnFrmhsQltVO.setSysFrstInptUserId(userId);



				if (0 == insertCltvtnFrmhsQlt(cltvtnFrmhsQltVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}

			if (ComConstants.ROW_STS_UPDATE.equals(cltvtnFrmhsQltVO.getRowSts())) {

				if (cltvtnFrmhsQltVO.getCltvtnFrmhsQltNo().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재배농가품질번호"); // W0005	{0}이/가 없습니다.
				}

				if (0 == updateCltvtnFrmhsQlt(cltvtnFrmhsQltVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}


		if (prdcrLandInfoVOList != null) {
			for (PrdcrLandInfoVO prdcrLandInfoVO : prdcrLandInfoVOList) {
				// 필수 값 체크
				if (prdcrLandInfoVO.getApcCd().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드"); // W0005	{0}이/가 없습니다.
				}

				if (prdcrLandInfoVO.getPrdcrCd().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자"); // W0005	{0}이/가 없습니다.
				}

				prdcrLandInfoVO.setSysLastChgPrgrmId(prgrmId);
				prdcrLandInfoVO.setSysLastChgUserId(userId);


				if (ComConstants.ROW_STS_INSERT.equals(prdcrLandInfoVO.getRowSts())) {

					String prdcrLandInfoNo = prdcrLandInfoService.selectGetPrdcrLandInfoNo(prdcrLandInfoVO);

					prdcrLandInfoVO.setPrdcrLandInfoNo(prdcrLandInfoNo);
					prdcrLandInfoVO.setSysFrstInptPrgrmId(prgrmId);
					prdcrLandInfoVO.setSysFrstInptUserId(userId);

					if (0 == prdcrLandInfoService.insertPrdcrLandInfo(prdcrLandInfoVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}

				if (ComConstants.ROW_STS_UPDATE.equals(prdcrLandInfoVO.getRowSts())) {

					if (0 == prdcrLandInfoService.updatePrdcrLandInfo(prdcrLandInfoVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}
		}


		if (cltvtnHstryList != null) {
			for (CltvtnHstryVO cltvtnHstryVO : cltvtnHstryList) {

				// 필수 값 체크
				if (cltvtnHstryVO.getApcCd().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드"); // W0005	{0}이/가 없습니다.
				}

				if (cltvtnHstryVO.getPrdcrCd().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자"); // W0005	{0}이/가 없습니다.
				}

				if (cltvtnHstryVO.getPrdcrLandInfoNo().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자농지정보번호"); // W0005	{0}이/가 없습니다.
				}

				cltvtnHstryVO.setSysLastChgPrgrmId(prgrmId);
				cltvtnHstryVO.setSysLastChgUserId(userId);

				if (ComConstants.ROW_STS_INSERT.equals(cltvtnHstryVO.getRowSts())) {

					// 재배이력번호 발번
					String cltvtnHstryNo = frmerInfoMapper.selectGetCltvtnHstryNo(cltvtnHstryVO);
					cltvtnHstryVO.setCltvtnHstryNo(cltvtnHstryNo);
					cltvtnHstryVO.setSysFrstInptPrgrmId(prgrmId);
					cltvtnHstryVO.setSysFrstInptUserId(userId);

					if (0 == frmerInfoMapper.insertCltvtnHstry(cltvtnHstryVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}

					ComAtchflVO comAtchflVO = cltvtnHstryVO.getComAtchflVO();

					if (comAtchflVO != null) {
						String prntsTblNo = "CQ" + cltvtnHstryVO.getApcCd() + cltvtnHstryVO.getPrdcrCd() + cltvtnHstryVO.getPrdcrLandInfoNo() + cltvtnHstryNo;
						comAtchflVO.setPrntsTblNo(prntsTblNo);
						comAtchflVO.setAtchflPath(cltvtnListVO.getAtchflPath());

						HashMap<String, Object> rtnOjb = comAtchflService.fileUpload(comAtchflVO);

						if (rtnOjb != null) {
							return rtnOjb;
						}

						comAtchflVO.setSysFrstInptPrgrmId(prgrmId);
						comAtchflVO.setSysFrstInptUserId(userId);
						comAtchflVO.setSysLastChgPrgrmId(prgrmId);
						comAtchflVO.setSysLastChgUserId(userId);

						if (0 == comAtchflService.insertComAtchfl(comAtchflVO)) {
							throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
						}
					}
				}

				if (ComConstants.ROW_STS_UPDATE.equals(cltvtnHstryVO.getRowSts())) {

					if (cltvtnHstryVO.getCltvtnHstryNo().isEmpty()) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재배이력번호"); // W0005	{0}이/가 없습니다.
					}
					ComAtchflVO comAtchflVO = cltvtnHstryVO.getComAtchflVO();

					if (comAtchflVO != null) {
						String prntsTblNo = "CQ" + cltvtnHstryVO.getApcCd() + cltvtnHstryVO.getPrdcrCd() + cltvtnHstryVO.getPrdcrLandInfoNo() + cltvtnHstryVO.getCltvtnHstryNo();
						comAtchflVO.setPrntsTblNo(prntsTblNo);
						comAtchflVO.setAtchflPath(cltvtnListVO.getAtchflPath());

						HashMap<String, Object> rtnOjb = comAtchflService.fileUpload(comAtchflVO);

						if (rtnOjb != null) {
							return rtnOjb;
						}

						comAtchflVO.setSysFrstInptPrgrmId(prgrmId);
						comAtchflVO.setSysFrstInptUserId(userId);
						comAtchflVO.setSysLastChgPrgrmId(prgrmId);
						comAtchflVO.setSysLastChgUserId(userId);

						if (0 == comAtchflService.insertComAtchfl(comAtchflVO)) {
							throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
						}
					}


					if (0 == frmerInfoMapper.updateCltvtnHstry(cltvtnHstryVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}
		}

		return null;
	}


	/**
	 * 재배이력 삭제
	 * @param cltvtnHstryVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> deleteCltvtnHstry(CltvtnHstryVO cltvtnHstryVO) throws Exception {

		if (0 == frmerInfoMapper.deleteCltvtnHstry(cltvtnHstryVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	};

	/**
	 * 재배농가품질 목록 조회
	 * @param cltvtnFrmhsQltVO
	 * @param request
	 * @return List<CltvtnFrmhsQltVO>
	 * @throws Exception
	 */
	@Override
	public List<CltvtnFrmhsQltVO> selectCltvtnFrmhsQltList(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception {
		List<CltvtnFrmhsQltVO> resultList = frmerInfoMapper.selectCltvtnFrmhsQltList(cltvtnFrmhsQltVO);
		return resultList;
	}

	/**
	 * 재배농가품질 등록
	 * @param cltvtnFrmhsQltVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int insertCltvtnFrmhsQlt(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception {
		int insertedCnt = frmerInfoMapper.insertCltvtnFrmhsQlt(cltvtnFrmhsQltVO);
		return insertedCnt;
	}

	/**
	 * 재배농가품질 수정
	 * @param cltvtnFrmhsQltVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int updateCltvtnFrmhsQlt(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception {
		int updatedCnt = frmerInfoMapper.updateCltvtnFrmhsQlt(cltvtnFrmhsQltVO);
		return updatedCnt;
	}

	/**
	 * 재배농가품질 삭제
	 * @param cltvtnFrmhsQltVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> deleteCltvtnFrmhsQlt(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception {

		if (0 == frmerInfoMapper.deleteCltvtnFrmhsQlt(cltvtnFrmhsQltVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	/**
	 * 재배농가품질 다중 저장
	 * @param List<CltvtnFrmhsQltVO>
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> multiCltvtnFrmhsQltList(List<CltvtnFrmhsQltVO> cltvtnFrmhsQltList) throws Exception {

		for (CltvtnFrmhsQltVO cltvtnFrmhsQltVO : cltvtnFrmhsQltList) {

			// 필수 값 체크
			if (cltvtnFrmhsQltVO.getApcCd().isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드"); // W0005	{0}이/가 없습니다.
			}

			if (cltvtnFrmhsQltVO.getPrdcrCd().isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자"); // W0005	{0}이/가 없습니다.
			}

			if (ComConstants.ROW_STS_INSERT.equals(cltvtnFrmhsQltVO.getRowSts())) {
				// 재배농가품질번호 발번
				String cltvtnFrmhsQltNo = frmerInfoMapper.selectGetCltvtnFrmhsQltNo(cltvtnFrmhsQltVO);
				cltvtnFrmhsQltVO.setCltvtnFrmhsQltNo(cltvtnFrmhsQltNo);

				if (0 == insertCltvtnFrmhsQlt(cltvtnFrmhsQltVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}

			if (ComConstants.ROW_STS_UPDATE.equals(cltvtnFrmhsQltVO.getRowSts())) {

				if (cltvtnFrmhsQltVO.getCltvtnFrmhsQltNo().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재배농가품질번호"); // W0005	{0}이/가 없습니다.
				}

				if (0 == updateCltvtnFrmhsQlt(cltvtnFrmhsQltVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
			}
		}
		return null;
	}

	/**
	 * 농가예상입고 목록 조회
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	@Override
	public List<FrmhsExpctWrhsVO> selectFrmhsExpctWrhsList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		List<FrmhsExpctWrhsVO> resultList = frmerInfoMapper.selectFrmhsExpctWrhsList(frmhsExpctWrhsVO);
		return resultList;
	}

	/**
	 * 농가예상입고 등록
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int insertFrmhsExpctWrhs(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		int insertedCnt = frmerInfoMapper.insertFrmhsExpctWrhs(frmhsExpctWrhsVO);
		return insertedCnt;
	}

	/**
	 * 농가예상입고 수정
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int updateFrmhsExpctWrhs(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		int updatedCnt = frmerInfoMapper.updateFrmhsExpctWrhs(frmhsExpctWrhsVO);
		return updatedCnt;
	}

	/**
	 * 농가예상입고 삭제
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int deleteFrmhsExpctWrhs(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		int deletedCnt = frmerInfoMapper.deleteFrmhsExpctWrhs(frmhsExpctWrhsVO);
		return deletedCnt;
	}

	/**
	 * 농가예상입고상세 등록
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int insertFrmhsExpctWrhsDtl(FrmhsExpctWrhsDtlVO frmhsExpctWrhsDtlVO) throws Exception {
		int insertedCnt = frmerInfoMapper.insertFrmhsExpctWrhsDtl(frmhsExpctWrhsDtlVO);
		return insertedCnt;
	}

	/**
	 * 농가예상입고상세 수정
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int updateFrmhsExpctWrhsDtl(FrmhsExpctWrhsDtlVO frmhsExpctWrhsDtlVO) throws Exception {
		int updatedCnt = frmerInfoMapper.updateFrmhsExpctWrhsDtl(frmhsExpctWrhsDtlVO);
		return updatedCnt;
	}

	/**
	 * 농가예상입고상세 삭제
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return Integer
	 * @throws Exception
	 */
	@Override
	public int deleteFrmhsExpctWrhsDtl(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		int deletedCnt = frmerInfoMapper.deleteFrmhsExpctWrhsDtl(frmhsExpctWrhsVO);
		return deletedCnt;
	}

	/**
	 * 농가예상입고 다중 저장
	 * @param List<FrmhsExpctWrhsVO>
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> multiFrmhsExpctWrhsList(List<FrmhsExpctWrhsVO> frmhsExpctWrhsList) throws Exception {

		for (FrmhsExpctWrhsVO frmhsExpctWrhsVO : frmhsExpctWrhsList) {

			// 필수 값 체크
			if (frmhsExpctWrhsVO.getApcCd().isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드"); // W0005	{0}이/가 없습니다.
			}

			if (frmhsExpctWrhsVO.getPrdcrCd().isEmpty()) {
				return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자"); // W0005	{0}이/가 없습니다.
			}


			if (ComConstants.ROW_STS_INSERT.equals(frmhsExpctWrhsVO.getRowSts())) {
				String frmhsExpctWrhsNo = frmerInfoMapper.selectGetFrmhsExpctWrhsNo(frmhsExpctWrhsVO);

				frmhsExpctWrhsVO.setFrmhsExpctWrhsNo(frmhsExpctWrhsNo);

				if (0 == frmerInfoMapper.insertFrmhsExpctWrhs(frmhsExpctWrhsVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}

				List<FrmhsExpctWrhsDtlVO> frmhsExpctWrhsDtlList = frmhsExpctWrhsVO.getFrmhsExpctWrhsDtlList();

				for (FrmhsExpctWrhsDtlVO frmhsExpctWrhsDtlVO : frmhsExpctWrhsDtlList) {

					frmhsExpctWrhsDtlVO.setFrmhsExpctWrhsNo(frmhsExpctWrhsNo);

					if (0 == frmerInfoMapper.insertFrmhsExpctWrhsDtl(frmhsExpctWrhsDtlVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}

			}


			if (ComConstants.ROW_STS_UPDATE.equals(frmhsExpctWrhsVO.getRowSts())) {

				if (0 == frmerInfoMapper.updateFrmhsExpctWrhs(frmhsExpctWrhsVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}

				List<FrmhsExpctWrhsDtlVO> frmhsExpctWrhsDtlList = frmhsExpctWrhsVO.getFrmhsExpctWrhsDtlList();

				for (FrmhsExpctWrhsDtlVO frmhsExpctWrhsDtlVO : frmhsExpctWrhsDtlList) {

					if (0 == frmerInfoMapper.updateFrmhsExpctWrhsDtl(frmhsExpctWrhsDtlVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}

		}


		return null;
	}

	/**
	 * 농가예상입고 삭제(상세 포함)
	 * @param frmhsExpctWrhsVO
	 * @param request
	 * @return HashMap<String, Object>
	 * @throws Exception
	 */
	@Override
	public HashMap<String, Object> deleteFrmhsExpct(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {

		if (0 == frmerInfoMapper.deleteFrmhsExpctWrhs(frmhsExpctWrhsVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		if (0 == frmerInfoMapper.deleteFrmhsExpctWrhsDtl(frmhsExpctWrhsVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public FrmhsExpctWrhsDdlnVO selectFrmhsExpctWrhsDdln(FrmhsExpctWrhsDdlnVO frmhsExpctWrhsDdlnVO) throws Exception {
		FrmhsExpctWrhsDdlnVO result = frmerInfoMapper.selectFrmhsExpctWrhsDdln(frmhsExpctWrhsDdlnVO);
		return result;
	}

	@Override
	public HashMap<String, Object> updateFrmhsExpctWrhsDdln(FrmhsExpctWrhsDdlnVO frmhsExpctWrhsDdlnVO) throws Exception {

		if (0 == frmerInfoMapper.updateFrmhsExpctWrhsDdln(frmhsExpctWrhsDdlnVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}
		return null;
	}
}
