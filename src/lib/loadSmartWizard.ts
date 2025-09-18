// SmartWizard CSS는 번들에만 포함됨(이 페이지에서만 로드)
import 'smartwizard/dist/css/smart_wizard_all.min.css';
// 플러그인 JS 파일 URL(string)만 얻는다
import smartWizardUrl from 'smartwizard/dist/js/jquery.smartWizard.min.js?url';

let loaded = false;

export async function loadSmartWizard(): Promise<void> {
    const $: any = (window as any).jQuery || (window as any).$;
    if (!$) throw new Error('jQuery is not loaded (header must load jQuery first).');

    // 이미 붙어있으면 스킵
    if (typeof $.fn.smartWizard === 'function') {
        loaded = true;
        return;
    }
    if (loaded) return;

    // <script> 태그로 플러그인만 주입 (전역 jQuery에만 붙음)
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
    loaded = true;
}