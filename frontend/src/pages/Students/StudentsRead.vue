<template>
    <main>
        <h1 id="principal">Alunos</h1>
        <div class="tableHeader">
            <div class="tableSearch">
                <input type="text" placeholder="Digite o ID do Aluno" v-model="studentId"/>
                <button type="submit" v-on:click="search">Filtrar</button>
            </div> 
            <div class="create">                        
                <button>
                    <router-link to="/studentsCreate">Criar novo</router-link>                     
                </button>
            </div>         
        </div>
        <div class="divTable">
            <table className='studentsTable'>
                <thead>
                    <tr>
                        <th>ID do aluno</th>
                        <th>Nome do aluno </th>
                        <th>CPF</th>
                        <th>Data de nascimento </th>                   
                        <th>Método de pagamento</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(student,index) in studentsFilter" :key="index">
                        
                        <td> <router-link :to="`/studentsUpdateDelete/${student.id}`">{{student.id}}</router-link></td>
                        <td>{{student.name}}</td>
                        <td>{{student.cpf}}</td>
                        <td>{{student.birthdate}}</td>
                        <td>{{student.payment_method}}</td>                                                         
                    </tr>
                </tbody>                   
            </table>      
        </div>
    </main>
 </template>
 
 <script>
 import api from '@/services/api.js';

 export default {
     name: 'StudentsRead',
     data(){
        return {
            students:[],
            studentsFilter:[],
            studentId:'', 
            studentIdInt:''            
        }
     },
     mounted(){  
        api.get('/students').then(response=>{
            this.students=response.data;  
            this.studentsFilter=response.data;                     
        })
     },   
     methods: {
        search: function(){                      
            if (this.studentId!==""){
                this.studentIdInt=parseInt(this.studentId)  
                this.studentsFilter=this.students.filter(student=>student.id===this.studentIdInt)            
            } else{
                this.studentsFilter=this.students 
            }
        }
     }
    }
 </script>
 
 <style scoped>
     @media (max-width:700px){
         #principal{
             font-size: 1.5em;
         }
     }
     
 
 </style>
 