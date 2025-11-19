/**
 * TypeScript 전역 타입 선언
 * JSP 전역 변수와 jQuery 함수들을 위한 타입
 */

declare global {
  interface Window {
    // JSP 전역 변수들
    gv_selectedApcCd: string;
    gv_selectedApcNm: string;
    gv_selectedApcSeCd: string;

    // jQuery 전역 함수들 (기존 common.js)
    gfn_getApcVrty: (apcCd: string) => Promise<Array<{
      vrtyCd: string;
      itemCd: string;
      itemNm: string;
      vrtyNm: string;
    }>>;
    
    gfn_getApcItems: (apcCd: string) => Promise<Array<{
      itemCd: string;
      itemNm: string;
      apcCd: string;
    }>>;

    gfn_postJSON: (
      url: string,
      param?: any,
      sysPrgrmId?: string,
      hideProgress?: boolean
    ) => Promise<any>;

    // SBGrid 관련 (기존 프레임워크)
    SBUxMethod?: {
      openProgress: (options: any) => void;
      closeProgress: (options: any) => void;
      get: (id: string) => any;
      set: (id: string, value: any) => void;
      getCheckbox: (id: string) => Record<string, any>;
      closeModal: (modalId: string) => void;
    };

    // lodash
    _?: {
      isEqual: (a: any, b: any) => boolean;
      isEmpty: (value: any) => boolean;
      [key: string]: any;
    };
  }

  // jQuery 타입 (간단 버전)
  interface JQuery {
    css(property: string, value: string): JQuery;
    data(key: string): any;
    text(): string;
    html(): string;
    empty(): JQuery;
    append(content: string | Element): JQuery;
    off(event: string, selector?: string): JQuery;
    on(event: string, selector: string, handler: (e: Event) => void): JQuery;
    closest(selector: string): JQuery;
    find(selector: string): JQuery;
    filter(fn: () => boolean): JQuery;
    last(): JQuery;
    index(): number;
  }

  function $(selector: string | Element): JQuery;
  namespace $ {
    function ajax(settings: any): any;
  }
}

export {};
