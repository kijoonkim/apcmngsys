const path = require('path');
// const animate = require("tailwindcss-animate"); // v4에서는 이 플러그인 대신 CSS로 직접 정의

/** @type {import('tailwindcss').Config} */
module.exports = {
    // ✅ [수정] preflight: false 옵션을 삭제합니다.
    // 이 옵션이 @tailwind base; 지시어를 비활성화시켜
    // @layer base { ... } 와 충돌을 일으켰습니다.
    // corePlugins: {
    //     preflight: false,
    // },

    darkMode: ["class"],

    // ✅ v4는 이 파일을 content 스캔용으로만 사용합니다.
    content: [
        "./src/**/*.{js,ts,jsx,tsx}",
        path.resolve(__dirname, 'src/main/webapp/WEB-INF/view/**/*.jsp'),
        "./index.html"
    ],

    // ✅ 사용자님의 원본 설정 유지
    prefix: "",

    // ✅ v4에서는 theme과 plugins를 tailwind.css에서 직접 정의하므로
    //    이 파일은 비워둡니다. v3의 theme/plugins는 v4에서 무시됩니다.
    theme: {},
    plugins: [],
};

