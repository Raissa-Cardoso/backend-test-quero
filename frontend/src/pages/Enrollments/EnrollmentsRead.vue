<template>
    <main>
        <h1 id="principal">Matrículas</h1>
        <div class="tableHeader">
            <div class="tableSearch">
                <input type="text" placeholder="Digite o ID da Matrícula" v-model="enrollmentId"/>
                <button type="submit" v-on:click="search">Filtrar</button>
            </div>          
        </div>
        <div class="divTable">
            <table className='enrollmentsTable'>
                <thead>
                    <tr>
                        <th>ID da matrícula</th>
                        <th>Valor total do curso em reais</th>
                        <th>Quantidade de faturas</th>
                        <th>Dia de vencimento das faturas</th>                   
                        <th>ID do aluno</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(enrollment,index) in enrollmentsFilter" :key="index">
                        <td>{{enrollment.id}} </td>
                        <td>{{enrollment.amount}}</td>
                        <td>{{enrollment.installments}}</td>
                        <td>{{enrollment.due_day}}</td>
                        <td>{{enrollment.student_id}}</td>                                                         
                    </tr>
                </tbody>                   
            </table>      
        </div>
    </main>
 </template>
 
 <script>
 //import api from '@/services/api.js'
 import axios from 'axios';

 export default {
     name: 'EnrollmentsRead',
     data(){
        return {
            enrollments:[],
            enrollmentsFilter:[],
            enrollmentId:'', 
            enrollmentIdInt:''            
        }
     },
     async mounted(){
        await axios({method: 'get',url:'http://localhost:3000/api/v1/enrollments',
            headers: {
                ContentType:"application/json"                
            }, 
            data:{
                "page":1,
                "count":3
            }
            }).then(response=>{
                this.enrollments=response.data;                
            })
     },
     methods: {
        search: function(){                      
            if (this.enrollmentId!==""){
                this.enrollmentIdInt=parseInt(this.enrollmentId)  
                this.enrollmentsFilter=this.enrollments.filter(enrollment=>enrollment.id===this.enrollmentIdInt)            
            } else{
                this.enrollmentsFilter=this.enrollments 
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
 