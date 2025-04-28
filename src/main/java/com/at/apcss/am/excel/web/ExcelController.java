package com.at.apcss.am.excel.web;

import java.awt.Color;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.softbowl.poi.SBMerge;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.extensions.XSSFCellBorder.BorderSide;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ContainerFactory;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.yaml.snakeyaml.constructor.BaseConstructor;

import com.softbowl.poi.LZString;
import com.softbowl.poi.SBExcel;
import com.tmax.tibero.Debug;


@Controller
public class ExcelController extends BaseConstructor{

	public final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value= "/saveExcel.do", method = RequestMethod.POST)
	public void SBExcelSave(HttpServletRequest request, HttpServletResponse response) throws Exception{

		Debug.log("호출 ??? ");

		boolean bCompressMode = false;

		request.setCharacterEncoding("UTF-8");
		String strRequestData = request.getParameter("SBHE___SB_ExcelDownload_Data");
		String strCompressMode = request.getParameter("SBHE___SB_ExcelDownload_CompressMode");

	    /*arrAdditionalData 를 통해 그리드 데이터와 시트이름을 전달받음*/
	    String arrSheetData = request.getParameter("arrSheetData");		//엑셀파일 정보
	    String arrSheetName = request.getParameter("arrSheetName");		//그리드별 시트이름

	    String arrTitle = null;		//그리드별 그리드 타이틀
	    String arrUnit = null;		//그리드별 그리드 소타이틀

	    if(null!=request.getParameter("arrTitle")){
	    	arrTitle = request.getParameter("arrTitle");		//엑셀 내 그리드별 타이틀 (optional)
	    }
	    if(null!=request.getParameter("arrUnit")){
	    	arrUnit = request.getParameter("arrUnit");		//엑셀 내 그리드별 소타이틀 (optional)
	    }

		//구문추가
		if( strCompressMode != null){
			strCompressMode = URLDecoder.decode(strCompressMode, "UTF-8");
			bCompressMode = Boolean.parseBoolean(strCompressMode);
		}

		try {

			logger.debug("====================== 다중시트 엑셀 다운로드 시작 ======================");
			arrSheetData = URLDecoder.decode(arrSheetData, "UTF-8");		//엑셀파일 정보 - decoding
			arrSheetName = URLDecoder.decode(arrSheetName, "UTF-8");	//그리드별 시트이름 - decoding

			arrTitle = URLDecoder.decode(arrTitle, "UTF-8");//그리드별 그리드 타이틀 - decoding
			arrUnit = URLDecoder.decode(arrUnit, "UTF-8");//그리드별 그리드 소타이틀 - decoding

			strRequestData = URLDecoder.decode(strRequestData, "UTF-8");

	        // 넘어온 string 파라메터를 분리한다.
	        int bufferSize = 600;  // buffer size 설정

	        //확인필요
	        String strRequestDataAfter = strRequestData.substring(strRequestData.indexOf("rowmemorysize"));	//그리드 행의 정보만 추출
	        strRequestData = strRequestData.substring(0,strRequestData.length()-1);
	        strRequestData = strRequestData.substring(0, strRequestData.indexOf("rowmemorysize")-1);
	        strRequestData +=  "\"rowmemorysize\":" + bufferSize + strRequestDataAfter.substring(strRequestDataAfter.indexOf(","));

			// 다중시트 엑셀 다운로드에서는 bCompressMode를 사용하실 수 없습니다.
			if(bCompressMode){
				strRequestData = LZString.decompressFromEncodedURIComponent(strRequestData);
			}

			ContainerFactory containerFactory = new ContainerFactory(){
				public List<HashMap<String, Object>> creatArrayContainer() {
					return new ArrayList<HashMap<String, Object>>();
				}
				public Map<String, Object> createObjectContainer() {
					return new HashMap<String, Object>();
				}
			};

			JSONParser JSONdataParser = new JSONParser();

			//arrSheetData: 그리드 전체 메타데이터
			//arrSheetName: 엑셀파일 하단 시트 제목
	        ArrayList<HashMap<String, Object>> arrListSheetData = (ArrayList<HashMap<String, Object>>)(JSONdataParser.parse(arrSheetData, containerFactory));
	        ArrayList<String> arrListSheetName = (ArrayList<String>)(JSONdataParser.parse(arrSheetName, containerFactory));

	        //arrListTitle: 각 시트별 그리드 제목 (optional)
	        //arrListUnit: 각 시트별 그리드 소제목 (optional)
	        ArrayList<String> arrListTitle = null;
	        ArrayList<String> arrListUnit = null;
	        if(null!=arrTitle){
	        	arrListTitle = (ArrayList<String>)(JSONdataParser.parse(arrTitle, containerFactory));
	        }
	        if(null!=arrUnit){
	        	arrListUnit = (ArrayList<String>)(JSONdataParser.parse(arrUnit, containerFactory));
	        }

			/*각 시트 별 그리드 메타데이터 엑셀에 적용*/
	        HashMap<String, Object> sheetData = null;

			SBExcel excel = new SBExcel();

			//그리드 기본스타일 지정부분
			float[] hsbHeader = new float[3];
	        float[] hsbHeaderBG = new float[3];
	        float[] hsbBorder = new float[3];
	        float[] hsbBlack = new float[3];
			Color.RGBtoHSB( 76,   99, 163, hsbHeader);
			Color.RGBtoHSB(244, 249, 253, hsbHeaderBG);
			Color.RGBtoHSB(201, 209, 233, hsbBorder);
			Color.RGBtoHSB(   0,     0,    0, hsbBlack);
			XSSFColor cHeader = new XSSFColor(Color.getHSBColor(hsbHeader[0], hsbHeader[1], hsbHeader[2]));
			XSSFColor cHeaderBG  = new XSSFColor(Color.getHSBColor(hsbHeaderBG[0], hsbHeaderBG[1], hsbHeaderBG[2]));
			XSSFColor cBorder = new XSSFColor(Color.getHSBColor(hsbBorder[0], hsbBorder[1], hsbBorder[2]));



			// 첫번째 그리드의 데이터 (datagrid1)
			//=====================================================================================================================
	        sheetData = (HashMap<String, Object>)(JSONdataParser.parse(strRequestData, containerFactory));
	        sheetData.put("rowmemorysize",bufferSize);

	        Iterator<String> iterator = sheetData.keySet().iterator();
	        while (iterator.hasNext()) {
	            String key = (String) iterator.next();

	            logger.debug("===key=== {} ", key);
	            logger.debug("===value=== {} ", sheetData.get(key));
	            logger.debug("===객체형=== {} ", sheetData.get(key).getClass());

	        }

			excel.init(sheetData);

			SXSSFWorkbook workbook = excel.save();

			//ex) arrListSheetName = ["grid1","grid2","grid3","grid4","grid5"]
			//0번째 그리드의 시트이름을 지정
			workbook.setSheetName(0, arrListSheetName.get(0));

			String fontName = "";
			Sheet sheet0 = workbook.getSheetAt(0);
			sheet0.setColumnWidth(1, 256*20);
	         int frn0 = sheet0.getFirstRowNum();		//첫번째 그리드 행 인덱스
	         int lrn0 = sheet0.getLastRowNum();		//마지막 그리드 행 인덱스
	         int fcn0 = sheet0.getRow(lrn0).getFirstCellNum();
	         int lcn0 = sheet0.getRow(lrn0).getLastCellNum();

	         logger.debug("===getFirstRowNum === {} ", frn0);
	         logger.debug("===getLastRowNum === {} ", lrn0);
	         logger.debug("===sheet0.getRow === {} ", sheet0.getRow(frn0));
	         logger.debug("===sheet0.getRow === {} ", sheet0.getRow(lrn0));

	         if(sheet0.getRow(frn0)!=null){
				XSSFCellStyle r1CellStyle0 = (XSSFCellStyle) sheet0.getRow(frn0).getCell(fcn0).getCellStyle();
				r1CellStyle0.setBorderTop(BorderStyle.NONE);
				r1CellStyle0.setBorderLeft(BorderStyle.NONE);
				r1CellStyle0.setBorderRight(BorderStyle.NONE);
				r1CellStyle0.setBorderBottom(BorderStyle.NONE);
				sheet0.getRow(frn0).getCell(fcn0).setCellStyle(r1CellStyle0);
	         }else{
	        	 logger.debug("===sheet0.getRow(frn0){} is null ", sheet0.getRow(frn0));
	         };
	         if(sheet0.getRow(frn0+1)!=null){
				XSSFCellStyle r2CellStyle0 = (XSSFCellStyle) sheet0.getRow(frn0+1).getCell(fcn0).getCellStyle();
				r2CellStyle0.setBorderTop(BorderStyle.NONE);
				r2CellStyle0.setBorderLeft(BorderStyle.NONE);
				r2CellStyle0.setBorderRight(BorderStyle.NONE);
				r2CellStyle0.setBorderBottom(BorderStyle.NONE);
				fontName = r2CellStyle0.getFont().getFontName();
				sheet0.getRow(frn0+1).getCell(fcn0).setCellStyle(r2CellStyle0);
	         }else{
	        	 logger.debug("===sheet0.getRow(frn0){} is null ", sheet0.getRow(frn0));
	         }
	         XSSFCellStyle cellStyleHD0 = null;
	         if(lrn0>=2) {
	         	for(int j=fcn0;j<lcn0;j++){
	         		if(sheet0.getRow(frn0+2)!=null){
						cellStyleHD0 = (XSSFCellStyle) sheet0.getRow(frn0+2).getCell(j).getCellStyle();
						cellStyleHD0.setFillBackgroundColor(cHeaderBG);
						cellStyleHD0.setAlignment(HorizontalAlignment.CENTER);
						cellStyleHD0.setVerticalAlignment(VerticalAlignment.CENTER);
						cellStyleHD0.setBorderColor(BorderSide.TOP, cHeader);
						cellStyleHD0.setBorderColor(BorderSide.LEFT, cHeader);
						cellStyleHD0.setBorderColor(BorderSide.RIGHT, cHeader);
						cellStyleHD0.setBorderColor(BorderSide.BOTTOM, cHeader);
						sheet0.getRow(frn0+2).getCell(j).setCellStyle(cellStyleHD0);
	         		}else{
	         			logger.debug("===sheet0.getRow(frn0+2) {} is null ", sheet0.getRow(frn0+2));
	         		}
	         	}
	         };

	         if(lrn0>2) {
	         	for(int k=(frn0+3);k<=lrn0;k++){
	         		if(sheet0.getRow(k)==null){

	         			logger.debug("===sheet0.getRow === {}  is null ", k);
	         			continue;
	         		}
	            	Iterator<Cell> itrc0 = sheet0.getRow(k).cellIterator();
	            	int j=0;
	            	XSSFCellStyle cellStyleData0 = null;

	            	while(itrc0.hasNext()){
	            		Cell cell0 = itrc0.next();
		        		if(j==0&&cellStyleHD0!=null){
		        			cellStyleHD0.setFillBackgroundColor(cHeaderBG);
							cellStyleHD0.setBorderColor(BorderSide.TOP, cHeader);
							cellStyleHD0.setBorderColor(BorderSide.LEFT, cHeader);
							cellStyleHD0.setBorderColor(BorderSide.RIGHT, cHeader);
							cellStyleHD0.setBorderColor(BorderSide.BOTTOM, cHeader);
							cell0.setCellStyle(cellStyleHD0);
		        		}else if(j==1){
		        			XSSFCellStyle cellStyleEntData0 = (XSSFCellStyle) cell0.getCellStyle();
		        			cellStyleEntData0.setFillBackgroundColor(cHeaderBG);
		        			cellStyleEntData0.setBorderColor(BorderSide.TOP, cHeader);
		        			cellStyleEntData0.setBorderColor(BorderSide.LEFT, cHeader);
		        			cellStyleEntData0.setBorderColor(BorderSide.RIGHT, cHeader);
		        			cellStyleEntData0.setBorderColor(BorderSide.BOTTOM, cHeader);
		        			cell0.setCellStyle(cellStyleEntData0);
		        		}else if(j==2){
		        			cellStyleData0 = (XSSFCellStyle) cell0.getCellStyle();
		        			cellStyleData0.setFillBackgroundColor(cHeaderBG);
		        			cellStyleData0.setBorderColor(BorderSide.TOP, cHeader);
		        			cellStyleData0.setBorderColor(BorderSide.LEFT, cHeader);
		        			cellStyleData0.setBorderColor(BorderSide.RIGHT, cHeader);
		        			cellStyleData0.setBorderColor(BorderSide.BOTTOM, cHeader);
		        		}
		        		if(j>1&&cell0.getCellType()==1 && cellStyleData0 != null){
		        			cellStyleData0.setDataFormat(workbook.createDataFormat().getFormat("#,##0"));
		        			Double temp0 = Double.parseDouble(cell0.getStringCellValue());
		        			cell0.setCellStyle(cellStyleData0);
		        			cell0.setCellType(0);
		        			cell0.setCellValue(temp0);
		        		}
		        		j++;
	            	}
	         	}
	         	// 합계를 넣을 경우 예제 [시작]
	         	/*int cA = (int)'A'; // 셀은 A부터 시작함 이렇게는 Z까지만 가능함
	         	Row newRow0 = sheet0.createRow(lrn0+1);
	         	for(int n=fcn0; n<lcn0; n++){
	         		XSSFCellStyle cellStyleSum0 = (XSSFCellStyle) workbook.createCellStyle();
	         		XSSFFont fontSum0 = (XSSFFont) workbook.createFont();
	         		fontSum0.setBold(true);
	         		fontSum0.setFontName(fontName);
	         		cellStyleSum0.cloneStyleFrom(sheet0.getRow(lrn0).getCell(n).getCellStyle());
	         		newRow0.createCell(n);
	         		if(n==1){
	         			newRow0.getCell(n).setCellValue("합 계");
	         			cellStyleSum0.setFillForegroundColor(new XSSFColor(Color.WHITE));
	         		}
	         		if(n>1){
	         			newRow0.getCell(n).setCellType(2);
	         			newRow0.getCell(n).setCellFormula("SUM("+(char)(cA+n)+(frn0+4)+":"+(char)(cA+n)+(lrn0+1)+")");
	         			cellStyleSum0.setFillForegroundColor(new XSSFColor(Color.WHITE));
	         		}
	         		cellStyleSum0.setFont(fontSum0);
	         		newRow0.getCell(n).setCellStyle(cellStyleSum0);
	         	}*/
	         	// 합계를 넣을 경우 예제 [끝]

	       };  /** SBExcel 에서 row 개수 변경한 다음 이 부분을 풀어준다. **/

		//=====================================================================================================================

			String title = arrListTitle.get(0);
    	 	String unit = arrListUnit.get(0);

			// 첫번째 시트 이외의 추가 시트를 생성함
	        for(int i=0; i<arrListSheetData.size(); i++){

	        	 sheetData = arrListSheetData.get(i);

	        	 sheetData.put("rowmemorysize",bufferSize);
	        	 sheetData.put("bIsStyle",true);

	             excel.init(sheetData);

	             //sheet 추가생성
	             workbook = excel.save();

	             //0번째 그리드의 시트이름은 설정되어 있기 때문에, i+1을 통해 1번째 부터 sheetName을 설정함
	             workbook.setSheetName(i+1, arrListSheetName.get(i+1));

	             /** SBExcel 에서 row 개수 변경한 다음 이 부분을 풀어준다. **/

	             Sheet sheet = workbook.getSheetAt(i+1);
	             sheet.setColumnWidth(1, 256*20);
	             int frn = sheet.getFirstRowNum();
	             int lrn = sheet.getLastRowNum();
	             int fcn = sheet.getRow(lrn).getFirstCellNum();
	             int lcn = sheet.getRow(lrn).getLastCellNum();

	             // 첫번째 줄
	             if(sheet.getRow(frn)!=null){
		             if(title.equals(sheet.getRow(frn).getCell(fcn).getStringCellValue())){
		            	 sheet.getRow(frn).getCell(fcn).setCellValue(arrListTitle.get(i+1));
		             }
		             XSSFCellStyle r1CellStyle = (XSSFCellStyle) sheet.getRow(frn).getCell(fcn).getCellStyle();
		         	 r1CellStyle.setBorderTop(BorderStyle.NONE);
		         	 r1CellStyle.setBorderLeft(BorderStyle.NONE);
		         	 r1CellStyle.setBorderRight(BorderStyle.NONE);
		         	 r1CellStyle.setBorderBottom(BorderStyle.NONE);
		         	 sheet.getRow(frn).getCell(fcn).setCellStyle(r1CellStyle);
	             }else{

	            	 logger.debug("===sheet.getRow(frn) {}  is null ", sheet.getRow(frn));
	             }
         	 	 // 두번째 줄
	             if(sheet.getRow(frn+1)!=null){
		             if(unit.equals(sheet.getRow(frn+1).getCell(fcn).getStringCellValue())){
		            	 sheet.getRow(frn+1).getCell(fcn).setCellValue(arrListUnit.get(i+1));
		             }
		             XSSFCellStyle r2CellStyle = (XSSFCellStyle) sheet.getRow(frn+1).getCell(fcn).getCellStyle();
		             r2CellStyle.setBorderTop(BorderStyle.NONE);
		             r2CellStyle.setBorderLeft(BorderStyle.NONE);
		             r2CellStyle.setBorderRight(BorderStyle.NONE);
		             r2CellStyle.setBorderBottom(BorderStyle.NONE);
		             fontName = r2CellStyle.getFont().getFontName();
		             sheet.getRow(frn+1).getCell(fcn).setCellStyle(r2CellStyle);
	             }else{
	            	 logger.debug("===sheet.getRow(frn) {}  is null ", sheet.getRow(frn));
	             }
	             // 세번째 줄
	             XSSFCellStyle cellStyleHD = null;
	             if(lrn>=2){
	            	 if(sheet.getRow(frn+2)!=null){
		            	 for(int j=fcn;j<lcn;j++){
							cellStyleHD = (XSSFCellStyle) sheet.getRow(frn+2).getCell(j).getCellStyle();
							cellStyleHD.setFillBackgroundColor(cHeaderBG);
							cellStyleHD.setAlignment(HorizontalAlignment.CENTER);
							cellStyleHD.setVerticalAlignment(VerticalAlignment.CENTER);
							cellStyleHD.setBorderColor(BorderSide.TOP, cHeader);
							cellStyleHD.setBorderColor(BorderSide.LEFT, cHeader);
							cellStyleHD.setBorderColor(BorderSide.RIGHT, cHeader);
							cellStyleHD.setBorderColor(BorderSide.BOTTOM, cHeader);
							sheet.getRow(frn+2).getCell(j).setCellStyle(cellStyleHD);
		            	 }
	            	 }else{
	            		 logger.debug("===sheet.getRow(frn+2) is null ");
	            	 }
	             };
	             // 데이터
	             if(lrn>2){
	            	 for(int k=(frn+3);k<=lrn;k++){
	            		 if(sheet.getRow(k)==null){
	            			 logger.debug("===sheet0.getRow === {}  is null ", k);
	            			 continue;
	            		 }
	            		 Iterator<Cell> itrc = sheet.getRow(k).cellIterator();
	            		 int j=0;
	            		 XSSFCellStyle cellStyleData = null;
	            		 while(itrc.hasNext()){
	            			 Cell cell = itrc.next();
	            			 if(j==0&&cellStyleHD!=null){
	            				 cellStyleHD.setFillBackgroundColor(cHeaderBG);
	            				 cellStyleHD.setBorderColor(BorderSide.TOP, cHeader);
	            				 cellStyleHD.setBorderColor(BorderSide.LEFT, cHeader);
	            				 cellStyleHD.setBorderColor(BorderSide.RIGHT, cHeader);
	            				 cellStyleHD.setBorderColor(BorderSide.BOTTOM, cHeader);
	            				 cell.setCellStyle(cellStyleHD);
	            			 }else if(j==1){
	 	            			XSSFCellStyle cellStyleEntData = (XSSFCellStyle) cell.getCellStyle();
		            			cellStyleEntData.setFillBackgroundColor(cHeaderBG);
		            			cellStyleEntData.setBorderColor(BorderSide.TOP, cHeader);
		            			cellStyleEntData.setBorderColor(BorderSide.LEFT, cHeader);
		            			cellStyleEntData.setBorderColor(BorderSide.RIGHT, cHeader);
		            			cellStyleEntData.setBorderColor(BorderSide.BOTTOM, cHeader);
		            			cell.setCellStyle(cellStyleEntData);
	            			 }else if(j==2){
	 	            			cellStyleData = (XSSFCellStyle) cell.getCellStyle();
		            			cellStyleData.setFillBackgroundColor(cHeaderBG);
		            			cellStyleData.setBorderColor(BorderSide.TOP, cHeader);
		            			cellStyleData.setBorderColor(BorderSide.LEFT, cHeader);
		            			cellStyleData.setBorderColor(BorderSide.RIGHT, cHeader);
		            			cellStyleData.setBorderColor(BorderSide.BOTTOM, cHeader);
	            			 }

	 	            		if(j>1&&cell.getCellType()==1 && cellStyleData != null){
		            			cellStyleData.setDataFormat(workbook.createDataFormat().getFormat("#,##0"));

	            				Double temp = Double.parseDouble(cell.getStringCellValue());
		            			cell.setCellStyle(cellStyleData);
		            			cell.setCellType(0);
		            			cell.setCellValue(temp);
		            		}
		            		j++;
	            		 }
	            	 }
	            	 /*
	            	 // 엑셀 데이터 형식 참고
	            	 // CELL_TYPE_NUMERIC 값 0
	            	 // CELL_TYPE_STRING 값 1
	            	 // CELL_TYPE_FORMULA 값 2
	            	 // CELL_TYPE_BLANK 값 3
	            	 // CELL_TYPE_BOOLEAN 값 4
	            	 // CELL_TYPE_ERROR 값 5
	            	 // 합계를 넣을 경우 예제 [시작]
	            	 int cA = (int)'A'; // 셀은 A부터 시작함 이렇게는 Z까지만 가능함
	            	 Row newRow = sheet.createRow(lrn+1);
	            	 for(int n=fcn; n<lcn; n++){
	            		 XSSFCellStyle cellStyleSum = (XSSFCellStyle) workbook.createCellStyle();
	            		 XSSFFont fontSum = (XSSFFont) workbook.createFont();
	            		 fontSum.setBold(true);
	            		 fontSum.setFontName(fontName);
	            		 cellStyleSum.cloneStyleFrom(sheet.getRow(lrn).getCell(n).getCellStyle());
	            		 newRow.createCell(n);
	            		 if(n==1){
	            			 newRow.getCell(n).setCellValue("합 계");
	            			 cellStyleSum.setFillForegroundColor(new XSSFColor(Color.WHITE));
	            		 }
	            		 if(n>1){
	            			 newRow.getCell(n).setCellType(2);
	            			 newRow.getCell(n).setCellFormula("SUM("+(char)(cA+n)+(frn+4)+":"+(char)(cA+n)+(lrn+1)+")");
	            			 cellStyleSum.setFillForegroundColor(new XSSFColor(Color.WHITE));
	            		 }
	            		 cellStyleSum.setFont(fontSum);
	            		 newRow.getCell(n).setCellStyle(cellStyleSum);
	            	 }*/
	            	 // 합계를 넣을 경우 예제 [끝]
	             }
	              /** SBExcel 에서 row 개수 변경한 다음 이 부분을 풀어준다. **/
	        };
	       //============================================================================================

			String strFileName = excel.getFileName();
			String header = getBrowser(request);

			// ie MSIE : 10버전 이하, Trident : 11버전, else : 타 브라우저
			if(header.contains("MSIE") || header.contains("Trident") || header.contains("Chrome")) {
				strFileName = URLEncoder.encode(strFileName, "UTF-8").replace("\\+", "%20");
				response.setHeader("Content-Disposition", "attachment;filename=" + strFileName + ";");
			} else {
				response.setHeader("Content-Type", "application/vnd.ms-excel;charset=UTF-8");
				response.setHeader("Content-Disposition", "attachment;filename=" + strFileName + "");
			}

			workbook.write(response.getOutputStream());
			workbook.dispose();

			excel.clear();

		} catch (ParseException e) {
			//e.printStackTrace();
			logger.error(e.getMessage());
		} catch (UnsupportedEncodingException e) {
			//e.printStackTrace();
			logger.error(e.getMessage());
		} catch (IOException e){
			//e.printStackTrace();
			logger.error(e.getMessage());
		}
	};

	@RequestMapping(value= "/am/excel/saveMultiExcel", method = RequestMethod.POST)
	public void saveMultiExcel(HttpServletRequest request, HttpServletResponse response) throws Exception{

		boolean bCompressMode = false;

		request.setCharacterEncoding("UTF-8");
		String strRequestData = request.getParameter("SBHE___SB_ExcelDownload_Data");
		String strCompressMode = request.getParameter("SBHE___SB_ExcelDownload_CompressMode");

	    /*arrAdditionalData 를 통해 그리드 데이터와 시트이름을 전달받음*/
	    String arrSheetData = request.getParameter("arrSheetData");		//엑셀파일 정보
	    String arrSheetName = request.getParameter("arrSheetName");		//그리드별 시트이름

	    String arrTitle = null;		//그리드별 그리드 타이틀
	    String arrUnit = null;		//그리드별 그리드 소타이틀

	    if (request.getParameter("arrTitle") != null) {
	    	arrTitle = request.getParameter("arrTitle");		//엑셀 내 그리드별 타이틀 (optional)
	    }

	    if (request.getParameter("arrUnit") != null) {
	    	arrUnit = request.getParameter("arrUnit");		//엑셀 내 그리드별 소타이틀 (optional)
	    }

		//구문추가
		if(strCompressMode != null){
			strCompressMode = URLDecoder.decode(strCompressMode, "UTF-8");
			bCompressMode = Boolean.parseBoolean(strCompressMode);
		}

		try {

			logger.debug("====================== 다중시트 엑셀 다운로드 시작 ======================");

			arrSheetData = URLDecoder.decode(arrSheetData, "UTF-8");		//엑셀파일 정보 - decoding
			arrSheetName = URLDecoder.decode(arrSheetName, "UTF-8");	//그리드별 시트이름 - decoding

			arrTitle = URLDecoder.decode(arrTitle, "UTF-8");//그리드별 그리드 타이틀 - decoding
			arrUnit = URLDecoder.decode(arrUnit, "UTF-8");//그리드별 그리드 소타이틀 - decoding

			strRequestData = URLDecoder.decode(strRequestData, "UTF-8");

	        // 넘어온 string 파라메터를 분리한다.
	        int bufferSize = 600;  // buffer size 설정

	        //확인필요
	        String strRequestDataAfter = strRequestData.substring(strRequestData.indexOf("rowmemorysize"));	//그리드 행의 정보만 추출
	        strRequestData = strRequestData.substring(0,strRequestData.length()-1);
	        strRequestData = strRequestData.substring(0, strRequestData.indexOf("rowmemorysize")-1);
	        strRequestData +=  "\"rowmemorysize\":" + bufferSize + strRequestDataAfter.substring(strRequestDataAfter.indexOf(","));

			// 다중시트 엑셀 다운로드에서는 bCompressMode를 사용하실 수 없습니다.
			if(bCompressMode){
				strRequestData = LZString.decompressFromEncodedURIComponent(strRequestData);
			}

			ContainerFactory containerFactory = new ContainerFactory(){
				public List<HashMap<String, Object>> creatArrayContainer() {
					return new ArrayList<HashMap<String, Object>>();
				}
				public Map<String, Object> createObjectContainer() {
					return new HashMap<String, Object>();
				}
			};

			JSONParser JSONdataParser = new JSONParser();

			//arrSheetData: 그리드 전체 메타데이터
			//arrSheetName: 엑셀파일 하단 시트 제목
	        ArrayList<HashMap<String, Object>> arrListSheetData = (ArrayList<HashMap<String, Object>>)(JSONdataParser.parse(arrSheetData, containerFactory));
	        ArrayList<String> arrListSheetName = (ArrayList<String>)(JSONdataParser.parse(arrSheetName, containerFactory));

	        //arrListTitle: 각 시트별 그리드 제목 (optional)
	        //arrListUnit: 각 시트별 그리드 소제목 (optional)
	        ArrayList<String> arrListTitle = null;
	        ArrayList<String> arrListUnit = null;

	        if (arrTitle != null){
	        	arrListTitle = (ArrayList<String>)(JSONdataParser.parse(arrTitle, containerFactory));
	        }
	        if (arrUnit != null){
	        	arrListUnit = (ArrayList<String>)(JSONdataParser.parse(arrUnit, containerFactory));
	        }

			/*각 시트 별 그리드 메타데이터 엑셀에 적용*/
	        HashMap<String, Object> sheetData = null;

			SBExcel excel = new SBExcel();
			excel.setMergeDebugMode(true);
			excel.setDebugMode(true);
			//그리드 기본스타일 지정부분
			float[] hsbHeader = new float[3];
	        float[] hsbHeaderBG = new float[3];
	        float[] hsbBorder = new float[3];
	        float[] hsbBlack = new float[3];
			Color.RGBtoHSB(76, 99, 163, hsbHeader);
			Color.RGBtoHSB(244, 249, 253, hsbHeaderBG);
			Color.RGBtoHSB(201, 209, 233, hsbBorder);
			Color.RGBtoHSB(0, 0, 0, hsbBlack);
			XSSFColor cHeader = new XSSFColor(Color.getHSBColor(hsbHeader[0], hsbHeader[1], hsbHeader[2]));
			XSSFColor cHeaderBG  = new XSSFColor(Color.getHSBColor(hsbHeaderBG[0], hsbHeaderBG[1], hsbHeaderBG[2]));
			XSSFColor cBorder = new XSSFColor(Color.getHSBColor(hsbBorder[0], hsbBorder[1], hsbBorder[2]));

			// 첫번째 그리드의 데이터 (datagrid1)
			//=====================================================================================================================
	        sheetData = (HashMap<String, Object>)(JSONdataParser.parse(strRequestData, containerFactory));
	        sheetData.put("rowmemorysize", bufferSize);

	        /*
	        Iterator<String> iterator = sheetData.keySet().iterator();
	        while (iterator.hasNext()) {
	            String key = (String) iterator.next();
	            System.out.print("key="+key);
	            System.out.println(" value="+sheetData.get(key) + " 객체형 : " + sheetData.get(key).getClass());
	        }
	         */
			excel.init(sheetData);

			SXSSFWorkbook workbook = excel.save();

			excel.setDebugMode(false);
			excel.setMergeDebugMode(false);

			//ex) arrListSheetName = ["grid1","grid2","grid3","grid4","grid5"]
			//0번째 그리드의 시트이름을 지정
			workbook.setSheetName(0, arrListSheetName.get(0));

			logger.debug("===arrListSheetName.get(0) === {} ", arrListSheetName.get(0));

			String fontName = "";
			Sheet sheet0 = workbook.getSheetAt(0);
			sheet0.setColumnWidth(1, 256*20);
			int frn0 = sheet0.getFirstRowNum();		//첫번째 그리드 행 인덱스
	        int lrn0 = sheet0.getLastRowNum();		//마지막 그리드 행 인덱스
	        int fcn0 = sheet0.getRow(lrn0).getFirstCellNum();
	        int lcn0 = sheet0.getRow(lrn0).getLastCellNum();

	        if (sheet0.getRow(frn0) != null) {
				XSSFCellStyle r1CellStyle0 = (XSSFCellStyle) sheet0.getRow(frn0).getCell(fcn0).getCellStyle();
				//r1CellStyle0.setBorderTop(BorderStyle.NONE);
				//r1CellStyle0.setBorderLeft(BorderStyle.NONE);
				//r1CellStyle0.setBorderRight(BorderStyle.NONE);
				//r1CellStyle0.setBorderBottom(BorderStyle.NONE);
				sheet0.getRow(frn0).getCell(fcn0).setCellStyle(r1CellStyle0);
	        }

	        /*
	        if(sheet0.getRow(frn0+1) != null) {
				XSSFCellStyle r2CellStyle0 = (XSSFCellStyle) sheet0.getRow(frn0+1).getCell(fcn0).getCellStyle();
				r2CellStyle0.setBorderTop(BorderStyle.NONE);
				r2CellStyle0.setBorderLeft(BorderStyle.NONE);
				r2CellStyle0.setBorderRight(BorderStyle.NONE);
				r2CellStyle0.setBorderBottom(BorderStyle.NONE);
				fontName = r2CellStyle0.getFont().getFontName();
				sheet0.getRow(frn0+1).getCell(fcn0).setCellStyle(r2CellStyle0);
	        }
	        */

	        XSSFCellStyle cellStyleHD0 = null;
	        if ( lrn0 >= 2) {
	         	for( int j = fcn0; j < lcn0; j++ ) {
	         		if (sheet0.getRow(frn0+2) != null) {
						cellStyleHD0 = (XSSFCellStyle) sheet0.getRow(frn0+2).getCell(j).getCellStyle();
						cellStyleHD0.setFillBackgroundColor(cHeaderBG);
						cellStyleHD0.setAlignment(HorizontalAlignment.CENTER);
						cellStyleHD0.setVerticalAlignment(VerticalAlignment.CENTER);
						cellStyleHD0.setBorderColor(BorderSide.TOP, cHeader);
						cellStyleHD0.setBorderColor(BorderSide.LEFT, cHeader);
						cellStyleHD0.setBorderColor(BorderSide.RIGHT, cHeader);
						cellStyleHD0.setBorderColor(BorderSide.BOTTOM, cHeader);
						sheet0.getRow(frn0+2).getCell(j).setCellStyle(cellStyleHD0);
	         		}
	         	}
	        };

	        if (lrn0 > 2) {
	         	for ( int k = (frn0+3); k <= lrn0; k++ ) {
	         		if (sheet0.getRow(k) == null) {
	         			logger.debug("===sheet0.getRow(  {} ) is null ", k);
	         			continue;
	         		}
	            	Iterator<Cell> itrc0 = sheet0.getRow(k).cellIterator();
	            	int j = 0;
	            	XSSFCellStyle cellStyleData0 = null;
	            	while(itrc0.hasNext()){
	            		Cell cell0 = itrc0.next();
		        		if (j == 0 && cellStyleHD0 != null){
		        			cellStyleHD0.setFillBackgroundColor(cHeaderBG);
							cellStyleHD0.setBorderColor(BorderSide.TOP, cHeader);
							cellStyleHD0.setBorderColor(BorderSide.LEFT, cHeader);
							cellStyleHD0.setBorderColor(BorderSide.RIGHT, cHeader);
							cellStyleHD0.setBorderColor(BorderSide.BOTTOM, cHeader);
							cell0.setCellStyle(cellStyleHD0);
		        		} else if ( j == 1) {
		        			XSSFCellStyle cellStyleEntData0 = (XSSFCellStyle) cell0.getCellStyle();
		        			//cellStyleEntData0.setFillBackgroundColor(cHeaderBG);
		        			//cellStyleEntData0.setBorderColor(BorderSide.TOP, cHeader);
		        			//cellStyleEntData0.setBorderColor(BorderSide.LEFT, cHeader);
		        			//cellStyleEntData0.setBorderColor(BorderSide.RIGHT, cHeader);
		        			//cellStyleEntData0.setBorderColor(BorderSide.BOTTOM, cHeader);
		        			//cell0.setCellStyle(cellStyleEntData0);
		        		} else if ( j == 2) {
		        			cellStyleData0 = (XSSFCellStyle) cell0.getCellStyle();
		        			//cellStyleData0.setFillBackgroundColor(cHeaderBG);
		        			//cellStyleData0.setBorderColor(BorderSide.TOP, cHeader);
		        			//cellStyleData0.setBorderColor(BorderSide.LEFT, cHeader);
		        			//cellStyleData0.setBorderColor(BorderSide.RIGHT, cHeader);
		        			//cellStyleData0.setBorderColor(BorderSide.BOTTOM, cHeader);
		        		}

		        		if ( j > 1 && cell0.getCellType() == Cell.CELL_TYPE_NUMERIC && cellStyleData0 != null) {
		        			cellStyleData0.setDataFormat(workbook.createDataFormat().getFormat("#,##0"));
		        			cell0.setCellStyle(cellStyleData0);
		        		}

		        		j++;
	            	}
	         	}
	       };  /** SBExcel 에서 row 개수 변경한 다음 이 부분을 풀어준다. **/

	       //=====================================================================================================================



	       // 첫번째 시트 이외의 추가 시트를 생성함
	       for ( int i = 0; i < arrListSheetData.size(); i++ ) {
			   String title = arrListTitle.get(i);
			   String unit = arrListUnit.get(i);

			   List<Map<String, Object>> titles = new ArrayList<>();
			   Map<String, Object> titleMap = new HashMap<>();
			   titleMap.put("title", title);
			   titles.add(titleMap);

	    	   sheetData = arrListSheetData.get(i);
			   sheetData.put("titles", titles);
			   sheetData.put("rowmemorysize", bufferSize);
	    	   sheetData.put("bIsStyle", true);

			   excel.init(sheetData);

	    	   //sheet 추가생성
	    	   workbook = excel.save();

	    	   //0번째 그리드의 시트이름은 설정되어 있기 때문에, i+1을 통해 1번째 부터 sheetName을 설정함
	    	   workbook.setSheetName(i+1, arrListSheetName.get(i+1));

	    	   /** SBExcel 에서 row 개수 변경한 다음 이 부분을 풀어준다. **/
	    	   Sheet sheet = workbook.getSheetAt(i+1);
	    	   sheet.setColumnWidth(1, 256*20);
	    	   int frn = sheet.getFirstRowNum();
	    	   int lrn = sheet.getLastRowNum();
	    	   int fcn = sheet.getRow(lrn).getFirstCellNum();
	           int lcn = sheet.getRow(lrn).getLastCellNum();

	           // 첫번째 줄
	           if (sheet.getRow(frn)!= null) {
	        	   if ( title.equals(sheet.getRow(frn).getCell(fcn).getStringCellValue())) {
	        		   sheet.getRow(frn).getCell(fcn).setCellValue(arrListTitle.get(i+1));
	        	   }
		           XSSFCellStyle r1CellStyle = (XSSFCellStyle) sheet.getRow(frn).getCell(fcn).getCellStyle();
		           //r1CellStyle.setBorderTop(BorderStyle.NONE);
		           //r1CellStyle.setBorderLeft(BorderStyle.NONE);
		           //r1CellStyle.setBorderRight(BorderStyle.NONE);
		           //r1CellStyle.setBorderBottom(BorderStyle.NONE);
		           sheet.getRow(frn).getCell(fcn).setCellStyle(r1CellStyle);
	           }
	           // 두번째 줄
	           /*
	           if (sheet.getRow(frn+1) != null) {
	        	   if (unit.equals(sheet.getRow(frn+1).getCell(fcn).getStringCellValue())){
	        		   sheet.getRow(frn+1).getCell(fcn).setCellValue(arrListUnit.get(i+1));
	        	   }
	        	   XSSFCellStyle r2CellStyle = (XSSFCellStyle) sheet.getRow(frn+1).getCell(fcn).getCellStyle();
	        	   r2CellStyle.setBorderTop(BorderStyle.NONE);
	        	   r2CellStyle.setBorderLeft(BorderStyle.NONE);
	        	   r2CellStyle.setBorderRight(BorderStyle.NONE);
	        	   r2CellStyle.setBorderBottom(BorderStyle.NONE);
	        	   fontName = r2CellStyle.getFont().getFontName();
	        	   sheet.getRow(frn+1).getCell(fcn).setCellStyle(r2CellStyle);
	           }
	           */

	           // 세번째 줄
	           XSSFCellStyle cellStyleHD = null;
	           if (lrn >= 2) {
	        	   if (sheet.getRow(frn+2) != null) {
	        		   for ( int j = fcn; j < lcn; j++) {
	        			   cellStyleHD = (XSSFCellStyle) sheet.getRow(frn+2).getCell(j).getCellStyle();
	        			   cellStyleHD.setFillBackgroundColor(cHeaderBG);
	        			   cellStyleHD.setAlignment(HorizontalAlignment.CENTER);
	        			   cellStyleHD.setVerticalAlignment(VerticalAlignment.CENTER);
	        			   cellStyleHD.setBorderColor(BorderSide.TOP, cHeader);
	        			   cellStyleHD.setBorderColor(BorderSide.LEFT, cHeader);
	        			   cellStyleHD.setBorderColor(BorderSide.RIGHT, cHeader);
	        			   cellStyleHD.setBorderColor(BorderSide.BOTTOM, cHeader);
	        			   sheet.getRow(frn+2).getCell(j).setCellStyle(cellStyleHD);
	        		   }
	        	   }
	           };

	           // 데이터
	           if (lrn > 2) {
	        	   for( int k = (frn+3); k <= lrn; k++ ) {
	        		   if (sheet.getRow(k) == null) {
	        			   logger.debug("===sheet0.getRow(  {} ) is null ", k);
	        			   continue;
	        		   }
	        		   Iterator<Cell> itrc = sheet.getRow(k).cellIterator();
	        		   int j = 0;
	        		   XSSFCellStyle cellStyleData = null;
	        		   while (itrc.hasNext()) {
	        			   Cell cell = itrc.next();
	        			   if( j == 0 && cellStyleHD != null) {
	        				   cellStyleHD.setFillBackgroundColor(cHeaderBG);
	        				   cellStyleHD.setBorderColor(BorderSide.TOP, cHeader);
	        				   cellStyleHD.setBorderColor(BorderSide.LEFT, cHeader);
	        				   cellStyleHD.setBorderColor(BorderSide.RIGHT, cHeader);
	        				   cellStyleHD.setBorderColor(BorderSide.BOTTOM, cHeader);
	        				   cell.setCellStyle(cellStyleHD);
	        			   } else if (j == 1) {
	        				   XSSFCellStyle cellStyleEntData = (XSSFCellStyle) cell.getCellStyle();
	        				   cellStyleEntData.setFillBackgroundColor(cHeaderBG);
	        				   cellStyleEntData.setBorderColor(BorderSide.TOP, cHeader);
	        				   cellStyleEntData.setBorderColor(BorderSide.LEFT, cHeader);
	        				   cellStyleEntData.setBorderColor(BorderSide.RIGHT, cHeader);
	        				   cellStyleEntData.setBorderColor(BorderSide.BOTTOM, cHeader);
	        				   cell.setCellStyle(cellStyleEntData);
	        			   } else if (j == 2) {
	        				   cellStyleData = (XSSFCellStyle) cell.getCellStyle();
	        				   cellStyleData.setFillBackgroundColor(cHeaderBG);
	        				   cellStyleData.setBorderColor(BorderSide.TOP, cHeader);
	        				   cellStyleData.setBorderColor(BorderSide.LEFT, cHeader);
	        				   cellStyleData.setBorderColor(BorderSide.RIGHT, cHeader);
	        				   cellStyleData.setBorderColor(BorderSide.BOTTOM, cHeader);
	        			   }

	        			   if (j > 1 && cell.getCellType() == Cell.CELL_TYPE_NUMERIC && cellStyleData != null) {
	        				   cellStyleData.setDataFormat(workbook.createDataFormat().getFormat("#,###"));
	        			   }

	        			   j++;
	        		   }
	        	   }
	           }
	       };

	       //============================================================================================
	       String strFileName = excel.getFileName();
	       String header = getBrowser(request);

	       // ie MSIE : 10버전 이하, Trident : 11버전, else : 타 브라우저
	       if(header.contains("MSIE") || header.contains("Trident") || header.contains("Chrome")) {
	    	   strFileName = URLEncoder.encode(strFileName, "UTF-8").replace("\\+", "%20");
	    	   response.setHeader("Content-Disposition", "attachment;filename=" + strFileName + ";");
	       } else {
	    	   response.setHeader("Content-Type", "application/vnd.ms-excel;charset=UTF-8");
	    	   response.setHeader("Content-Disposition", "attachment;filename=" + strFileName + "");
	       }

	       workbook.write(response.getOutputStream());
	       workbook.dispose();

	       excel.clear();

		} catch (ParseException e) {
			//e.printStackTrace();
			logger.error(e.getMessage());
		} catch (UnsupportedEncodingException e) {
			//e.printStackTrace();
			logger.error(e.getMessage());
		} catch (IOException e){
			//e.printStackTrace();
			logger.error(e.getMessage());
		}
	};

	private String getBrowser(HttpServletRequest request){
		String header = request.getHeader("User-Agent");
		if(header.contains("MSIE")){
			return "MSIE";
		}else if(header.contains("Chrome")){
			return "Chrome";
		}else if(header.contains("Opeara")){
			return "Opera";
		}else if(header.contains("Firefox")){
			return "Firefox";
		}else if(header.contains("Safari")){
			return "Safari";
		}else{
			return "MSIE";
		}
	};

	@RequestMapping(value = "/am/excel/saveMultiGridExcel", method = RequestMethod.POST)
	public void saveMultiGridExcel(HttpServletRequest request, HttpServletResponse response) {
		try {
			String arrSheetData = URLDecoder.decode(request.getParameter("arrSheetData"), "UTF-8");
			String arrSheetName = URLDecoder.decode(request.getParameter("arrSheetName"), "UTF-8");
			String arrTitle = URLDecoder.decode(request.getParameter("arrTitle"), "UTF-8");
			String fileName = URLDecoder.decode(request.getParameter("fileName"), "UTF-8");
			if (fileName.startsWith("\"") && fileName.endsWith("\"")) {
				fileName = fileName.substring(1, fileName.length() - 1);
			}
			int bufferSize = 600;

			ContainerFactory containerFactory = new ContainerFactory() {
				public List<HashMap<String, Object>> creatArrayContainer() { return new ArrayList<>(); }
				public Map<String, Object> createObjectContainer() { return new LinkedHashMap<>(); }
			};

			JSONParser parser = new JSONParser();
			ArrayList<HashMap<String, Object>> arrListSheetData =
					(ArrayList<HashMap<String, Object>>) parser.parse(arrSheetData, containerFactory);
			ArrayList<String> arrListSheetName =
					(ArrayList<String>) parser.parse(arrSheetName, containerFactory);
			ArrayList<String> arrListTitle =
					(arrTitle != null) ? (ArrayList<String>) parser.parse(arrTitle, containerFactory) : new ArrayList<>();

			Map<String, List<Integer>> sheetGroups = new LinkedHashMap<>();
			for (int i = 0; i < arrListSheetName.size(); i++) {
				sheetGroups.computeIfAbsent(arrListSheetName.get(i), k -> new ArrayList<>()).add(i);
			}

			SXSSFWorkbook workbook = new SXSSFWorkbook();
			for (Map.Entry<String, List<Integer>> entry : sheetGroups.entrySet()) {
				String sheetName = entry.getKey();
				List<Integer> blockIndices = entry.getValue();
				Sheet targetSheet = workbook.createSheet(sheetName);

				int currentRow = 0;
				for (int index : blockIndices) {
					SBExcel excel = new SBExcel();
					HashMap<String, Object> sheetData = arrListSheetData.get(index);
					sheetData.put("rowmemorysize", bufferSize);
					excel.init(sheetData);

					SXSSFWorkbook blockWb = excel.save();
					Sheet blockSheet = blockWb.getSheetAt(0);

					String title = (arrListTitle != null && index < arrListTitle.size()) ? arrListTitle.get(index) : "";
					if (currentRow != 0) currentRow++; // blank line

					insertSheetBlock(targetSheet, blockSheet, currentRow, title, workbook);

					int frn = blockSheet.getFirstRowNum();
					int lrn = blockSheet.getLastRowNum();
					int fcn = blockSheet.getRow(frn).getFirstCellNum();
					int lcn = blockSheet.getRow(frn).getLastCellNum();

					int offset = currentRow + 1; // 타이틀 포함한 offset
					if(index < 3){
						System.out.println(offset + ":: offset");
						System.out.println(frn + ":: frn");
						System.out.println(lrn + ":: lrn");
						System.out.println(fcn + ":: fcn");
						System.out.println(lcn + ":: lcn");
					}
					applyDataCellStyles(targetSheet, offset, offset + (lrn - frn), fcn, lcn, workbook);

					currentRow = targetSheet.getLastRowNum() + 1;
				}
			}

			String header = getBrowser(request);
			if (header.contains("MSIE") || header.contains("Trident") || header.contains("Chrome")) {
//				fileName = URLEncoder.encode(fileName, "UTF-8").replace("+", "%20");
				response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
			} else {
				response.setHeader("Content-Type", "application/vnd.ms-excel;charset=UTF-8");
				response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			}

			System.out.println("엑셀 생성 완료, 응답 스트림에 쓰기 시작");
			workbook.write(response.getOutputStream());
			System.out.println("엑셀 파일 응답 완료");
			workbook.dispose();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void insertSheetBlock(Sheet target, Sheet source, int startRow, String title, Workbook workbook) {
		// 1. 타이틀 한 줄 삽입 및 병합 (0열 ~ 마지막 열까지)
		Row titleRow = target.createRow(startRow);
		Cell titleCell = titleRow.createCell(0);
		titleCell.setCellValue(title);

		// 타이틀 셀 병합 (source의 첫 번째 row 기준으로 마지막 column까지 병합)
		int lastCol = source.getRow(0).getLastCellNum() - 1;
		CellRangeAddress mergedTitle = new CellRangeAddress(startRow, startRow, 0, lastCol);
		target.addMergedRegion(mergedTitle);
		startRow++; // 실제 데이터는 다음 줄부터 시작

		// 2. source 시트의 행 복사
		for (int i = source.getFirstRowNum(); i <= source.getLastRowNum(); i++) {
			Row srcRow = source.getRow(i);
			if (srcRow == null) continue;

			Row tgtRow = target.createRow(startRow + i);
			for (short j = srcRow.getFirstCellNum(); j < srcRow.getLastCellNum(); j++) {
				Cell srcCell = srcRow.getCell(j);
				if (srcCell == null) continue;

				Cell tgtCell = tgtRow.createCell(j);
				// 값 복사
				switch (srcCell.getCellType()) {
					case Cell.CELL_TYPE_STRING:
						tgtCell.setCellValue(srcCell.getStringCellValue()); break;
					case Cell.CELL_TYPE_NUMERIC:
						tgtCell.setCellValue(srcCell.getNumericCellValue()); break;
					case Cell.CELL_TYPE_BOOLEAN:
						tgtCell.setCellValue(srcCell.getBooleanCellValue()); break;
					case Cell.CELL_TYPE_FORMULA:
						tgtCell.setCellFormula(srcCell.getCellFormula()); break;
				}
				// 스타일 복사 (기존 셀 스타일 직접 사용)
				tgtCell.setCellStyle(srcCell.getCellStyle());
			}
		}

		// 3. 병합 셀 복사
		for (int i = 0; i < source.getNumMergedRegions(); i++) {
			CellRangeAddress region = source.getMergedRegion(i);
			CellRangeAddress newRegion = new CellRangeAddress(
					region.getFirstRow() + startRow,
					region.getLastRow() + startRow,
					region.getFirstColumn(),
					region.getLastColumn()
			);
			target.addMergedRegion(newRegion);
		}
	}

	public void applyDataCellStyles(Sheet sheet, int frn, int lrn, int fcn, int lcn, SXSSFWorkbook workbook) {
		// 헤더 스타일만 별도로 지정
		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		headerStyle.setFillPattern(CellStyle.SOLID_FOREGROUND); // ← short 상수
		headerStyle.setAlignment(CellStyle.ALIGN_CENTER);       // ← short 상수
		headerStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		headerStyle.setBorderTop(CellStyle.BORDER_THIN);
		headerStyle.setBorderBottom(CellStyle.BORDER_THIN);
		headerStyle.setBorderLeft(CellStyle.BORDER_THIN);
		headerStyle.setBorderRight(CellStyle.BORDER_THIN);

		// 3번째 행만 헤더 스타일 덮어쓰기
		if (lrn >= frn + 2 && sheet.getRow(frn + 2) != null) {
			Row row = sheet.getRow(frn + 2);
			for (int j = fcn; j < lcn; j++) {
				Cell cell = row.getCell(j);
				if (cell != null) {
					cell.setCellStyle(headerStyle);
				}
			}
		}
	}
















}
