/** @type {import('eslint').Linter.Config} */
module.exports = {
    root: true,
    parser: '@typescript-eslint/parser',
    parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
        ecmaFeatures: { jsx: true },
    },
    env: {
        browser: true,
        es2021: true,
    },
    plugins: ['react', 'react-hooks', '@typescript-eslint', 'import', 'prettier'],
    extends: [
        'eslint:recommended',
        'plugin:react/recommended',
        'plugin:react-hooks/recommended',
        'plugin:@typescript-eslint/recommended',
        'plugin:import/recommended',
        'plugin:import/typescript',
        'plugin:prettier/recommended', // ← Prettier랑 충돌나는 ESLint 룰 꺼줌 + prettier를 룰로 동작시킴
    ],
    settings: {
        react: { version: 'detect' },
        'import/resolver': {
            // ⬇ TypeScript 경로/paths 사용하도록
            typescript: {
                project: './tsconfig.json', // 또는 tsconfig.app.json 쓰면 그것도 지정
            },
        },
    },
    rules: {
        'prettier/prettier': 'warn', // 포맷 안 맞으면 경고 정도만
        'react/react-in-jsx-scope': 'off', // React 17+
        'no-unused-vars': 'off',
        '@typescript-eslint/no-unused-vars': ['warn'],
        'react/prop-types': 'off',
        'react/no-unescaped-entities': 'off',
    },
};