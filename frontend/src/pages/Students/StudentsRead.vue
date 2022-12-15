<template>
    <main>
        <h1 id="principal">Alunos</h1>
        <div class="tableHeader">
            <div class="tableSearch">
                <input type="text" placeholder="Digite o ID do Aluno" v-model="studentId"/>
                <button type="submit" v-on:click="search">Filtrar</button>
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
                        <td>{{student.id}} </td>
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
 //import api from '@/services/api.js'
 import axios from 'axios';

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
     async mounted(){
        await axios({method: 'get',url:'http://localhost:3000/api/v1/students',
            headers: {
                ContentType:"application/json"                
            }, 
            data:{
                "page":1,
                "count":3
            }
            }).then(response=>{
                this.students=response.data;
                console.log(this.students)
            })
     },
        /*api.get('/students',{
            data:{
                    "page":1,
                    "count":3
                }
        }).then(response=>{
            this.students=response.data;
            console.log(this.students)
        })
     }*/
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
 