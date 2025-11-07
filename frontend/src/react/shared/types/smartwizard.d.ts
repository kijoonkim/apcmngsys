// ① 모듈 존재 선언 (ESM import, side-effect import 모두 커버)
declare module 'smartwizard' {
  const SmartWizard: any;
  export default SmartWizard;
}

// (경로로 임포트할 가능성 대비: 선택)
declare module 'smartwizard/dist/js/jquery.smartWizard.min.js' {
  const SmartWizard: any;
  export default SmartWizard;
}

// ② jQuery 플러그인 시그니처 보강
declare global {
  interface SmartWizardToolbarOptions {
    showNextButton?: boolean;
    showPreviousButton?: boolean;
    position?: 'none' | 'top' | 'bottom' | 'both';
  }
  interface SmartWizardTransitionOptions {
    animation?: 'none' | 'fade' | 'slideHorizontal' | 'slideVertical' | 'slideSwing' | 'css';
    speed?: number | string;
  }
  interface SmartWizardAnchorOptions {
    enableDoneState?: boolean;
  }
  interface SmartWizardOptions {
    theme?: 'basic' | 'arrows' | 'dots' | 'circles';
    toolbar?: SmartWizardToolbarOptions;
    autoAdjustHeight?: boolean;
    transition?: SmartWizardTransitionOptions;
    anchor?: SmartWizardAnchorOptions;
  }

  interface JQuery {
    smartWizard(options?: SmartWizardOptions): JQuery;
    smartWizard(method: string, ...args: any[]): JQuery;
  }
}

export {};
