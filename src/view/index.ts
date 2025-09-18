// ⬇️ 이 줄 삭제 (유틸을 파일 아래에 직접 정의할 거라 import 필요 없음)
// import { loadSmartWizard } from '../lib/loadSmartWizard';

import * as XLSX from 'xlsx';
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

// SmartWizard CSS (빌드시 별도 파일로 분리됨)
import 'smartwizard/dist/css/smart_wizard_all.min.css';
// 플러그인 JS URL만 받아서 <script>로 주입
import smartWizardUrl from 'smartwizard/dist/js/jquery.smartWizard.min.js?url';

declare global {
    interface Window {
        initSmartWizard?: (selector: string | HTMLElement | JQuery, options?: any) => Promise<JQuery>;
        onSmartWizard?: (selector: string | HTMLElement | JQuery, eventName: string, handler: (...args: any[]) => void) => Promise<void>;
        jQuery: any; $: any; Swal: typeof Swal; XLSX: typeof XLSX;
    }
}

const $: any = (window as any).jQuery || (window as any).$;
if (!$) throw new Error('jQuery is not loaded from header.');

window.Swal = Swal;
window.XLSX = XLSX;

function toJQ(sel: string | HTMLElement | JQuery): JQuery {
    if ((sel as any)?.jquery) return sel as JQuery;
    if (sel instanceof HTMLElement) return $(sel);
    return $(sel as string);
}

// ⬇️ 유틸을 이 파일 안에 “정의” (export 불필요)
let swLoaded = false;
async function loadSmartWizard(): Promise<void> {
    if (typeof $.fn.smartWizard === 'function') { swLoaded = true; return; }
    if (swLoaded) return;
    await new Promise<void>((resolve, reject) => {
        const s = document.createElement('script');
        s.src = smartWizardUrl;
        s.onload = () => resolve();
        s.onerror = (e) => reject(e);
        document.head.appendChild(s);
    });
    if (typeof $.fn.smartWizard !== 'function') {
        throw new Error('SmartWizard failed to attach to header jQuery.');
    }
    swLoaded = true;
}

async function initSmartWizard(selector: string | HTMLElement | JQuery, options: any = {}): Promise<JQuery> {
    await loadSmartWizard();
    const $el = toJQ(selector);
    if ($el.length === 0) throw new Error(`initSmartWizard: element not found: ${selector}`);

    const merged = {
        theme: 'arrows', // ← 너 원래 설정으로 복구
        toolbar: { showNextButton: false, showPreviousButton: false, position: 'none' },
        autoAdjustHeight: false,
        transition: { animation: 'slideHorizontal', speed: 400 },
        anchor: { enableDoneState: true },
        ...options,
    };

    $el.smartWizard(merged);
    return $el;
}

async function onSmartWizard(
    selector: string | HTMLElement | JQuery,
    eventName: string,
    handler: (...args: any[]) => void
): Promise<void> {
    await loadSmartWizard();
    toJQ(selector).on(eventName, handler);
}

(window as any).initSmartWizard = initSmartWizard;
(window as any).onSmartWizard   = onSmartWizard;