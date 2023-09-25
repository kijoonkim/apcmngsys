package com.at.apcss.am.trnsf.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.at.apcss.am.trnsf.mapper.TrnsfSortInvntrMapper;
import com.at.apcss.am.trnsf.service.TrnsfSortInvntrService;
import com.at.apcss.am.trnsf.vo.TrnsfSortInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : SortInvntrServiceImpl.java
 * @Description : 선별재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("trnsfSortInvntrService")
public class TrnsfSortInvntrServiceImpl extends BaseServiceImpl implements TrnsfSortInvntrService {

	@Autowired
	private TrnsfSortInvntrMapper trnsfSortInvntrMapper;

	@Override
	public List<TrnsfSortInvntrVO> selectTrnsfSortInvntrDsctnList(TrnsfSortInvntrVO trnsfSortInvntrVO) throws Exception {

		List<TrnsfSortInvntrVO> resultList = trnsfSortInvntrMapper.selectTrnsfSortInvntrDsctnList(trnsfSortInvntrVO);

		return resultList;
	}


	@Override
	public HashMap<String, Object> updateTrnsfSortInvntrDsctnList(List<TrnsfSortInvntrVO> trnsfSortInvntrList) throws Exception {
		List<TrnsfSortInvntrVO> updateList = new ArrayList<>();

		for (TrnsfSortInvntrVO trnsfSortInvntrVO : trnsfSortInvntrList) {
			TrnsfSortInvntrVO vo = new TrnsfSortInvntrVO();
			BeanUtils.copyProperties(trnsfSortInvntrVO, vo);

			if (ComConstants.ROW_STS_UPDATE.equals(trnsfSortInvntrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for (TrnsfSortInvntrVO trnsfSortInvntrVO : updateList) {
			trnsfSortInvntrMapper.updateTrnsfSortInvntrDsctnList(trnsfSortInvntrVO);
		}

		return null;
	}

}
