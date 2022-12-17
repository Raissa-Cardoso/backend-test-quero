<template>
  <div id="app">
    <HeaderComponent/>
    <router-view/>    
  </div>
</template>

<script>
import './styles/global.css'

import HeaderComponent from './components/HeaderComponent'


export default {
  name: 'App',
  components: {
    HeaderComponent   
  }
}
</script>


