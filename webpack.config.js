import path from 'path';
import { fileURLToPath } from 'url';
import { dirname } from 'path';
import {CleanWebpackPlugin} from "clean-webpack-plugin";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

export default {
    mode: 'development',
    entry: {
        view: './src/view/index.js',
        dashboard: './src/dashboard/index.js',
    },
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'src/main/resources/static/js/out'),
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        sourceType: 'unambiguous',
                        presets: [['@babel/preset-env', { modules: 'auto' }]],
                    },
                },
            },
            {
                test: /\.css$/, // CSS 처리
                use: ['style-loader', 'css-loader'],
            },
        ],
    },
    resolve: {
        extensions: ['.js', '.json', '.css']
    },
    plugins:[
        new CleanWebpackPlugin(),
    ]
};
