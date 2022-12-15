<template>
    <main>
        <h1>Alterar/Deletar matrícula</h1>
            <form action="" method="">
                <div class="divForm">
                    <label for="enrollmentId">ID da matŕicula:</label>
                    <p id="enrollmentId"></p>
                </div>
                <div class="divForm">
                    <label for="enrollmentAmount">Valor total do curso em reais:</label>
                    <input type="text" id="enrollmentAmount" />
                </div>
                <div class="divForm">
                    <label for="installments">Quantidade de faturas:</label>
                    <input type="text" id="installments" />
                </div>
                <div class="divForm">
                    <label for="dueDay">Dia de vencimento das faturas:</label>
                    <input type="text" id="dueDay" />  
                </div>
                <div class="divForm">
                    <label for="studentID">ID do aluno:</label>
                    <input type="text" id="studentID" />  
                </div>
                <div class="divButtons">
                    <div class="buttonUpdate">                    
                        <button>Alterar</button>
                    </div>
                    <div class="buttonDelete">                    
                        <button>Deletar</button>
                    </div>
                    <div class="buttonBack">                    
                        <button>Voltar</button>
                    </div>
                </div>
            </form>                  
    </main>
 </template>
 
 <script>
 //import api from '@/services/api.js'
 //import axios from 'axios';

 export default {
     name: 'EnrollmentsUpdateDelete'
 }
   /*  data(){
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
    }*/
 </script>
 
 <style scoped>     
     @media (max-width:700px){
         #principal{
             font-size: 1.5em;
         }
     }
     
 
 </style>