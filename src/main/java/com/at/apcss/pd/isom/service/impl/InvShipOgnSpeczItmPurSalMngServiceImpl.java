package com.at.apcss.pd.isom.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.pd.isom.mapper.InvShipOgnSpeczItmPurSalMngMapper;
import com.at.apcss.pd.isom.service.InvShipOgnSpeczItmPurSalMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;
import com.at.apcss.pd.isom.vo.ItemStbltYnVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("InvShipOgnSpeczItmPurSalMngService")
public class InvShipOgnSpeczItmPurSalMngServiceImpl extends BaseServiceImpl implements InvShipOgnSpeczItmPurSalMngService{

	@Autowired
	private InvShipOgnSpeczItmPurSalMngMapper InvShipOgnSpeczItmPurSalMngMapper;

	@Override
	public InvShipOgnSpeczItmPurSalMngVO selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {

		InvShipOgnSpeczItmPurSalMngVO resultVO = InvShipOgnSpeczItmPurSalMngMapper.selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);

		return resultVO;
	}

	@Override
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {

		List<InvShipOgnSpeczItmPurSalMngVO> resultList = InvShipOgnSpeczItmPurSalMngMapper.selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO);
		return resultList;
	}

	@Override
	public int insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {

		int insertedCnt = InvShipOgnSpeczItmPurSalMngMapper.insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);

		return insertedCnt;
	}

	@Override
	public int updateInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {

		int updatedCnt = 0;

		return updatedCnt;
	}
	@Override
	public int deleteInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO) throws Exception {
		return 0;
	}

	@Override
	public int multiSaveInvShipOgnSpeczItmPurSalMngList(List<InvShipOgnSpeczItmPurSalMngVO> InvShipOgnSpeczItmPurSalMngVOList) throws Exception {
		int savedCnt = 0;
		String yrVal = null;// 등록년도
		String brnoVal = null;//출자출하조직 사업자번호
		String uoBrnoVal = null;//통합조직 사업자번호
		for (InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO : InvShipOgnSpeczItmPurSalMngVOList) {
			yrVal = InvShipOgnSpeczItmPurSalMngVO.getYr();
			brnoVal = InvShipOgnSpeczItmPurSalMngVO.getBrno();
			uoBrnoVal = InvShipOgnSpeczItmPurSalMngVO.getUoBrno();
			if(ComConstants.ROW_STS_INSERT.equals(InvShipOgnSpeczItmPurSalMngVO.getRowSts())) {
				savedCnt += insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(InvShipOgnSpeczItmPurSalMngVO.getRowSts())) {
				savedCnt += updateInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO);
			}
		}
		int stbltYnUpdateCnt = 0;
		//전문품목 매입 매출 저장 완료 후 적합여부 체크
		if(yrVal != null && !yrVal.equals("")
			&& brnoVal != null && !brnoVal.equals("")
			&& uoBrnoVal != null && !uoBrnoVal.equals("")){
			List<ItemStbltYnVO> resultVoList = new ArrayList<>();
			ItemStbltYnVO ItemStbltYnVo = new ItemStbltYnVO();

			ItemStbltYnVo.setYr(yrVal);
			ItemStbltYnVo.setBrno(brnoVal);
			ItemStbltYnVo.setUoBrno(uoBrnoVal);
			resultVoList = selectItemStbltYnList(ItemStbltYnVo);

			//조회 결과가 있을 경우에만 업데이트
			if(resultVoList != null) {
				//적합여부 초기화
				InvShipOgnSpeczItmPurSalMngMapper.updateItemStbltYnInit(ItemStbltYnVo);
				for (ItemStbltYnVO resultVo : resultVoList) {
					stbltYnUpdateCnt += updateItemStbltYn(resultVo);
				}
			}
		}
		return savedCnt;
	}
	//품목별 적합여부 리스트
	@Override
	public List<ItemStbltYnVO> selectItemStbltYnList(ItemStbltYnVO ItemStbltYnVo) throws Exception {

		List<ItemStbltYnVO> resultList = InvShipOgnSpeczItmPurSalMngMapper.selectItemStbltYnList(ItemStbltYnVo);
		return resultList;
	}
	//적합여부 업데이트
	@Override
	public int updateItemStbltYn(ItemStbltYnVO ItemStbltYnVo) throws Exception {

		int insertedCnt = InvShipOgnSpeczItmPurSalMngMapper.updateItemStbltYn(ItemStbltYnVo);

		return insertedCnt;
	}

}
