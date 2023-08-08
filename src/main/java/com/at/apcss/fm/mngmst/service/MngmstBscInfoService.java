package com.at.apcss.fm.mngmst.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.mngmst.vo.MngmstBscInfoVO;


/**
 * 경영체정보 Service 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
public interface MngmstBscInfoService {

	/**
	 * 메시지정보를 조회한다.
	 * @param mngmstBscInfoVO
	 * @return
	 * @throws Exception
	 */
	public MngmstBscInfoVO selectMngmstBscInfo(MngmstBscInfoVO mngmstBscInfoVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public MngmstBscInfoVO selectMngmstBscInfo(String msgKey) throws Exception;

	/**
	 * 메시지 목록을 조회한다.
	 * @param mngmstBscInfoVO
	 * @return
	 * @throws Exception
	 */
	public List<MngmstBscInfoVO> selectMngmstBscInfoList(MngmstBscInfoVO mngmstBscInfoVO) throws Exception;


	/**
	 * 메시지정보를 등록한다.
	 * @param mngmstBscInfoVO
	 * @return
	 * @throws Exception
	 */
	public int insertMngmstBscInfo(MngmstBscInfoVO mngmstBscInfoVO) throws Exception;

	/**
	 * 메시지정보를 변경한다.
	 * @param mngmstBscInfoVO
	 * @return
	 * @throws Exception
	 */
	public int updateMngmstBscInfo(MngmstBscInfoVO mngmstBscInfoVO) throws Exception;

	/**
	 * 메시지정보를 삭제한다.
	 * @param mngmstBscInfoVO
	 * @return
	 * @throws Exception
	 */
	public int deleteMngmstBscInfo(MngmstBscInfoVO mngmstBscInfoVO) throws Exception;

	/**
	 * 메시지 목록을 삭제한다.
	 * @param mngmstBscInfoList
	 * @return
	 * @throws Exception
	 */
	public int deleteMngmstBscInfoList(List<MngmstBscInfoVO> mngmstBscInfoList) throws Exception;

}
