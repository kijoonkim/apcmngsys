package com.at.apcss.am.anls.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.anls.vo.AnlsCrtrVO;
import com.at.apcss.am.anls.vo.AnlsMngVO;

public interface AnlsCrtrService {

	
	/**
	 * 분석기준 단건 조회
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public AnlsCrtrVO selectAnlsCrtr(AnlsCrtrVO anlsCrtrVO) throws Exception;
	public AnlsCrtrVO selectAnlsCrtr(String apcCd, String anlsCrtrType, String crtrCd) throws Exception;
	
	/**
	 * 분석기준목록 조회
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AnlsCrtrVO> selectAnlsCrtrList(AnlsCrtrVO anlsCrtrVO) throws Exception;

	
	/**
	 * 분석기준상세 단건 조회
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public AnlsCrtrVO selectAnlsCrtrDtl(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준상세 목록 조회
	 * @param anlsCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<AnlsCrtrVO> selectAnlsCrtrDtlList(AnlsCrtrVO anlsCrtrVO) throws Exception;
	
	/**
	 * 분석기준 등록
	 * @param anlsMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertAnlsCrtr(AnlsMngVO anlsMngVO) throws Exception;
	
	/**
	 * 분석기준 삭제
	 * @param anlsMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteAnlsCrtr(AnlsMngVO anlsMngVO) throws Exception;
	
	/**
	 * 분석기준상세 등록
	 * @param anlsMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertAnlsCrtrDtl(AnlsMngVO anlsMngVO) throws Exception; 
	
	/**
	 * 분석기준상세 삭제
	 * @param anlsMngVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteAnlsCrtrDtl(AnlsMngVO anlsMngVO) throws Exception; 
}
