package com.at.apcss.am.spmt.mapper;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;

/**
 * 생산속보 Mapper 인터페이스
 * @author 박승진
 * @since 2024.11.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.20  박승진        최초 생성
 * </pre>
 */
@Mapper
public interface SpmtDdlnMapper {

	/**
	 * 당일작업단가 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 당일작업단가 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 리스트 조회
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;



	/**
	 * 당일작업단가 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 당일작업단가 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertDhtyJobList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 작업내용 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 작업내용 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertJobCnList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 수정
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int updateMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 시황분석 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertMrktAnlsList(HashMap<String,Object> spmtVO) throws Exception;

	/**
	 * 재고현황1 등록
	 *
	 * @param HashMap<String,Object>
	 * @return
	 * @throws Exception
	 */
	public int insertInvntrSttn1(HashMap<String,Object> spmtVO) throws Exception;


}
