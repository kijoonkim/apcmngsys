import path        from 'path';
import { fileURLToPath } from 'url';
import { dirname } from 'path';
import { CleanWebpackPlugin } from 'clean-webpack-plugin';
import webpack     from 'webpack';

const __filename = fileURLToPath(import.meta.url);
const __dirname  = dirname(__filename);

export default {
    mode: 'development',
    entry: {
        view:      './src/view/index.js',
        dashboard: './src/dashboard/index.js',
        sheet:     './src/sheet/index.js',
    },
    output: {
        filename: '[name].bundle.js',
        path:     path.resolve(__dirname, 'src/main/resources/static/js/out'),
        publicPath: '/js/out/',
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: { loader: 'babel-loader', options: { sourceType: 'unambiguous', presets: [['@babel/preset-env',{modules:'auto'}]] } },
            },
            {
                test: /\.css$/,
                use: ['style-loader','css-loader'],
            },
            {
                test: /\.(png|gif|jpe?g|woff2?|eot|ttf|svg)$/,
                type: 'asset/resource',
                generator: {
                    filename: '../css/fonts/[name][ext]'  // css/fonts 경로에 복사
                }
            }
        ],
    },
    resolve: {
        extensions: ['.js','.json','.css']
    },
    plugins: [
        new CleanWebpackPlugin(),
    ]
};
