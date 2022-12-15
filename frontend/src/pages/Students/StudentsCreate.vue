<template>
    <main>
        <h1>Cadastro de novo aluno</h1>
            <form action="" method="">
                <div class="divForm">
                    <label for="name">Nome:</label>
                    <input type="text" id="name" />
                </div>
                <div class="divForm">
                    <label for="cpf">CPF:</label>
                    <input type="text" id="cpf" />
                </div>
                <div class="divForm">
                    <label for="birthdate">Data de nascimento:</label>
                    <input type="text" id="birthdate" />  
                </div>
                <div class="divForm">
                    <label for="payment_method">Método de pagamento:</label>
                    <input type="text" id="payment_method" />  
                </div>
                <div class="divButtons">
                    <div class="buttonCreate">                    
                        <button>Cadastrar</button>
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
     name: 'StudentsCreate'
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