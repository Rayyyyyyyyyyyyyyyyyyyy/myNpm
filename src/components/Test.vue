<template>
<div class="inputBox">
  <label for="enterSomething">Enter something</label>
  <input type="text" name="" id="enterSomething" class="input" v-model="inputText">
</div>

<p>{{ inputText }}</p>
</template>

<script>
import {defineComponent, reactive, toRefs} from "vue";

export default defineComponent({
  name: "Test",
  setup(){
    const state = reactive({
      inputText: ""
    })
    return{
      ...toRefs(state)
    }

  },
  
})
</script>

<style scoped>
.inputBox{
  display: flex;
  flex-direction: column;
  align-items: center;
}

.input{
  width: 240px;
  padding: 16px;
  font-size: 24px;
  border: 1px solid rgb(129, 127, 127);
  border-radius: 10px;
}
</style>
