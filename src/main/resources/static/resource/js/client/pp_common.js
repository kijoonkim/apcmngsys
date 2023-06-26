/* 클라이언트 ui 스크립트 */
/*var sessionUserId = '';

if(sesseionUserId == ""){
   //로그인 안했을때
	console.log("로그인x");
} else {
   //로그인 했을때
	console.log("로그인o");
}*/

// 헤더 메뉴 반응형
function responsiveStyle() {

	//gnb 메뉴용
	var windowWidth = $(window).outerWidth();

	// 더보기 버튼 추가
	$('.gnb_2depth > li').each(function(){
		var target = $(this);
		target.children('a').children('.gnb_more').hide();
		if ( target.find('.gnb_3depth').length ) {
			$('<span class="gnb_more">펼쳐보기</span>').appendTo( target.children('a') );
		}
	});

	if (windowWidth < 1025) {
		//console.log('모바일,태블릿');

		// 기본 설정
		$(window).off('scroll');
		$('body').removeClass('scrolly on');
		$('body').off('scrolly');
		$('.gnb_1depth').off();
		$('.gnb_1depth').removeClass('on');
		$('.gnb_2depth li').off();
		$('.gnb_2depth').removeAttr('style');
		$('.gnb_3depth').removeAttr('style');
		$(".btn_admin").prependTo($('.gnb_wrap'));
		$('.btn_menu').removeClass('on');
		$('.gnb_2depth').removeClass('on');
		$('.sitemap').removeClass('on');
		$('.sitemap > .inner').hide();
		//프로그램 더보기 버튼 위치 조정
		$(".mainprogram_wrapper .main_more").insertAfter(".mainprogram_wrapper .mainprogram_swiper");
	

		// gnb
		$('.btn_menu').on('click', function(e){
			e.stopImmediatePropagation();
			$('.gnb_1depth').removeClass('on');
			$('.gnb_2depth').slideUp();
			if( $(this).hasClass('on') ){
				$('body').removeClass('on');
				$(this).removeClass('on');
			} else {
				$('body').addClass('on');
				$(this).addClass('on');
			}
		});

		//2depth 아코디언메뉴
		$('.header_bottom .gnb_2depth').hide();
		$(".gnb_1depth > a").unbind("click");
		$('.gnb_1depth > a').click(function () {
			$('.gnb_1depth').removeClass("on");
			if ($(this).next().children().is(':hidden')) {
				$(this).parent().parent().find('.gnb_2depth').slideUp();
				$(this).next().slideDown();
				$(this).parent().addClass("on");
                $(".gnb_3depth").slideUp();
			} else {
				$(this).next().slideUp();
				$(this).parent().removeClass("on");
                $('.gnb_2depth > li').removeClass("on");
			}
		});
		
	} else {
		//console.log("PC");

		// 기본 설정
		$('body').removeClass('scrolly on');
		$(".btn_admin").insertAfter($(".user_info"));
		$('.gnb_1depth').removeClass('on');
		$('.gnb_2depth').removeAttr('style');
		$('.gnb_3depth').removeAttr('style');
		$('.sitemap').removeClass('on');
		$('.sitemap > .inner').hide();
		//프로그램 더보기 버튼 위치 조정
		$(".mainprogram_wrapper .main_more").insertAfter(".mainprogram_wrapper .right_box");

		//2depth 메뉴
		$(".gnb_1depth").on({
			'mouseenter focusin' : function(){
				$(this).addClass('on');
				$(this).find(".gnb_2depth").stop().slideDown('fast');
			},
			'mouseleave focusout' : function(){
				$(this).removeClass('on');
				$(this).find(".gnb_2depth").stop().slideUp('fast');
			}
		});
		
		// header 스크롤시
		$(window).on('scroll', function(){
			var scr = $(this).scrollTop();
			if ( scr > 0) {
				$('body').addClass('scrolly');
				//$('.btn_sitemapmenu').appendTo('.gnb_wrap');
			} else {
				$('body').removeClass('scrolly');
				//$('.btn_sitemapmenu').appendTo('.header_top');
			}
			return false;
		});

	}

}

var resizeTimer;
$( window ).on( 'resize', function() {
	clearTimeout(resizeTimer);
	resizeTimer = setTimeout(resizeEnd, 1000);
} );

function resizeEnd() {
	responsiveStyle();
}

//sitemap 
function siteMap(){
	$('.btn_sitemapmenu').on('click', function(e){
		e.stopImmediatePropagation();
		$('body').addClass('on');
		$(".sitemap").addClass('on');
		$(".sitemap > .inner").slideDown();
	});

	$('.btn_sitemap').on('click', function(e){
		e.stopImmediatePropagation();
		$('body').removeClass('on');
		$(".sitemap").removeClass('on');
		$(".sitemap > .inner").slideUp();
	});
}

// toggle class 'on'
function toggleOn(){
	$('.on_js').on('click',function(e){
		e.preventDefault();
		$(this).toggleClass('on');
	});
}

//페이지 상단 이동
function moveTop() {
	var windowWidth = $(window).outerWidth();
	$('.move_top').hide();
	$(window).scroll(function () {
		if ($(this).scrollTop() > 50) {
			$('.move_top').fadeIn();
		} else {
			$('.move_top').fadeOut();
		}
	});
	$('.move_top').click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 800);
		return false;
	});
}


// lnb 메뉴
function lnbMenu(){
	
	// // 서브 lnb 있을 경우 : 
	$(".lnb_list > ul").children('li').each(function(){
		var target = $(this);
		target.children('a').children('span').hide();
		if ( target.find('.lnb_depth2').length ) {
			$('<span>펼쳐보기</span>').appendTo( target.children('a') );
		} 
	});
	
	// // 마우스오버시 하위메뉴 show/hide :
	$(".lnb_list > ul").children('li').on({
		'mouseenter focus':function(){
			$(this).addClass('on');
			$(this).children('a').next().stop().slideDown(300);
		},
		'mouseleave blur':function(){
			$(this).removeClass('on');
			$(this).children('a').next().stop().slideUp(300);
		}
	})
	
}

// chatbot click
function chatbotClick() {
	var chatbot = $('.chatbot');
	var Content = $('.chat_content');

	chatbot.off();

	chatbot.on('click',function(){
		if(Content.hasClass('on')) {
			Content.removeClass('on');
		}else {
			Content.addClass('on');
		}
	});
}

// tab : '.tab_js' 안에 '.tab_list_js' 와 '.tab_cnt_js'로 구분지어 사용.
function tab(){
	$('.tab_js').each(function(){
		var tabs = $(this).children('.tab_list_js').children('li');
		var panels = $(this).children('.tab_cnt_js').children('div');
		var lastTab = tabs.filter('.on');
		var lastPanel = $(lastTab.children('a').attr('href'));
		panels.hide();
		lastPanel.show();
		tabs.on('click',function(e){
			e.preventDefault();
			var thisTab = $(this);
			var thisPanel = $(thisTab.children('a').attr('href'));
			lastTab.removeClass('on');
			thisTab.addClass('on');
			lastPanel.hide();
			thisPanel.show();
			lastTab = thisTab;
			lastPanel = thisPanel;
		});
	})
}

// tab 모양만
function tabSwitch(){
	$('.tab_switch_js').each(function(){
		var tab = $(this).children('li');

		tab.on('click',function(e){
			e.preventDefault();
			tab.removeClass('on');
			$(this).addClass('on');
		})
	})
}

// 클릭한 영역으로 이동
function gotoin() {
	$('.goto_js').each(function(){
		var gotoTit = $(this).find('a');

		gotoTit.on('click',function(e){
			e.preventDefault();
			gotoTit.removeClass('on');

			var target = $(this).attr('href');

			if (target.length) {
				$(this).addClass('on');
				$('html,body').animate({
					scrollTop: $(target).offset().top - 220
				}, 'slow');
			}
		})
	})
}

// accordion : '.accordion_js' 안에 '.acd_list_js' 와 '.acd_cnt_js'로 구분지어 사용.
function accordion(){
	$('.accordion_js').each(function(){
		var tabs = $(this).find('.acd_list_js');

		$(this).find('.acd_cnt_js').hide();

		// '.on'이 붙은 아이는 페이지 진입시 열어놓기
		tabs.filter('.on').next('.acd_cnt_js').show();

		tabs.on('click',function(e){
			e.preventDefault();

			var thisTab = $(this);
			var thisPanel = thisTab.next('.acd_cnt_js');
			var notThisTab = tabs.not(thisTab);
			var notThisPanel = notThisTab.next();

			if(notThisTab){
				notThisTab.removeClass('on');
				notThisPanel.slideUp(300);
			}

			thisTab.toggleClass('on');
			thisPanel.stop().slideToggle(300);
		});
	})
}

// 상세검색창
function searchDetails(){
	var windowWidth = $(window).outerWidth();
	
	if (windowWidth < 768) {
		// console.log('tablet,mobile');
		$('.search_box3 .btn_detail').each(function(){
			var wrapper = $(this).parents('.search_box3');
			$(this).appendTo(wrapper);
		});
		$('.search_box3 .btn_detail').on('click', function(){
			$(this).prev('.search_detail').slideToggle(300); 
		});
	}
	
	$('.search_box3 .btn_detail').on('click', function(){
		$(this).toggleClass('on');
		$(this).parent().next('.search_detail').slideToggle(300);
	});
}
// 상세검색창
function searchDetails2(){
	var windowWidth = $(window).outerWidth();
	
	if (windowWidth < 768) {
		// console.log('tablet,mobile');
		$('.search_box3.select .btn_detail').each(function(){
			var wrapper = $(this).parents('.search_box3');
			$(this).appendTo(wrapper);
		});
		$('.search_box3.select .btn_detail').on('click', function(){
			$(this).prev('.search_detail').slideToggle(300); 
		});
	}
	
	$('.search_box3.select .btn_detail').on('click', function(){
		$(this).toggleClass('on');
		$(this).parents('.grid_row_sm').next('.search_detail').slideToggle(300);
	});
}

// selectbox
function selectBox() {
	$('.select_form').each(function(){
		var label = $(this).children('label');
		var target = $(this).children('.select_custom');
		var targetName = target.children('option:selected').text();

		label.text(targetName);
		target.on('change',function(){
			var targetName = $(this).children('option:selected').text();
			label.text(targetName);
		});
	});
}

//swiper 메인 비교과
function swiperSlide1() {
	var swiper = new Swiper('.mainprogram_swiper .swiper-container', {
		slidesPerView: 4,
		spaceBetween: 30,
		/*loop: true,
		loopFillGroupWithBlank: true,*/
		navigation: {
			nextEl: '.mainprogram_swiper .swiper_next',
			prevEl: '.mainprogram_swiper .swiper_prev',
		},
		breakpoints: {
			1280: {
				spaceBetween: 20,
				slidesPerView: 3
			},
			1024: {
				spaceBetween: 20,
				slidesPerView: 3
			},
			768: {
				spaceBetween: 10,
				slidesPerView: 2
			},
			480: {
				spaceBetween: 10,
				slidesPerView: 1.1
			}
		}
	});
}

//메인 공지사항
//function mainNotice() {
//	var notice = $('.mainnotice_list');
//	var list = notice.children();
//	var wrap = notice.children().is('.fix_list');

//	if(wrap === true){
//		if(list.length < 5){
//			list.addClass('wd_p100');
//		}
//	}else {
//		if(list.length < 6){
//			list.addClass('wd_p100');
//		}
//	}
	
//}

// today - 주간 클릭
//function weekSwitch() {
//	$('.week_wrap').each(function(){
//		var tab = $(this).find('.week_list').children('li');

//		tab.on('click',function(e){
//			e.preventDefault();
//			tab.removeClass('on');
//			$(this).addClass('on');
//		})
//	})
//}

//실시간 인기 비교과 키워드 클릭
function hotKeyword() {
	var keyword = $('.keyword_box li');
	var pick = keyword.find('a');

	pick.on('click', function(){
		if($(this).parent('li').hasClass('on')){
			$(this).parent('li').removeClass('on');
		}else {
			keyword.removeClass('on');
			$(this).parent('li').addClass('on');
		}
	});
}

 // 관심 키워드 설정
 function keywordSelect() {
	var wrapper = $('#keywordSelect');

	// 기본 설정
	wrapper.find('.check_only input:checked').parents('tr').find('th, td').addClass('td_selected');

	// 클릭시
	wrapper.find('.check_only').on('change',function(){
		var target = $(this).find('input');
		var targetChecked = wrapper.find('.check_only input:checked');

		// 체크 표시
		if( target.is(':checked') ){
			target.prop('checked', true);
			$(this).parents('tr').find('th, td').addClass('td_selected');

		} else {
			target.prop('checked', false);
			$(this).parents('tr').find('th, td').removeClass('td_selected');
		}
	});
}

// selectbox 교수 상담 시간
function selectBoxCounsel(){
	var windowWidth = $(window).outerWidth();
	var target = $('.date_current');
	var optBox = target.find('.date_selectbox').find('a');

	if(windowWidth < 1025) {
		target.on('click',function(){
			$(this).find('.date_selectbox').stop().slideToggle(300);
		});
	}else {
		target.on({
			'mouseenter focus' : function(){
				$(this).find('.date_selectbox').stop().slideDown(300);
			},
			'mouseleave blur' : function(){
				$(this).find('.date_selectbox').stop().slideUp(300);
			}
		});
	}
	optBox.on('click',function(){
		var optSelected = $(this).text();
		$(this).parents('.date_selectbox').prev('strong').text(optSelected);
	});
}

// 체크박스 토글(row) : 검색창 셀렉트박스
function checkToggleRow(){
	// 클릭시 셀렉트 박스 보여졌다 사라지는 동작
	$('.show_checktxt').on('click',function(){
		$('.check_row_wrap').slideToggle(300);
	})

	var checkBox = $('.show_checktxt');
	var check = $('input:checkbox[name=check_row]');
	var checkAll = $('input:checkbox[name=checkall_row]');
	var checkAllSelected = $('input:checkbox[name=checkall_row]:checked');
	var checkTotalCnt = $('input:checkbox[name=check_row]').length;
	var checkTxt = $('.check_row_wrap').children('.check_row').children('input:checked').next().text();

	checkBox.text(checkTxt);

	// '전체'외 나머지 선택시
	check.on('change', function(){
		var checkSelected = $('input:checkbox[name=check_row]:checked');
		var checkAllSelected = $('input:checkbox[name=checkall_row]:checked');
		var showCheck = checkSelected.next().html();

		checkBox.text(showCheck);

		if(checkSelected.length == checkTotalCnt){
			check.prop('checked',false);
			checkAll.prop('checked',true);
			checkBox.text('전체');
		}else if(checkSelected.length >= 2){
			checkAllSelected.prop('checked',false);
			checkBox.text('다중선택');
		}else if(checkSelected.length >= 1){
			checkAllSelected.prop('checked',false);
			checkBox.text(showCheck);
		}else{
			checkAll.prop('checked',true);
			checkBox.text('전체');
		}
	});

	// '전체' 선택시
	checkAll.on('change', function(){
		checkAll.prop('checked',true);
		checkBox.text('전체');
		check.prop('checked',false);
	});
}

//체크박스 토글(col) : 체크박스 버튼
function checkToggleCol(){
	$('.check_col_wrapper').each(function(){
		var checkAll = $(this).find('input[name="checkall_col"]');
		var check = $(this).find('input[name="check_col"]');
		var checkTotalCnt = check.length;

		checkAll.on('change',function(){
			check.prop('checked',false);
			$(this).prop('checked',true);
		})

		check.on('change',function(){
			var checkSelected =  check.filter(':checked');

			checkAll.prop('checked',false);
			//$(this).prop('checked',true);

			if(checkSelected.length >= checkTotalCnt){
				checkAll.prop('checked',true);
				check.prop('checked',false);
			}

			if(checkSelected.length == 0){ 
				checkAll.prop('checked',true); 
			   } 
			
		})
	})
}

//라디오 토글
function radioToggle() {
	$(".radio_toggle>input[type='radio']").click(function () {
		var previousRadio = $(this).data('storedRadio');
		if (previousRadio) {
			$(this).prop('checked', !previousRadio);
			$(this).data('storedRadio', !previousRadio);
		} else {
			$(this).data('storedRadio', true);
			$(".radio_toggle>input[type=radio]:not(:checked)").data("storedRadio", false);
		}
		if ($(this).is(":checked")){
			$(".radio_toggle").removeClass("on");
			$(this).parent().addClass("on");
		} else {
			$(this).parent().removeClass("on");
		}
	});
}



// 취업상담 - 방문상담/온라인상담 라디오 버튼
function radioBtn() {
	$(".radio_btn>input[type='radio']").click(function () {
		// 버튼 클릭시 상담사 박스 on/off
		$('.counselor_box').removeClass('on');
		$(this).parent('.radio_btn').parent('div').parent('.counselor_box').addClass('on');
	});
}

// checkbox button - 찜목록 버튼
function checkBtn(){
	$('.check_btn_wrap').each(function(){
		$(this).find('input[type="checkbox"]').change(function(){
			$(this).next().toggleClass('on');
		})
	})
}

// 클릭시 on/off 버튼 : 찜하기 버튼
function toggleBtn(){
	$('.btn_toggle').each(function(){
		$(this).on('click',function(){
			$(this).toggleClass('on');
		});
	});
}
/*
//찜하기 버튼
function btnLike() {
	$('.btn_addlike').on('click', function(){
		$(this).toggleClass('on');
	});
}*/

// 진단결과 선택하기
function resultCheck1() {
	// 기본 설정
	$('.box_checklist1 .testdo_checkbox.on .check_only input').prop("checked", true);

	// 클릭시
	$(".box_checklist1 .testdo_checkbox").on("click", function(){
		$(".box_checklist1 .testdo_checkbox").removeClass("on");
		$(".box_checklist1 .testdo_checkbox .check_only input").prop("checked", false);
		$(this).addClass("on");
		$(this).find('.check_only').children('input').prop("checked", true);
	});
}

// 역량도향상 선택하기 2개까지 선택 가능
function resultCheck2() {
	$(".box_checklist2 .testdo_checkbox").on("click", function(){
		if($(".box_checklist2 .testdo_checkbox.on").length >= 2){
			if($(this).hasClass("on")) {
				$(this).removeClass("on");
			} else {
				alert("2개이상 선택할 수 없습니다.");
			}
		} else {
			if($(this).hasClass("on")) {
				$(this).removeClass("on");
			} else {
				$(this).addClass("on");
			}
		}
	});
}

// 워크넷 진단 결과보기
function worknetResult() {
	$(".worknet_box").each(function() {
		var resultBtn = $(this).find(".btn_worknetresult");
		resultBtn.on("click", function(){
			$(this).toggleClass('on');
			$(this).parent().next().slideToggle();
		});
	});
}

//진로설계 : 기업
function targetSelectCorp() {
	$(".corp_radio input").change(function(){
		if($(this).parent().parent().hasClass("target_box")){
			var companyName = $(this).parent().prev().children().find("dt").text();
			companyName = companyName.trim();
			/*alert(companyName + "를 목표기업으로 설정합니다.");*/
			$(".target_box").removeClass("on");
			if($(".corp_radio input").is(":checked")){
				$(this).closest("div").addClass("on");
			}
		}
	});
}

// 진로설계 : 학과 (롤모델)
function targetSelectRole() {
	$(".role_radio input").change(function(){
		if($(this).parent().parent().hasClass("role_box")) {
			var RoleName = $(this).parent().prev().children("p").text();
			//alert(RoleName + "를 롤모델로 설정합니다.");
			$(".role_box").removeClass("on");
			if($(".role_radio input").is(":checked")){
				$(this).closest("div").addClass("on");
			}
		}
	});
}

//교과정보 추가
function addSubject() {
	$('.subject_addlist table').on('click', 'tr', function (e) {
		var el = e.target;
		if ( el.type !== "checkbox"){
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
				$(this).find(":checkbox").prop("checked", false);
			} else {
				$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
				$(this).find(":checkbox").prop("checked", true);
			}
		}
	});
}

//비교과 프로그램 카드
function nonSubjectHover() {
	$('.program_cardtype dt > a').on({
		'mouseenter focus':function(){
			$(this).parents('.program_cardtype').addClass('on');
		},
		'mouseleave blur':function(){
			$(this).parents('.program_cardtype').removeClass('on');
		}
	});

	// 비교과 이수 계획 추가
	$('.programcard_addlist .img_box').on('click', function(){
		$(this).parents('.programcard_addlist').toggleClass('selected');
	});
}

// 별점주기
function starlevel(){
	$('.starlevel_js').each(function(){
		var star = $(this).find('.star_level');
		var firstStar = star.eq(0);

		firstStar.on('click', function(){
			if ( $(this).hasClass('on') === false ) {
				/*console.log('별off');*/
				$(this).addClass('on');
			} else {
				if ( $(this).next().hasClass('on') === false ) {
					/*console.log('별on 이전별off');*/
					$(this).removeClass('on');
				} else {
					/*console.log('별on 이전별on');*/
					$(this).addClass('on');
					$(this).nextAll().removeClass('on');
				}
			}
		});

		star.not(firstStar).on('click', function(){
			$(this).addClass('on');
			$(this).prevAll().addClass('on');
			$(this).nextAll().removeClass('on');
		});
	});
}

// 글자수 표기
function letterCount(){
	$('#letter_count').keyup(function(){
		var content = $(this).val();
		$('#letter_counter').html(content.length + '/100');
	});
	$('#letter_count').keyup();
}

// 테이블 스크롤 커스텀
function tableScroll() {
	// 모바일 기기 접속 여부 체크 후 PC일때만 스크롤 mCustomScrollbar 실행
	var filter = "win16|win32|win64|mac|macintel";
	if (navigator.platform) {
		if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
			//alert('모바일');
			//테이블 스크롤  커스터마이징 해제
			$(".scrollx_tbl_xxl, .scrollx_tbl_xl, .scrollx_tbl_lg, .scrollx_tbl_md, .scrollx_tbl_sm, .scrollx_tbl_xs").mCustomScrollbar("destroy");
		} else {
			//alert('PC');
			//테이블 스크롤  커스터마이징
			$(".scrollx_tbl_xxl, .scrollx_tbl_xl, .scrollx_tbl_lg, .scrollx_tbl_md, .scrollx_tbl_sm, .scrollx_tbl_xs").mCustomScrollbar({
				axis: "x",
				theme: "dark",
				advanced: {
					autoExpandHorizontalScroll: true,
					updateOnContentResize: true
				}
			});
		}
	}
}

//가족추가
function familyList() {
	$(".family_list dl").each(function() {
		$(this).find("dt").unbind("click");
		$(this).find("dt").on("click", function() {
			if ($(this).hasClass('on')) {
				$(this).removeClass('on');
				$(this).next('dd').slideUp();
			} else {
				$(this).addClass('on');
				$('.faqlist dt').not($(this)).removeClass('on');
				$(this).next('dd').slideDown();
			}
		});
	});
}

// 어학, 자격증 그래프 보여주기
function viewActivepoint() {
	$(".active_footer .btn_pointview").on("click", function() {
		var showGraphbox = $(this).parent().parent().next(".graph_wrap");
		$(showGraphbox).show('fast');
	});
	$(".active_wrap .graph_wrap .btn_del").on("click", function() {
		var hideGraphbox = $(this).parent(".graph_wrap");
		$(hideGraphbox).hide('fast');
	});
}

// 포트폴리오 분석결과 높이 같게 조절
function equalHeight() {
	var windowWidth = $(window).outerWidth();
	var box = $('.portfolio_wrap').find('.test_outcome').find('.testoutcome_sheet');
	var heightArray = box.map(function(){
		return $(this).height();
	}).get();
	var maxHeight = Math.max.apply( Math, heightArray );

	if ( windowWidth > 768 ) {
		// only pc
		box.height(maxHeight);
	}
}

// 페이징버튼 클릭시 페이지 상단부분으로 이동
function up(){
	$('.up_js').each(function(){
		var windowWidth = $(window).outerWidth();

		if(windowWidth < 1025) {
			$('.testlist_move').click(function(e){
				e.preventDefault();
				$('body,html').animate({scrollTop: 150 }, 300);
			});
		}else {
			$('.testlist_move').click(function(e){
				e.preventDefault();
				$('body,html').animate({scrollTop: 200 }, 300);
			});
		}

	});
}

// 콘텐츠 내 별점 셀렉트
function starLevelSelect(){
	var wrapper = $('.starlevel_select');

	wrapper.on('click', function(){
		if ( $(this).children('ul').is(':visible') ) {
			$(this).children('ul').slideUp('fast');
		} else {
			$(this).children('ul').slideDown('fast');
		}
	});
	wrapper.children('ul').children('li').on('click', function(){
		var targetSrc = $(this).children('img').attr('src');
		var targetAlt = $(this).children('img').attr('alt');

		wrapper.children('p').children('img').attr({
			src : targetSrc,
			alt : targetAlt
		});
	});
}

// hashtag
function hashtag(){
	$('.hashtag_clickable a').on('click',function(e){
		e.preventDefault();

		$(this).parent().toggleClass('on');
	});
}

// 비교과 카드형/리스트형 변환
function nonsubjectTypeChange(){
	var wrapper = $('.btntab_js').parent();
	wrapper.children('.btntab_js').on('click',function(){
		wrapper.children('.btntab_js').removeClass('on');
		$(this).addClass('on');
	});
}

// 교과목 이수체계도 조회
function departmentList(){
	// 기본 설정
	$('.department_list > li.on').find('.department_sublist').show();
	// 클릭시
	$('.department_list').children('li').children('a').on('click', function(){
		var target = $(this).next('.department_sublist');
		if( target.is(':visible') ){
			$(this).parent().removeClass('on');
			target.slideUp(200);
		} else {
			$(this).parent().addClass('on');
			target.slideDown(200);
		}
	});
}

// 유사선택과목 조회
function similarList() {
	$('.tab_depth').each(function(){
		var tabs = $(this).children('.depth_list').children('li');
		var panels = $(this).children('.depth_cnt_js').children('div');
		var lastTab = tabs.filter('.on');
		var lastPanel = $(lastTab.children('a').attr('href'));
		panels.hide();
		lastPanel.show();
		tabs.on('click',function(e){
			e.preventDefault();
			var thisTab = $(this);
			var thisPanel = $(thisTab.children('a').attr('href'));
			lastTab.removeClass('on');
			thisTab.addClass('on');
			lastPanel.hide();
			thisPanel.show();
			lastTab = thisTab;
			lastPanel = thisPanel;
		});
	})

	$('.depth_start').on('click', function(){
		$(this).siblings('.choice_txt').hide();
	});

	//$('.tab_depth').siblings('.choice_txt').hide();

	$('.depth_list1 > li').on('click', function(){
		if($('.depth_list3').is(':visible')){
			$('.choice_txt').hide();
		}else {
			$(this).parent().siblings('.choice_txt').hide();
			$('.tab_depth').siblings('.choice_txt').show();
		}
	});

	$('.depth_list2').on('click', function(){
		$(this).siblings('.choice_txt').hide();
	});

	$('.similar_wrapper').each(function(){
		var btn = $('.similar_wrapper').find('.btn_positive1');

		btn.on('click', function(){
			$('.tab_depth').hide();
			$('.similar_wrapper').find('a').addClass('guide');
			$('.depth_list3 li a').removeClass('guide');

			$('.depth_start li a').on('click', function(){
				$('.depth_start li a').removeClass('guide');

				$('.depth_list1 li a').on('click', function(){
					$('.depth_list1 li a').removeClass('guide');
	
					$('.depth_list2 li a').on('click', function(){
						$('.depth_list2 li a').removeClass('guide');
					});
				});
			});
		});

		
	});

}


// 브라우저 알림창
function browserAlert(){
	$(".browseralert_close").on("click", function() {
		$("#browseralert").slideUp();
	});
}

// IE 버전 체크 (UserAgent)
var ua = navigator.userAgent.toLowerCase();
// IE7엔 브라우저 엔진명인 Trident가 없고 IE11엔 MSIE란 문자열이 없으므로 두 가지 경우를 모두 체크.
if( ua.indexOf( 'msie' ) != -1 || ua.indexOf( 'trident' ) != -1 ) {
	var version = 11;
	ua = /msie ([0-9]{1,}[\.0-9]{0,})/.exec( ua );
	if( ua )
	{
		version = parseInt( ua[ 1 ] );
	}
	var classNames = '';
	// 기존 방식에 is-ie 라는 클래스 추가
	classNames += ' is-ie';
	// 기존 방식에 현재 버전 클래스 추가
	classNames += ' ie' + version;
	for( var i = version + 1; i <= 11; i++ ) {
		classNames +=  ' lt-ie' + i;
	}
	// html 태그에 클래스 추가
	document.getElementsByTagName( 'html' )[ 0 ].className += classNames;
}

$(document).ready(function () {

	// toggle class 'on' : sitemap
	toggleOn();

	// 페이징버튼 클릭시 페이지 상단부분으로 이동
	up();

	//gnb 메뉴 반응형 동작
	responsiveStyle();

	//페이지 상단으로 이동
	moveTop();

	// chatbot click
	chatbotClick();

	//sitemap 
	siteMap();

	//lnb 메뉴
	lnbMenu();

	//tab
	/*tabList();*/

	// tab 기본
	tab();

	// tab 모양만
	tabSwitch();

	// 클릭한 영역으로 이동
	gotoin();

	// accordion
	accordion();

	//  검색영역 - 상세검색 Toggle
	searchDetails();
	searchDetails2();

	//토글 체크박스 검색버튼
	/*checkToggle();*/

	//tab 연동
	/*tabgoto();*/

	// selectbox
	selectBox();

	//swiper 메인
	swiperSlide1();

	//메인 공지사항
 	//mainNotice();

	// today - 주간 클릭
	//weekSwitch();

	//실시간 인기 비교과 키워드 클릭
	hotKeyword();

	// 관심 키워드 설정
	keywordSelect();

	// selectbox 교수 상담 시간
	selectBoxCounsel();

	// 체크박스 토글(row) : 검색창 셀렉트박스
	checkToggleRow();

	//체크박스 토글(col) : 체크박스 버튼
	checkToggleCol();

	//라디오 토글
	radioToggle();

	// 취업상담 - 방문상담/온라인상담 라디오 버튼
	radioBtn();

	// checkbox button - 찜목록
	checkBtn();

	// 클릭시 on/off 버튼 : 찜하기 버튼
	toggleBtn();

	// 진단결과 선택하기
	resultCheck1();

	// 역량도향상 선택하기
	resultCheck2();

	// 워크넷 진단 결과보기
	worknetResult();

	//교과정보 추가
	addSubject();

	//비교과 프로그램 카드
	nonSubjectHover();

	// 별점주기
	starlevel();

	// 글자수 표기
	letterCount();

	//FAQ
	/*faqList();*/

	//가족추가
	familyList();

	//진로설계 : 기업
	targetSelectCorp(); 

	// 진로설계 : 학과 (롤모델)
	targetSelectRole();

	// 어학, 자격증 그래프 보여주기
	viewActivepoint();

	// 포트폴리오 분석결과 높이 같게 조절
	equalHeight();

	// 콘텐츠 내 별점 셀렉트
	starLevelSelect();

	// hashtag
	hashtag();

	// 비교과 카드형/리스트형 변환
	nonsubjectTypeChange();

	// 교과목 이수체계도 조회
	departmentList();

	// 유사선택과목 조회
	similarList();

	// 브라우저 알림창
	browserAlert();


	// select2 설정
	$(".sel_search_row select").select2({
		formatNoMatches: function() {
			return '결과가 없습니다.';
		}
	});

	// 이미지 라이트박스
	$('.openimg').magnificPopup({
		type: 'image',
		closeOnContentClick: false,
		closeBtnInside: false,
		callbacks: {
			resize: changeImgSize,
			imageLoadComplete: changeImgSize,
			change: changeImgSize
		}
	});

	function changeImgSize() {
		var img = this.content.find('img');
		img.css('max-height', '100%');
		img.css('height', 'auto');
		img.css('width', 'auto');
		img.css('max-width', '810px');
	}

});

$(window).on("load", function () {
	tableScroll();
});

// outline 설정 - 키보드로 접근시엔 아웃라인을 보여주고 마우스로 접근할때는 아웃라인을 없애줌
(function (d) {
	var style_element = d.createElement('STYLE'),
		dom_events = 'addEventListener' in d,
		add_event_listener = function (type, callback) {
			// Basic cross-browser event handling
			if (dom_events) {
				d.addEventListener(type, callback);
			} else {
				d.attachEvent('on' + type, callback);
			}
		},
		set_css = function (css_text) {
			// Handle setting of <style> element contents in IE8
			!!style_element.styleSheet ? style_element.styleSheet.cssText = css_text : style_element.innerHTML = css_text;
		};

	d.getElementsByTagName('HEAD')[0].appendChild(style_element);

	// Using mousedown instead of mouseover, so that previously focused elements don't lose focus ring on mouse move
	/*add_event_listener('mousedown', function () {
		set_css(':focus{outline:0}::-moz-focus-inner{border:0;}');
	});*/
	add_event_listener('keydown', function () {
		set_css(':focus{outline:dotted 1px #193296}::-moz-focus-inner{border:dotted 1px #193296;}');
	});
})(document);


