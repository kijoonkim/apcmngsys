package com.at.apcss.co.user.mapper;


import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.co.user.vo.ComUserApcVO;
import com.at.apcss.co.user.vo.ComUserVO;

@Mapper
public interface ComUserMapper {

	/**
	 * 사용자정보 조회
	 * @param comUserVO
	 * @return ComUserVO
	 */
	public ComUserVO selectComUser(ComUserVO comUserVO);

	/**
	 * 사용자정보 목록 조회
	 * @param comUserVO
	 * @return List<>
	 */
	public List<ComUserVO> selectComUserList(ComUserVO comUserVO);

	/**
	 * APC관리자승인등록 목록 조회
	 * @param comUserVO
	 * @return List<>
	 */
	public List<ComUserVO> selectComUserApcList(ComUserVO comUserVO);
	
	/**
	 * 통합사용자승인등록 목록 조회
	 * @param comUserVO
	 * @return List<>
	 */
	public List<ComUserVO> selectUntyUserAprvList(ComUserVO comUserVO);
	
	/**
	 * 법인사용자승인등록 목록 조회
	 * @param comUserVO
	 * @return List<>
	 */
	public List<ComUserVO> selectCorpUserAprvList(ComUserVO comUserVO);
	
	/**
	 * 지자체사용자승인등록 목록 조회
	 * @param comUserVO
	 * @return List<>
	 */
	public List<ComUserVO> selectLocgovUserAprvList(ComUserVO comUserVO);

	
	/**
	 * 사용자 승인상태 변경
	 * @param comUserVO
	 * @return List<>
	 */
	public int updateComUserAprv(ComUserVO comUserVO);

	/**
	 * APC관리자승인등록-사용자유형 변경
	 * @param comUserVO
	 * @return int
	 */
	public int updateUserType(ComUserVO comUserVO);

	/**
	 * 사용자 정보 변경
	 * @param comUserVO
	 * @return List<>
	 */
	public int updateComUser(ComUserVO comUserVO) throws Exception;

	/**
	 * 사용자 정보 변경
	 * @param comUserVO
	 * @return List<>
	 */
	public int updateComUserStts(ComUserVO comUserVO) throws Exception;

	/**
	 * 비밀번호 초기화
	 * @param comUserVO
	 * @return List<>
	 */
	public int updComUserPwd(ComUserVO comUserVO);
	/**
	 * 계정 추가
	 * @param comUserVO
	 * @return int
	 * @throws Exception
	 */
	public int insertAccount(ComUserVO comUserVO);
	/**
	 * 계정 정책 추가
	 * @param comUserVO
	 * @return int
	 * @throws Exception
	 */
	public int insertLgnPlcy(ComUserVO comUserVO);
	/**
	 * 계정 중복 체크
	 * @param comUserVO
	 * @return comUserVO
	 * @throws Exception
	 */
	public ComUserVO selectAccountDupChk(ComUserVO comUserVO);


    /**
     * 생산농가 계정관리 요청목록 조회
     * @param hashMap
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectComUserPrdcrAprvList(HashMap<String, Object> comUserVO) throws Exception;

    /**
     * 생산농가 계정관리 생산농가목록 조회
     * @param hashMap
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectComUserPrdcrList(HashMap<String, Object> comUserVO) throws Exception;

    /**
     * 생산농가 계정에 속한 생산자 목록 조회
     * @param hashMap
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectUserPrdcrList(HashMap<String, Object> comUserVO) throws Exception;

    public List<HashMap<String, Object>> selectComUserPrdcrRegList(HashMap<String, Object> comUserVO) throws Exception;

    public int updateUserAprv(HashMap<String, Object> comUserVO);
    public int insertPrdcrUserId(HashMap<String, Object> comUserVO);
    public int updatePrdcrUserId(HashMap<String, Object> comUserVO);
    public List<HashMap<String, Object>> selectComUserAprvList(HashMap<String, Object> comUserVO) throws Exception;
    public int deletePrdcrUserId(HashMap<String,Object> comUserVO);

    public HashMap<String,Object> selectUserAprv(HashMap<String,Object> comUser);
    public int delComUserAprv(HashMap<String,Object> comUser);
    
    public void insertSpUntyAuthAprv(ComUserVO comUserVO) throws Exception;
    
    /**
     * 통합사용자승인(법인, 지자체)
     * @param comUserVO
     * @throws Exception
     */
    public void insertSpUserAuthAprv(ComUserVO comUserVO) throws Exception;
    
    
    /**
     * 통합사용자승인(법인, 지자체) 취소
     * @param comUserVO
     * @throws Exception
     */
    public void deleteSpUserAuthAprv(ComUserVO comUserVO) throws Exception;
    
    
    /**
     * 사용자별 APC 목록 조회
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public List<ComUserVO> selectUserApcList(ComUserVO comUserVO) throws Exception;
    
    /**
     * 사용자별 APC 조회
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public ComUserApcVO selectUserApc(ComUserApcVO comUserApcVO) throws Exception;
    
    /**
     * 법인 APC 조회
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public ComUserApcVO selectCorpApc(ComUserApcVO comUserApcVO) throws Exception;
    
    
    /**
     * 사용자별 APC 등록
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public int insertUserApc(ComUserApcVO comUserApcVO) throws Exception;
    
    /**
     * 사용자별 APC 변경
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public int updateUserApc(ComUserApcVO comUserApcVO) throws Exception;
    
    /**
     * 사용자별 APC 삭제
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public int deleteUserApc(ComUserApcVO comUserApcVO) throws Exception;
    
    /**
     * 통합조직 승인 APC 목록조회
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public List<ComUserApcVO> selectOgnzAprvApcList(ComUserVO comUserVO) throws Exception;
    
    
    /**
     * 사용자별 APC 승인
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public int updateUserApcAprv(ComUserApcVO comUserApcVO) throws Exception;
    
    /**
     * 사용자별 APC 승인 취소
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public int updateUserApcAprvCncl(ComUserApcVO comUserApcVO) throws Exception;

    /**
     * 사용자별 APC 변경이력 등록
     * @param comUserVO
     * @return
     * @throws Exception
     */
    public int insertUserApcHstry(ComUserApcVO comUserApcVO) throws Exception;
    
}


