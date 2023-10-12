package com.at.apcss.fm.fclt.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.fclt.vo.FcltInstlInfoCurntStnVO;


/**
 * 시설설치보완 Service 인터페이스
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
public interface FcltInstlInfoCurntStnService {

	/**
	 * 시설설치보완정보를 조회한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 * @throws Exception
	 */
	public FcltInstlInfoCurntStnVO selectFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception;

	/**
	 * 시설설치보완정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public FcltInstlInfoCurntStnVO selectFcltInstlInfoCurntStn(String msgKey) throws Exception;

	/**
	 * 시설설치보완 목록을 조회한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 * @throws Exception
	 */
	public List<FcltInstlInfoCurntStnVO> selectFcltInstlInfoCurntStnList(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception;


	/**
	 * 시설설치보완정보를 등록한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 * @throws Exception
	 */
	public int insertFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception;

	/**
	 * 시설설치보완정보를 변경한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 * @throws Exception
	 */
	public int updateFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception;

	/**
	 * 시설설치보완정보를 삭제한다.
	 * @param fcltInstlInfoCurntStnVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltInstlInfoCurntStn(FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO) throws Exception;

	/**
	 * 시설설치보완 목록을 삭제한다.
	 * @param fcltInstlInfoCurntStnList
	 * @return
	 * @throws Exception
	 */
	public int deleteFcltInstlInfoCurntStnList(List<FcltInstlInfoCurntStnVO> fcltInstlInfoCurntStnList) throws Exception;

}
