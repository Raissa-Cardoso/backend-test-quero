<template>
    <main>
        <table className='students_table'>
            <thead>
                <tr>
                    <th>ID do aluno</th>
                    <th>Nome do aluno </th>
                    <th>CPF</th>
                    <th>Data de nascimento </th>                   
                    <th>Meio de pagamento das faturas</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(student,index) in students" :key="index">
                    <td>:student.id </td>
                    <td>:student.name</td>
                    <td>:student.cpf</td>
                    <td>:student.birthdate</td>
                    <td>:student.payment_method</td>                                                         
                </tr>
            </tbody>                   
        </table>      
    </main>
 </template>
 
 <script>
 import api from '@/services/api.js'

 export default {
     name: 'StudentsRead',
     data(){
        return {
            students:[]
        }
     },
     mounted(){
        api.get('/students').then(response=>{
            this.students=response.data;
            console.log(this.students)
        })
     }
 }
 </script>
 
 <style scoped>
     main{
         background-color: var(--color-background-home);
     }
     @media (max-width:700px){
         #principal{
             font-size: 1.5em;
         }
     }
     
 
 </style>
 