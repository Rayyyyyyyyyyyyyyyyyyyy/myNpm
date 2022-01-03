import Test from "./Test.vue"

Test.install = function(Vue) {
    Vue.component("vue-Test", Test)

}

export default Test