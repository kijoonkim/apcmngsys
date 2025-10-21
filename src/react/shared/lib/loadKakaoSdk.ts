let kakaoReady: Promise<typeof window.kakao> | null = null;

export function loadKakaoSdk(appKey: string) {
    if (kakaoReady) return kakaoReady;

    kakaoReady = new Promise((resolve, reject) => {
        // 이미 붙어있으면 바로 resolve
        if ((window as any).kakao?.maps) {
            resolve((window as any).kakao);
            return;
        }

        const s = document.createElement("script");
        s.src = `https://dapi.kakao.com/v2/maps/sdk.js?appkey=${appKey}&autoload=false&libraries=services`;
        s.async = true;
        s.onload = () => {
            (window as any).kakao.maps.load(() => {
                resolve((window as any).kakao);
            });
        };
        s.onerror = reject;
        document.head.appendChild(s);
    });

    return kakaoReady;
}