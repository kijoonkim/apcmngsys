<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="box-header">
		<div class="ad_tbl_top">
			<div class="ad_tbl_toplist">
				<sbux-button id="btnInsertSimpleStng" name="btnInsertSimpleStng" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertApcVrtyList"></sbux-button>
				<sbux-button id="btnEndSimpleStng" name="btnEndSimpleStng" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('itemMngModal')"></sbux-button>
			</div>
		</div>
	</div>
   <div class="case_b">
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 1</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li class="wh_b">선별지시</li>
               <li class="wh_b">선별투입</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li class="wh_b">포장투입</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 2</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li class="wh_b">선별지시</li>
               <li class="wh_b">선별투입</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 3</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 4</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 5</p>
         <div class="in">
            <ul>
               <li class="blue1_b">계량</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="blue2_b">출하실적</li>
               <li>&nbsp;</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="" value="case1" >case 6</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li class="wh_b">선별투입</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li class="wh_b">포장투입</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 7</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li class="wh_b">선별투입</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 8</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li class="sk_b">포장실적</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 8</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li class="wh_b">포장지시</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="simpleCase" value="case1" >case 9</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li class="wh_b">선별지시</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="wh_b">출하지시</li>
               <li class="blue2_b">출하실적</li>
               <li class="wh_b">발주등록</li>
            </ul>
         </div>
      </div>
      <br>
      <div class="case_in">
         <p><input type="radio" name="" value="case1" >case 10</p>
         <div class="in">
            <ul>
               <li>&nbsp;</li>
               <li class="blue1_b">원물입고</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="blue2_b">선별실적</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li>&nbsp;</li>
               <li class="blue2_b">출하실적</li>
               <li>&nbsp;</li>
            </ul>
         </div>
      </div>
   </div>
</body>
</html>