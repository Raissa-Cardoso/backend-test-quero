<template>
    <main>
        <h1>Cadastro de nova matrícula</h1>
            <form action="" method="">
                <div class="divForm">
                    <label for="amount">Valor total do curso em reais:</label>
                    <input type="text" id="amount"  v-model="amount"/>
                </div>
                <div class="divForm">
                    <label for="installments">Quantidade de faturas:</label>
                    <input type="text" id="installments"  v-model="installments"/>
                </div>
                <div class="divForm">
                    <label for="dueDay">Dia de vencimento das faturas:</label>
                    <input type="text" id="dueDay"  v-model="dueDay"/>  
                </div>
                <div class="divForm">
                    <label for="studentID">ID do aluno:</label>
                    <input type="text" id="studentID"  v-model="studentID"/>  
                </div>
                <div class="divButtons">
                    <div class="buttonCreate">                    
                        <button v-on:click="create">Cadastrar</button>
                    </div>
                    <div class="buttonBack">                    
                        <button>
                            <router-link to="/enrollmentsRead">Voltar</router-link> 
                        </button>
                    </div>
                </div>
            </form>                  
    </main>
 </template>
 
 <script>
 import api from '@/services/api.js'
 

 export default {
     name: 'EnrollmentsCreate',
     data(){
        return {
            amount:"",
            installments:"",
            dueDay:"",
            studentID:""            
        }
     },
     methods: {
        create: function(){             
            api.post('/enrollments', 
            {
                amount:this.amount,
                installments:this.installments,
                due_day:this.dueDay,
                student_id:this.studentID
            })
            window.open("/enrollmentsRead")
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