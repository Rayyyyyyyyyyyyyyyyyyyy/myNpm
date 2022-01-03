# 打包 vue components 成 npm 套件

### npm 官網註冊帳號 ＆ 驗證信箱(若未驗證會無法上傳)

###### https://www.npmjs.com/


## create 一個新專案 

    vue create 專案名

1. 根目錄創建 docs, dist 資料夾

   :::info
   * dist：打包成 npm 所輸出的 js 檔
   * docs：打包給 github 展示 demo page
   :::
    

2. components 資料夾內創建 index.js
    :::info
     components 裡的 index.js 檔很重要，這裡是打包成 npm 的入口檔案，而 App.vue 和 main.js 都是 demo page 的元件
     :::
     
3. 新增 vue.config.js
     
     ```
     module.exports = {publicPath: './'}
     ```
    
4. components 資料夾內創建組件檔案
    
    
    ```
    //src/components/Test.vue
    
    <template>
        <p>TEstttttt</p>
    </template>

    <script>
    import {defineComponent} from "vue";

    export default defineComponent({
      name: "Test",

    })
    </script>

    <style scoped>

    </style>
    ```
5. 撰寫 install 安裝檔

    ```
    // src/components/index.js
    
    import Test from "./Test.vue"
    
    Test.install = function(Vue) {
        Vue.component("vue-Test", Test)
    }

    export default Test
    ```
    :::info
    在 components 的 index.js 檔撰寫一個 install 方法供 Vue.use() 使用， Vue.use() 是個全局呼叫的方法，當 Vue.use() 執行時，會呼叫 install 這個 function 並執行，就是添加 Test 這個 component。
    :::
    
    #### 若是多個 component 呢？
    
    ```
    // 載入所有元件
    // 參考 ElementUI 所寫，透過 forEach 把每個 component 都註冊一遍。
    
    import BaseButton from ‘./BaseButton/index.vue’
    import BaseCheckbox from ‘./BaseCheckbox/index.vue’
    import BaseInput from ‘./BaseInput/index.vue’

    const Components = [
     BaseButton, BaseCheckbox, BaseInput
    ]
    const install = function (Vue, opts = {}) {
     Components.forEach(component => {
       Vue.component(component.name, component)
     })
    }
    export default {
     install
    }
    ```
6. 設定 package.json

    ```
    "name": "vue-npm-test-10", 
        // npm package 的名稱 
        // 如果npm程式庫裡的專案撞名會導致上傳失敗
    "version": "0.1.1",
        // 版本號，每次發佈都要大於過去的版本
    "main": "dist/vue-npm-test-10.common.js",
        // 主要的檔案入口
    ```
    :::info
    ```
    // 設定腳本執行
    
    "scripts": {
        "serve": "vue-cli-service serve",
        "build": "vue-cli-service build --target lib --name vue-npm-test-10 ./src/components/index.js",
        "build:doc": "vue-cli-service build ./src/main.js --dest docs --mode development",
        "lint": "vue-cli-service lint"
    },
    "files": [
        "dist/*",
        "src/*",
        "public/*"
    ],
    ```
    :::

7. 打包 yarn build

    :::info
    每次的檔案變動及更新都要 build 一次 更新dist資料夾裡的檔案
    並且更新 version
    :::
    
8. npm login 輸入帳號密碼email
    ###### npm whoami // 確認身份

9. npm publish

    :::info
    推送至npm資料庫
    目前踩了兩個坑
    1. 確認 npm 帳號的信箱是否驗證過
    2. 專案名是否已被使用
    :::

    