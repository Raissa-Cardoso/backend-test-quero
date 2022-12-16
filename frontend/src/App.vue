<template>
  <div id="app">
    <HeaderComponent/>
    <router-view/>
    <!--<HomePage/>-->
    <!--<StudentsRead/>-->
    <!--<StudentsCreate/>-->
    <!--<StudentsUpdateDelete/>-->
    <!--<BillsRead/>-->
    <!--<EnrollmentsRead/>-->
    <!--<EnrollmentsCreate/>-->
    <!--<EnrollmentsUpdateDelete/>-->
  </div>
</template>

<script>
import './styles/global.css'

import HeaderComponent from './components/HeaderComponent'
//import HomePage from './pages/HomePage'
//import StudentsRead from './pages/Students/StudentsRead'
//import StudentsCreate from './pages/Students/StudentsCreate';
//import StudentsUpdateDelete from './pages/Students/StudentsUpdateDelete';
//import BillsRead from './pages/Bills/BillsRead'
//import EnrollmentsRead from './pages/Enrollments/EnrollmentsRead';
//import EnrollmentsCreate from './pages/Enrollments/EnrollmentsCreate'
//import EnrollmentsUpdateDelete from './pages/Enrollments/EnrollmentsUpdateDelete';


export default {
  name: 'App',
  components: {
    HeaderComponent,
    //HomePage,
    //StudentsRead
    //StudentsCreate
    //StudentsUpdateDelete
    //BillsRead
    //EnrollmentsRead
    //EnrollmentsCreate
    //EnrollmentsUpdateDelete
  }
}
</script>


