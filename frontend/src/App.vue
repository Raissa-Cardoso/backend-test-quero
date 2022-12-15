<template>
  <div id="app">
    <HeaderComponent/>
    <!--<HomePage/>-->
    <!--<StudentsRead/>-->    
    <BillsRead/>

  </div>
</template>

<script>
import './styles/global.css'

import HeaderComponent from './components/HeaderComponent'
//import HomePage from './pages/HomePage'
//import StudentsRead from './pages/Students/StudentsRead.vue'
import BillsRead from './pages/Bills/BillsRead.vue'

export default {
  name: 'App',
  components: {
    HeaderComponent,
    //HomePage,
    //StudentsRead
    BillsRead
  }
}
</script>


