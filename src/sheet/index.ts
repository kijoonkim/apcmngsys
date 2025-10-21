// 헤더에서 로드된 전역 jQuery 사용
const $ = (window as any).jQuery;
if (!$) {
    throw new Error("jQuery is not loaded. Make sure header.jsp includes it before this bundle.");
}

// jQuery 플러그인 (전역 jQuery에 붙음)
import 'jquery-mousewheel';
import 'malihu-custom-scrollbar-plugin';

// Luckysheet 스타일
import 'luckysheet/dist/css/luckysheet.css';
import 'luckysheet/dist/plugins/css/pluginsCss.css';

// Luckysheet 플러그인 스크립트 (UMD 플러그인)
import 'luckysheet/dist/plugins/js/plugin.js';

// Luckysheet 본체
import luckysheet from 'luckysheet';
(window as any).luckysheet = luckysheet;

// LuckyExcel
import LuckyExcel from 'luckyexcel';
(window as any).LuckyExcel = LuckyExcel;

// XLSX-Populate (브라우저 번들 경로)
import XlsxPopulate from 'xlsx-populate/browser/xlsx-populate.js';
(window as any).XlsxPopulate = XlsxPopulate;

// SheetJS (스타일 지원 버전)
import * as XLSX from 'xlsx-js-style';
(window as any).XLSX = XLSX;

// FileSaver
import { saveAs } from 'file-saver';
(window as any).saveAs = saveAs;

// ExcelJS
import ExcelJS from 'exceljs';
(window as any).ExcelJS = ExcelJS;

// ⚠️ 실제 실행(초기화/마운트)은 JSP에서 수행.
// 이 엔트리는 라이브러리 로드 & 전역 노출(setup)만 담당.