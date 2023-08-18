package com.at.apcss.am.invntr.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.mapper.GdsInvntrMapper;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;

/**
 * @Class Name : GdsInvntrServiceImpl.java
 * @Description : 상품재고관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("gdsInvntrService")
public class GdsInvntrServiceImpl implements GdsInvntrService {


	@Autowired
	private GdsInvntrMapper gdsInvntrMapper;

	@Override
	public GdsInvntrVO selectGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		GdsInvntrVO resultVO = gdsInvntrMapper.selectGdsInvntr(gdsInvntrVO);

		return resultVO;
	}

	@Override
	public List<GdsInvntrVO> selectGdsInvntrList(GdsInvntrVO gdsInvntrVO) throws Exception {

		List<GdsInvntrVO> resultList = gdsInvntrMapper.selectGdsInvntrList(gdsInvntrVO);

		return resultList;
	}

	@Override
	public int insertGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		int insertedCnt = gdsInvntrMapper.insertGdsInvntr(gdsInvntrVO);

		return insertedCnt;
	}

	@Override
	public int updateGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		int updatedCnt = gdsInvntrMapper.updateGdsInvntr(gdsInvntrVO);

		return updatedCnt;
	}

	@Override
	public int deleteGdsInvntr(GdsInvntrVO gdsInvntrVO) throws Exception {

		int deletedCnt = gdsInvntrMapper.deleteGdsInvntr(gdsInvntrVO);

		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> insertGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) throws Exception {

		int insertedCnt;

		for ( GdsInvntrVO gdsInvntrVO : gdsInvntrList ) {

			insertedCnt = gdsInvntrMapper.insertGdsInvntr(gdsInvntrVO);

			if (insertedCnt != 0) {

			}
		}

		return null;
	}

}
