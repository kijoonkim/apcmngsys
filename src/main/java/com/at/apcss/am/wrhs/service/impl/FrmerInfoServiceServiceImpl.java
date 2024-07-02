package com.at.apcss.am.wrhs.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.wrhs.mapper.FrmerInfoMapper;
import com.at.apcss.am.wrhs.service.FrmerInfoService;
import com.at.apcss.am.wrhs.vo.CltvtnBscInfoVO;
import com.at.apcss.am.wrhs.vo.CltvtnFrmhsQltVO;
import com.at.apcss.am.wrhs.vo.CltvtnHstryVO;
import com.at.apcss.am.wrhs.vo.CltvtnListVO;
import com.at.apcss.am.wrhs.vo.FrmhsExpctWrhsVO;
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
public class FrmerInfoServiceServiceImpl extends BaseServiceImpl implements FrmerInfoService {

	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="frmerInfoMapper")
	private FrmerInfoMapper frmerInfoMapper;

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

		List<CltvtnBscInfoVO> cltvtnBscInfoList = cltvtnListVO.getCltvtnBscInfoList();
		List<CltvtnHstryVO> cltvtnHstryList = cltvtnListVO.getCltvtnHstryList();
		List<CltvtnFrmhsQltVO> cltvtnFrmhsQltList = cltvtnListVO.getCltvtnFrmhsQltList();

		String prgrmId  = cltvtnListVO.getSysLastChgPrgrmId();
		String userId  = cltvtnListVO.getSysLastChgUserId();

		if (cltvtnBscInfoList != null) {
			for (CltvtnBscInfoVO cltvtnBscInfoVO : cltvtnBscInfoList) {

				// 필수 값 체크
				if (cltvtnBscInfoVO.getApcCd().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "APC코드"); // W0005	{0}이/가 없습니다.
				}

				if (cltvtnBscInfoVO.getPrdcrCd().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "생산자"); // W0005	{0}이/가 없습니다.
				}

				cltvtnBscInfoVO.setSysLastChgPrgrmId(prgrmId);
				cltvtnBscInfoVO.setSysLastChgUserId(userId);

				if (ComConstants.ROW_STS_INSERT.equals(cltvtnBscInfoVO.getRowSts())) {
					// 재배기본정보번호 발번
					String cltvtnBscInfoNo = frmerInfoMapper.selectGetCltvtnBscInfoNo(cltvtnBscInfoVO);

					cltvtnBscInfoVO.setCltvtnBscInfoNo(cltvtnBscInfoNo);
					cltvtnBscInfoVO.setSysFrstInptPrgrmId(prgrmId);
					cltvtnBscInfoVO.setSysFrstInptUserId(userId);

					if (1 != 0) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}

				if (ComConstants.ROW_STS_UPDATE.equals(cltvtnBscInfoVO.getRowSts())) {

					if (cltvtnBscInfoVO.getCltvtnBscInfoNo().isEmpty()) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재배기본정보번호"); // W0005	{0}이/가 없습니다.
					}

					if (1 != 0) {
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

				if (cltvtnHstryVO.getMngmstRegno().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "경영체등록번호"); // W0005	{0}이/가 없습니다.
				}

				if (cltvtnHstryVO.getFarmLandSn().isEmpty()) {
					return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "경영체등록순번"); // W0005	{0}이/가 없습니다.
				}

				cltvtnHstryVO.setSysLastChgPrgrmId(prgrmId);
				cltvtnHstryVO.setSysLastChgUserId(userId);

				if (ComConstants.ROW_STS_INSERT.equals(cltvtnHstryVO.getRowSts())) {

					// 재배이력번호 발번
					String cltvtnHstryNo = frmerInfoMapper.selectGetCltvtnHstryNo(cltvtnHstryVO);
					cltvtnHstryVO.setCltvtnHstryNo(cltvtnHstryNo);
					cltvtnHstryVO.setSysFrstInptPrgrmId(prgrmId);
					cltvtnHstryVO.setSysFrstInptUserId(userId);

					if (1 != 0) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}

				if (ComConstants.ROW_STS_UPDATE.equals(cltvtnHstryVO.getRowSts())) {

					if (cltvtnHstryVO.getCltvtnHstryNo().isEmpty()) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재배이력번호"); // W0005	{0}이/가 없습니다.
					}

					if (1 != 0) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}
		}

		if (cltvtnFrmhsQltList != null) {

			for (CltvtnFrmhsQltVO cltvtnFrmhsQltVO : cltvtnFrmhsQltList) {

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

					if (1 != insertCltvtnFrmhsQlt(cltvtnFrmhsQltVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}

				if (ComConstants.ROW_STS_UPDATE.equals(cltvtnFrmhsQltVO.getRowSts())) {

					if (cltvtnFrmhsQltVO.getCltvtnFrmhsQltNo().isEmpty()) {
						return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "재배농가품질번호"); // W0005	{0}이/가 없습니다.
					}

					if (1 != updateCltvtnFrmhsQlt(cltvtnFrmhsQltVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}
		}


		return null;
	}

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

	@Override
	public HashMap<String, Object> deleteCltvtnFrmhsQlt(CltvtnFrmhsQltVO cltvtnFrmhsQltVO) throws Exception {

		if (1 != frmerInfoMapper.deleteCltvtnFrmhsQlt(cltvtnFrmhsQltVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public List<FrmhsExpctWrhsVO> selectFrmhsExpctWrhsList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		List<FrmhsExpctWrhsVO> resultList = frmerInfoMapper.selectFrmhsExpctWrhsList(frmhsExpctWrhsVO);
		return resultList;
	}

}
