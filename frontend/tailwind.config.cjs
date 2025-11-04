/** @type {import('tailwindcss').Config} */
const path = require('path');

module.exports = {
    content: [
        // ✅ React 컴포넌트들
        "./src/react/**/*.{js,ts,jsx,tsx}",

        // ✅ JSP 파일들 (절대 경로)
        path.resolve(__dirname, 'src/main/webapp/WEB-INF/view/**/*.jsp'),

        // ✅ 개발 서버용
        "./index.html"
    ],
    theme: {
        extend: {},
    },
    plugins: [],
};