<template>
    <main>
        <h1>Alterar/Deletar matrícula</h1>
            <form action="" method="">
                <div class="divForm">
                    <label for="enrollmentId">ID da matŕicula:</label>
                    <p id="enrollmentId">{{this.enrollment.id}}</p>
                </div>
                <div class="divForm">
                    <label for="amount">Valor total do curso em reais:</label>
                    <input type="text" id="amount" v-model="amount" placeholder={{this.enrollment.amount}}/>
                </div>
                <div class="divForm">
                    <label for="installments">Quantidade de faturas:</label>
                    <input type="text" id="installments" v-model="installments" placeholder={{this.enrollment.installments}}/>
                </div>
                <div class="divForm">
                    <label for="dueDay">Dia de vencimento das faturas:</label>
                    <input type="text" id="dueDay" v-model="dueDay" placeholder={{this.enrollment.dueDay}}/>  
                </div>
                <div class="divForm">
                    <label for="studentID">ID do aluno:</label>
                    <input type="text" id="studentID" v-model="studentID" placeholder={{this.enrollment.studentID}}/>  
                </div>
                <div class="divButtons">
                    <div class="buttonUpdate">                    
                        <button v-on:click="update">Alterar</button>
                    </div>
                    <div class="buttonDelete">                    
                        <button v-on:click="toDelete">Deletar</button>
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
     name: 'EnrollmentsUpdateDelete',
     data(){
        return {
            enrollment:[],
            id:this.$route.params.id,            
            amount:"",
            installments:"",
            dueDay:"",
            studentID:""                        
        }
     },
     mounted(){  
        api.get(`/enrollments/${this.id}`).then(response=>{
            this.enrollment=response.data.data;
            this.id=this.enrollment.id
            this.amount=this.enrollment.amount
            this.installments=this.enrollment.installments
            this.dueDay=this.enrollment.due_day
            this.studentID=this.enrollment.student_id 
        })
     },   
     methods: {       
        update: function(){                                 
            api.put(`/enrollments/${this.id}`, 
            {
                amount:this.amount,
                installments:this.installments,
                due_day:this.dueDay,
                student_id:this.studentID              
            })
        },
        toDelete: function(){                                 
            api.delete(`/enrollments/${this.id}`, 
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