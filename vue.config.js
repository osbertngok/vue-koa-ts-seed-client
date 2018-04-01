const apiServerUrl = 'http://localhost:2333';

module.exports = {
  lintOnSave: false,
  configureWebpack: {
    output: {
      path: __dirname + "/dist"
    }
  },
    devServer: {
        proxy: {
            '/api': {
                target: apiServerUrl,
                pathRewrite: { '^/api': '/api' },
                changeOrigin: true
            }
        }
    }
}